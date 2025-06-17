//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2024 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

#include <errno.h>
#include <fcntl.h>
#include <nuttx/config.h>
#include <nuttx/leds/userled.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <sys/ioctl.h>
#include <unistd.h>

#define LED_DEVPATH "/dev/userleds"

const int LEDS_PRIORITY = CONFIG_EXAMPLES_LEDS_PRIORITY;
const int LEDS_STACKSIZE = CONFIG_EXAMPLES_LEDS_STACKSIZE;

static bool g_led_daemon_started = false;

static void sigterm_action(int signo, siginfo_t *siginfo, void *arg) {
  if (signo == SIGTERM) {
    printf("SIGTERM received\n");
    g_led_daemon_started = false;
    printf("led_daemon: Terminated.\n");
  } else {
    printf("\nsigterm_action: Received signo=%d siginfo=%p arg=%p\n", signo,
           (void *)siginfo, arg);
  }
}

int led_daemon(int argc, char *argv[]) {
  userled_set_t supported = 0;
  userled_set_t ledset = 0;
  bool incrementing = true;

  struct sigaction act = {.sa_sigaction = sigterm_action,
                          .sa_flags = SA_SIGINFO};

  sigemptyset(&act.sa_mask);
  sigaddset(&act.sa_mask, SIGTERM);

  if (sigaction(SIGTERM, &act, NULL) != 0) {
    printf("Failed to install SIGTERM handler, errno=%d\n", errno);
    return EXIT_FAILURE;
  }

  pid_t mypid = getpid();
  g_led_daemon_started = true;
  printf("\nled_daemon (pid# %d): Running\n", mypid);

  printf("led_daemon: Opening %s\n", CONFIG_EXAMPLES_LEDS_DEVPATH);
  int fd = open(CONFIG_EXAMPLES_LEDS_DEVPATH, O_WRONLY);
  if (fd < 0) {
    printf("led_daemon: ERROR: Failed to open %s: %d\n",
           CONFIG_EXAMPLES_LEDS_DEVPATH, errno);
    g_led_daemon_started = false;
    return EXIT_FAILURE;
  }

  int ret = ioctl(fd, ULEDIOC_SUPPORTED, (unsigned long)&supported);
  if (ret < 0) {
    printf("led_daemon: ERROR: ioctl(ULEDIOC_SUPPORTED) failed: %d\n", errno);
    close(fd);
    g_led_daemon_started = false;
    return EXIT_FAILURE;
  }

  printf("led_daemon: Supported LEDs 0x%x\n", supported);
  supported &= CONFIG_EXAMPLES_LEDS_LEDSET;

  while (g_led_daemon_started) {
    userled_set_t newset = 0;
    userled_set_t tmp = 0;

    if (incrementing) {
      tmp = ledset;
      while (newset == ledset) {
        tmp++;
        newset = tmp & supported;
      }

      if (newset == 0) {
        incrementing = false;
        continue;
      }
    } else {
      if (ledset == 0) {
        incrementing = true;
        continue;
      }

      tmp = ledset;
      while (newset == ledset) {
        tmp--;
        newset = tmp & supported;
      }
    }

    ledset = newset;
    printf("led_daemon: LED set 0x%x\n", ledset);

    ret = ioctl(fd, ULEDIOC_SETALL, (unsigned long)ledset);
    if (ret < 0) {
      printf("led_daemon: ERROR: ioctl(ULEDIOC_SETALL) failed: %d\n", errno);
      close(fd);
      g_led_daemon_started = false;
      return EXIT_FAILURE;
    }

    usleep(500 * 1000);
  }

  close(fd);
  return EXIT_SUCCESS;
}