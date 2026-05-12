# Install Embedded Swift

Get the tools needed to use Embedded Swift

## Overview

The best way to install Swift for embedded development is using [`swiftly`](http://github.com/swiftlang/swiftly), the official Swift toolchain installer and manager. Since Embedded Swift is still experimental and not yet supported in public Swift releases, you'll need to use a development toolchain.

For instructions on how to install `swiftly`, check out the [Getting Started](https://www.swift.org/swiftly/documentation/swiftly/getting-started) guide.

> Note: Swiftly installs the latest release toolchain during `swiftly init`, if you only plan on using Embedded Swift, you can avoid downloading this toolchain by using the `swiftly init --skip-install` option. 

After installing Swiftly, install the latest main "Development Snapshot" toolchain available for your platform by running:

```shell
$ swiftly install main-snapshot
...
main-snapshot-2025-04-12 installed successfully!
```

To test that you have Swift installed, run `swift --version` from your shell or terminal app. It should say "6.2-dev", meaning you have a "Development Snapshot" toolchain.

```shell
$ swift --version
Apple Swift version 6.2-dev (LLVM 81ab6d9f7e4810f, Swift 9cc1947527bacea)
Target: arm64-apple-macosx15.0
Build config: +assertions
```

> Warning: When using other shells, like one integrated into an IDE, be careful to verify that the version of Swift reported matches that of the shell you used to install Swift.
