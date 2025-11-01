fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### format

```sh
[bundle exec] fastlane format
```

Run SwiftFormat to format Swift source files according to the local configuration and apply source header template.

### lint

```sh
[bundle exec] fastlane lint
```

Run SwiftLint in strict mode to detect code smells using local configuration for app, snapshots, units and UI tests

### update_3rd_parties

```sh
[bundle exec] fastlane update_3rd_parties
```

Run LicensePlist to update list of third-parties to embed in app

### check_leaks

```sh
[bundle exec] fastlane check_leaks
```

Run GitLeaks to look for leaks of secrets in project and Git history

### update_sbom

```sh
[bundle exec] fastlane update_sbom
```

Generates a SBOM (Software Bill Of Materials) in SPDX JSON format with Syft and analyse it with Grype to as to look for vulnerabilities

### update_build_number

```sh
[bundle exec] fastlane update_build_number
```

UPDATE BUILD NUMBER WITH TIMESTAMP

----


## iOS

### ios check_dead_code

```sh
[bundle exec] fastlane ios check_dead_code
```

Run Periphery to look for dead code in the code base. Avoid strict mode because some false positive remains and command must be fine-tuned.

### ios test_snapshots

```sh
[bundle exec] fastlane ios test_snapshots
```

Run snapshots tests in the demo app to look for visual regressions of components defined in OUDS package

### ios test_ui

```sh
[bundle exec] fastlane ios test_ui
```

Run UI tests in the demo app to check some specific components behaviors

### ios test_unit

```sh
[bundle exec] fastlane ios test_unit
```

Run Unit tests in the demo app to check some specific components behaviors

### ios build_debug

```sh
[bundle exec] fastlane ios build_debug
```

Build locally the demo app in debug mode without upload

### ios build_alpha

```sh
[bundle exec] fastlane ios build_alpha
```

Build the demo app in alpha mode and upload to TestFlight

### ios build_beta

```sh
[bundle exec] fastlane ios build_beta
```

Build the demo app in beta mode and upload to TestFlight

### ios build_stable

```sh
[bundle exec] fastlane ios build_stable
```

Build the demo app in stable mode and, if defined, upload to internal portal for App Store publication

----


## Mac

### mac check_dead_code

```sh
[bundle exec] fastlane mac check_dead_code
```

Run Periphery to look for dead code in the code base. Avoid strict mode because some false positive remains and command must be fine-tuned.

### mac build_debug

```sh
[bundle exec] fastlane mac build_debug
```

Build locally the demo app in debug mode without upload

----


## vision

### vision check_dead_code

```sh
[bundle exec] fastlane vision check_dead_code
```

Run Periphery to look for dead code in the code base. Avoid strict mode because some false positive remains and command must be fine-tuned.

### vision build_debug

```sh
[bundle exec] fastlane vision build_debug
```

Build locally the demo app in debug mode without upload

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
