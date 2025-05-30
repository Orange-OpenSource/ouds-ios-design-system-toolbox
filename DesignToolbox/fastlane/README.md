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

Run Periphery to look dor dead code in the code base. Avoid strict mode because some false positive remains and command must be fine-tuned.

### ios format

```sh
[bundle exec] fastlane ios format
```

Run SwiftFormat to format Swift source files according to the local configuration.

### ios lint

```sh
[bundle exec] fastlane ios lint
```

Run SwiftLint in strict mode to detect code smells

### ios update_3rd_parties

```sh
[bundle exec] fastlane ios update_3rd_parties
```

Run LicensePlist to update list of third-parties

### ios check_leaks

```sh
[bundle exec] fastlane ios check_leaks
```

Run GitLeaks to look for leaks of secrets in project and Git history

### ios update_sbom

```sh
[bundle exec] fastlane ios update_sbom
```

Generates a SBOM (Software Bill Of Materials) in SPDX JSON format with Syft and analyse it with Grype to as to check for vulnerabilities

### ios update_build_number

```sh
[bundle exec] fastlane ios update_build_number
```

UPDATE BUILD NUMBER WITH TIMESTAMP

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

### ios buildDebugApp

```sh
[bundle exec] fastlane ios buildDebugApp
```

Build locally the demo app in debug mode without upload

### ios alpha

```sh
[bundle exec] fastlane ios alpha
```

Build the demo app in alpha mode and upload to TestFlight

### ios beta

```sh
[bundle exec] fastlane ios beta
```

Build the demo app in neta mode and upload to TestFlight

### ios stable

```sh
[bundle exec] fastlane ios stable
```

Build the demo app in stable mode and, if defined, upload to internal portal for App Store publication

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
