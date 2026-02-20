#include "Support.h"

#ifdef RP2040
#include <stdint.h>
#include <stdbool.h>

// RP2040 SIO spinlocks: 32 locks, each at SIO_BASE + 0x100 + 4*SPINLOCK_ID
#define SIO_BASE             0xD0000000u
#define SIO_SPINLOCK_BASE    (SIO_BASE + 0x00000100u)
#define SPINLOCK_ID          0u  // spinlock 0 reserved for our runtime

// Get a pointer to the spinlock register for our chosen SPINLOCK_ID.
static inline volatile uint32_t *spinlock_reg(void) {
    return (volatile uint32_t *)(SIO_SPINLOCK_BASE + 4u * SPINLOCK_ID);
}

// Disable peripheral interrupts and return previous state to restore later.
static inline uint32_t save_and_disable_irqs(void) {
    // The Cortex-M PRIMASK register is responsible for enabling/disabling
    // all peripheral interrupts.
    uint32_t primask;
    __asm volatile ("mrs %0, primask" : "=r"(primask)); // copy the previous PRIMASK
    __asm volatile ("cpsid i");                         // disable interrupts
    return primask;                                     // return previous PRIMASK
}

// Restore previous peripheral interrupts
static inline void restore_irqs(uint32_t primask) {
    // Restore previous PRIMASK
    __asm volatile ("msr primask, %0" :: "r"(primask));
}

// Acquire the RP2040 hardware spinlock.
static inline void spinlock_acquire(void) {
    volatile uint32_t *lock = spinlock_reg();
    // According to the datasheet (table 79, section 2.3), reading returns 0
    // if not acquired, else non-zero
    while (*lock == 0u) {
        // busy wait
        __asm volatile ("nop");
    }
}

// Release the spinlock.
static inline void spinlock_release(void) {
    // According to the datasheet (table 79, section 2.3), writing any value
    // releases the lock
    *spinlock_reg() = 0u;
}

// Data Memory Barrier (DMB) instruction to ensure memory ordering.
// Ensure memory operations' order is preserved across the barrier
// (both by the compiler and the CPU).
static inline void dmb(void) {
  __asm volatile ("dmb" ::: "memory");
}

// Integer values for __ATOMIC_*:
// 0 RELAXED, 1 CONSUME, 2 ACQUIRE, 3 RELEASE, 4 ACQ_REL, 5 SEQ_CST
// `clang -dM -E - < /dev/null | grep __ATOMIC_`
static inline int is_acquire(int mo) { return mo == 1 || mo == 2 || mo == 4 || mo == 5; }
static inline int is_release(int mo) { return mo == 3 || mo == 4 || mo == 5; }

// Atomic fetch and add, fetch and sub, load, and store for 32-bit values.

uint32_t __atomic_fetch_add_4(volatile uint32_t *p, uint32_t v, int memorder) {
    if (is_release(memorder)) dmb();
    uint32_t irq = save_and_disable_irqs();
    spinlock_acquire();
    uint32_t old = *p;
    *p = old + v;
    spinlock_release();
    restore_irqs(irq);
    if (is_acquire(memorder)) dmb();
    return old;
}

uint32_t __atomic_fetch_sub_4(volatile uint32_t *p, uint32_t v, int memorder) {
    if (is_release(memorder)) dmb();
    uint32_t irq = save_and_disable_irqs();
    spinlock_acquire();
    uint32_t old = *p;
    *p = old - v;
    spinlock_release();
    restore_irqs(irq);
    if (is_acquire(memorder)) dmb();
    return old;
}

uint32_t __atomic_load_4(volatile uint32_t *p, int memorder) {
    if (memorder == 5) dmb();
    uint32_t irq = save_and_disable_irqs();
    spinlock_acquire();
    uint32_t val = *p;
    spinlock_release();
    restore_irqs(irq);
    if (is_acquire(memorder)) dmb();
    return val;
}

void __atomic_store_4(volatile uint32_t *p, uint32_t v, int memorder) {
    if (is_release(memorder)) dmb();
    uint32_t irq = save_and_disable_irqs();
    spinlock_acquire();
    *p = v;
    spinlock_release();
    restore_irqs(irq);
    if (memorder == 5) dmb();
}
#endif