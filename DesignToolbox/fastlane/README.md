fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios check_dead_code

```sh
[bundle exec] fastlane ios check_dead_code
```

RUN PERIPHERY FOR DEAD CODE ANALYSIS

### ios format

```sh
[bundle exec] fastlane ios format
```

RUN SWIFT FORMAT TO FORMAT SOURCES

### ios lint

```sh
[bundle exec] fastlane ios lint
```

RUN SWIFT LINT TO CHECK SMELLS

### ios update_build_number

```sh
[bundle exec] fastlane ios update_build_number
```

UPDATE BUILD NUMBER WITH TIMESTAMP

### ios test_snapshots

```sh
[bundle exec] fastlane ios test_snapshots
```

RUN SNAPSHOTS TESTS BY TRIGGERING THE TESTS PLANS OF THE PROJECT

### ios test_ui

```sh
[bundle exec] fastlane ios test_ui
```

RUN UI TESTS BY TRIGGERING THE TESTS PLANS OF THE PROJECT

### ios buildDebugApp

```sh
[bundle exec] fastlane ios buildDebugApp
```

BUILD DEBUG APP

### ios alpha

```sh
[bundle exec] fastlane ios alpha
```

BUILD & UPLOAD TO TESTFLIGHT ALPHA APP

### ios beta

```sh
[bundle exec] fastlane ios beta
```

BUILD & UPLOAD TO TESTFLIGHT BETA APP

### ios prod

```sh
[bundle exec] fastlane ios prod
```

BUILD & UPLOAD TO STORE (if set in options: upload) PROD APP

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
