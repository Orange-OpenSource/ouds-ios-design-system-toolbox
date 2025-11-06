# Agents.md

This file provides guidance to AI coding agents when working with code in this repository or with OUDS iOS products.

## Project Overview

OUDS means Orange Unified Design System and is the new cohesive and unified design system for Orange Group.
It provides a Swift Package and a demo application (this repository) called Design System Tooblox which embeds the Swift Package to expose its public API.
The project is open source under MIT license and hosted on GitHub in Orange-OpenSource organization.
The products support iOS 15, iPadOS 15, macOS 15, visionOS 1 and watchOS 11.
The products are written in Swift with SwiftUI as UI framework and Swift 6 (format, grammar and concurrency).

## Vocabulary

- *tokenator*: an internal tool which uses Figma specifications exported as JSON to convert them and send through pull requests the Swift code for tokens
- *token*: variable containing a value in most of cases defined by *tokenator*
- *raw token*: a family of tokens which have for value a raw type value like String, Int, or CGFloat
- *semantic token*: a family of tokens which point to raw tokens and bring meanings in their name, used inside components
- *component tokens*: a family of tokens for some components if semantic tokens are not enough, and have for values semantic tokens
- *theme*: a set of tokens, assets like fonts and images, to use in app to style it and change their look and feels
- *tuning*: some small configuration elements for a theme like rounded corners
- *token provider*: an object in a theme gathering tokens (semantics and components)

## Code formating

The source code is formatted for Swift 6.2. Configuration of formater is in `.swiftformat` and linter in `.swiftlint`.

## Project structure

### DesignToolbox

Contains the sources of the Design System Toolbox app

### DesignToolboxUITests

Contains the sources of UI tests to run on simulators or devices making tests on components and navigating between pages.

### DesignToolboxSnapshotTests

Contains the sources of snapshots tests, i.e. unit tests where there are comparisons of the tokens and components looks and feels using screen rendering.

### DesignToolboxUnitTests

Contains the sources of some unit tests.

## Architecture details

The Design System Toolbox is quite simple and must be usable in iOS, iPadOS, macOS and visionOS.

### Pages

Here are the "views" of the app displaying the tokens and components, gathered by components and tokens, and with folder in higher level depending to navigation.

### Utils

Here are some utilities, extensions and objects to sued everywhere in the app.

### Resources

Here are assets, images, HTML files like legal notices and fonts.

## Architecture guidelines

- SwiftUI is the default UI paradigm - embrace its declarative nature
- Avoid legacy UIKit patterns and unnecessary abstractions
- Focus on simplicity, clarity, and native data flow
- Let SwiftUI handle the complexity - don't fight the framework
- Organize by components, keeps things isolated
- Keep related code together in the same file when appropriate
- Use extensions to organize large files
- Follow Swift naming conventions consistently

## Build verification process

**IMPORTANT**: When editing code, you MUST:
1. Format the sources
2. Build the project after making changes
3. Fix any compilation errors before proceeding
4. Run the tests
5. Run the linter and fix any warnings and errors

## Best practices

### DO

- Write documentation in Swift DocC format for public API
- Use Swift's type system for safety
- Use public modifier only when needed, prefer internal or private
- **IMPORTANT**: The project supports iOS 26 SDK while maintaining iOS 15 as the minimum deployment target. Use `#available` checks when adopting iOS 15+ APIs.
- **IMPORTANT**: Use `#available` checks when adopting watchOS 11.6+ APIs.
- **IMPORTANT**: Use `#available` checks when adopting visionOS 1.3+ APIs.
- **IMPORTANT**: Use `#available` checks when adopting macOS 15.6+ APIs.
- **IMPORTANT**: The project runs for iOS / iPadOS, macOS, visionOS abd watchOS. Use `#if os` checks to compile only code avaialble for specific API
- If a third party dependency is added or updated, update the Software Bill of Material
- If a third party dependency is added or updated, update the 3rd parties list in the Design System Toolbox
- Apply Clean Code, DRY, SOLID and TDD principes

### DON'T

- Add abstraction layers without clear benefit
- Use Combine for simple async operations
- Overcomplicate simple features
- Use UIKit except for some specific API related to accessibility if needed

## Development requirements

- Minimum Swift 6.2
- Xcode 26 or later 
- Minimum deployment: iOS 15.0, iPad 0S 15.0, macOS 15.6, visionOS 1.3, watch0S 11.6
- Apple Developer account for device testing

## Building commands

### Building Design System Toolbox app

To build the Design System Toolbox app for iOS and iPadOS:
```shell
bundle exec fastlane ios build_debug
```

To build the Design System Toolbox app for macOS:
```shell
bundle exec fastlane mac build_debug
```

To build the Design System Toolbox app for visionOS:
```shell
bundle exec fastlane vision build_debug
```

To build the Design System Toolbox app for watchOS:
```shell
bundle exec fastlane watch build_debug
```

### Run tests

To run the snapshot tests (only supported for iOS):
```shell
bundle exec fastlane ios test_snapshots
```

To run the UI tests (only supported for iOS):
```shell
bundle exec fastlane ios test_ui
```

To run the unit tests (only supported for iOS):
```shell
bundle exec fastlane ios test_unit
```

### Check dead code

To check for dead code for iOS and iPadOS:
```shell
bundle exec fastlane iOS check_dead_code
```

To check for dead code for macOS:
```shell
bundle exec fastlane mac check_dead_code
```

To check for dead code for visionOS:
```shell
bundle exec fastlane vision check_dead_code
```

To check for dead code for watchOS:
```shell
bundle exec fastlane vision check_dead_code
```

### Format the sources

To format the source code:
```shell
bundle exec fastlane format
```

### Run linter

To run the linter:
```shell
bundle exec fastlane lint
```

### Check leaks

To check for leaks of secrets:
```shell
bundle exec fastlane check_leaks
```

### Software Bill Of Materiels update

To update the Software Bill of Materials:
```shell
bundle exec fastlane update_sbom
```

### 3rd parties list update

To update the list of dependencies used in the app:
```shell
bundle exec fastlane update_3rd_parties
```

### Update build number

To update the build number of the app:
```shell
bundle exec fastlane update_build_number
```

## Code samples

### Import OUDS product

Import OUDS umbrella product gathering all other librairies:
```swift
import OUDSSwiftUI
```

### Instanciate a theme object

Create a theme for Orange product:
```swift
    let theme = OrangeTheme()
```

### Inject a theme in an app

Use an `OUDSThemeableView` to inject the theme:

```swift
OUDSThemeableView(theme: theme) {

}
```

### Get the theme object

Get the theme object as environement object:
```swift
@Environment(\.theme) private var theme
```

### Use tokens from theme

Use colors (semantic tokens) defined in a theme:
```swift
theme.colors
```

Use borders (semantic tokens) defined in a theme:
```swift
theme.borders
```

Use fonts (semantic tokens) defined in a theme:
```swift
theme.fonts
```

Use sizes (semantic tokens) defined in a theme:
```swift
theme.sizes
```

Use spaces (semantic tokens) defined in a theme:
```swift
theme.spaces
```

Use dimensions (semantic tokens) defined in a theme:
```swift
theme.dimensions
```

Use elevations (semantic tokens) defined in a theme:
```swift
theme.elevations
```

Use grids (semantic tokens) defined in a theme:
```swift
theme.grids
```

Use opacities (semantic tokens) defined in a theme:
```swift
theme.opacities
```