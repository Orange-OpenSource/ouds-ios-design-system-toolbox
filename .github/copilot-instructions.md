# OUDS iOS Design System Toolbox app - GitHub Copilot Instructions

This file provides guidance to GitHub Copilot when working on this repository.
It covers contributor and maintainer guidelines: code formatting, architecture, build process, best practices, ecodesign, accessibility, development requirements, build commands and review guidelines.

## 1. Project Overview

OUDS means Orange Unified Design System and is the new cohesive and unified design system for Orange Group.
It provides a Swift Package and a demo application (this repository) called Design System Tooblox which embeds the Swift Package to expose its public API.
The project is open source under MIT license and hosted on GitHub in Orange-OpenSource organization.
The products support iOS 15, iPadOS 15, macOS 15, visionOS 1, watchOS 11 and tvOS 16.
The products are written in Swift with SwiftUI as UI framework and Swift 6 (format, grammar and concurrency).

## 2. Vocabulary

- *tokenator*: an internal tool which uses Figma specifications exported as JSON to convert them and send through pull requests the Swift code for tokens
- *token*: variable containing a value in most of cases defined by *tokenator*
- *raw token*: a family of tokens which have for value a raw type value like String, Int, or CGFloat
- *semantic token*: a family of tokens which point to raw tokens and bring meanings in their name, used inside components
- *component tokens*: a family of tokens for some components if semantic tokens are not enough, and have for values semantic tokens
- *theme*: a set of tokens, assets like fonts and images, to use in app to style it and change their look and feels
- *tuning*: some small configuration elements for a theme like rounded corners
- *token provider*: an object in a theme gathering tokens (semantics and components)
- *component*: mainly a SwiftUI view with specific features and layouts like buttons, switch, link etc.

## 3. Code formating

The source code is formatted for Swift 6.2. Configuration of formater is in `.swiftformat` and linter in `.swiftlint`.

## 4. Project structure

### 4.1 DesignToolbox

Contains the sources of the Design System Toolbox app for iOS, iPadOS, macOS and visionOS.

### 4.2 DesignToolboxUITests

Contains the sources of UI tests to run on simulators or devices making tests on components and navigating between pages.

### 4.3 DesignToolboxSnapshotTests

Contains the sources of snapshots tests, i.e. unit tests where there are comparisons of the tokens and components looks and feels using screen rendering.

### 4.4 DesignToolboxUnitTests

Contains the sources of some unit tests.

### 4.5 DesignToolbox (Light)

Contains source code of the design toolbox app but only for watchOS and tvOS as a light version with few configurations possibilities and more catalogs of components displayed in one time.

## 5. Architecture details

The Design System Toolbox is quite simple and must be usable in iOS, iPadOS, macOS, visionOS and watchOS.

### 5.1 Pages

Here are the "views" of the app displaying the tokens and components, gathered by components and tokens, and with folder in higher level depending to navigation.

### 5.2 Utils

Here are some utilities, extensions and objects to sued everywhere in the app.

### 5.3 Resources

Here are assets, images, HTML files like legal notices and fonts.

## 6. Architecture guidelines

- SwiftUI is the default UI paradigm - embrace its declarative nature
- Avoid legacy UIKit patterns and unnecessary abstractions
- Focus on simplicity, clarity, and native data flow
- Let SwiftUI handle the complexity - don't fight the framework
- Organize by components, keeps things isolated
- Keep related code together in the same file when appropriate
- Use extensions to organize large files
- Follow Swift naming conventions consistently

## 7. Build verification process

**IMPORTANT**: When editing code, you MUST:
1. Format the sources
2. Build the project after making changes
3. Fix any compilation errors before proceeding
4. Run the tests
5. Run the linter and fix any warnings and errors

## 8. Best practices

### 8.1 DO

- Write documentation in Swift DocC format for public API
- Use Swift's type system for safety
- Use public modifier only when needed, prefer internal or private
- **IMPORTANT**: The project supports iOS 26 SDK while maintaining iOS 15 as the minimum deployment target. Use `#available` checks when adopting iOS 15+ APIs.
- **IMPORTANT**: Use `#available` checks when adopting watchOS 11.6+ APIs.
- **IMPORTANT**: Use `#available` checks when adopting visionOS 1.3+ APIs.
- **IMPORTANT**: Use `#available` checks when adopting macOS 15.6+ APIs.
- **IMPORTANT**: Use `#available` checks when adopting tvOS 16.6+ APIs.
- **IMPORTANT**: The project runs for iOS / iPadOS, macOS, visionOS abd watchOS. Use `#if os` checks to compile only code avaialble for specific API
- If a third party dependency is added or updated, update the Software Bill of Material
- If a third party dependency is added or updated, update the 3rd parties list in the Design System Toolbox
- Apply Clean Code, DRY, SOLID and TDD principes

### 8.1 DON'T

- Add abstraction layers without clear benefit
- Use Combine for simple async operations
- Overcomplicate simple features
- Use UIKit except for some specific API related to accessibility if needed

## 9. Development requirements

- Minimum Swift 6.2 (e.g. Swigt 6.2.3)
- Xcode 26.3 or later 
- Minimum deployment: iOS 15.0, iPad0S 15.0, macOS 15.6, visionOS 1.3, watch0S 11.6, tvOS 16.6
- Apple Developer account for device testing

## 10. Building commands

### 10.1 Building Design System Toolbox app

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

To build the Design System Toolbox app for tvOS:
```shell
bundle exec fastlane tv build_debug
```

### 10.2 Run tests

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

### 10.3 Check dead code

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
bundle exec fastlane watch check_dead_code
```

To check for dead code for tvOS:
```shell
bundle exec fastlane tv check_dead_code
```

### 10.4 Format the sources

To format the source code:
```shell
bundle exec fastlane format
```

### 10.5 Run linter

To run the linter:
```shell
bundle exec fastlane lint
```

### 10.6 heck leaks

To check for leaks of secrets:
```shell
bundle exec fastlane check_leaks
```

### 10.7 Software Bill Of Materiels update

To update the Software Bill of Materials:
```shell
bundle exec fastlane update_sbom
```

### 10.8 3rd parties list update

To update the list of dependencies used in the app:
```shell
bundle exec fastlane update_3rd_parties
```

### 10.9 Update build number

To update the build number of the app:
```shell
bundle exec fastlane update_build_number
```

## 11. Review guidelines

- [ ] Check if sources are formatted
- [ ] Run linter, no error must appear
- [ ] Run tests, they must all pass
- [ ] Check if there is dead coden and leave a comment saying the elements which seem toi be dead / not used
- [ ] Build documentation, no error must appear
- [ ] Check leaks, no leak must appear
- [ ] Check if functions are too long or too complicated,  must be low
- [ ] Check if the commit has been designed-off (i.e. DCO appplied) by all commits authors

## 12. Ecodesign basics 🟡 RECOMMENDED

### 12.1 Animations

- Use native / system animations if animations must be used

### 12.2 Bad patterns

- Prefer pull to refresh instead of inifinite scroll
- Avoid autocompletion if iot makes network requests

### 12.3 Cache

- For heavy objects or costly objects to compute (data from networks, date formatters, etc.), use cache like `NSCache`
- For HTTP requests, use also HTTP cache

### 12.4 CPU

- Distribute tasks across different threads to free the CPU up as soon as possible
- Don't use the CPU unnecessarily
- Use app lifecycle to stop background tasks

### 12.5 Downlaods

- Avoid automatic download
- Prefer download on Wifi networks

### 12.6 Energy

- Never ignore low energy mode
- If this mode is enabled, disable animations, instensive tasks, display of images and videos, cellular connections, HD / 4K (and above) features, use low colors instead of high (overall on Android with AMOLED screens)
- Avoid forcing the brightness to maximum

### 12.7 Fonts

- Prefer system fonts if possible, but in OUDS context use still the view modifiers and provided typography
- use WOFF2 otherwise

### 12.8 Network connections

- Prefer wired and Wi-Fi connections to cellular connections
- If using a cellular connection, group requests as much as possible to avoid the device constantly being connected to the cell tower
- Use data caching and Gzip compression
- Avoid periodic polling to prevent rapid battery drain
- Avoid maintaining connections; services like Apple Push Notifications and Firebase Cloud Messaging can help

### 12.9 Notifications

- Reduce as much as possible use of notifications

### 12.10 OS support

- Support iOS 15

### 12.11 Resources

- Use SGV images, otherwise use SF Symbols
- Prefer MP3 for sounds
- Prefer lazy loading of resources
- Prefer low resolutions for videos

### 12.12 Screens

- Manage at least small screen like the iPhone SE 2026 one (i.e. 4 inch)

### 12.13 UI

- With dark mode implementation, use true dark colors (e.g. #00000000)

### 12.14 Web views

- Avoid use of web views

## 13. Accessibility basics 🔴 MANDATORY

Everything is available on [our guidelines](https://a11y-guidelines.orange.com/fr/mobile/ios/developpement)

### 13.1 Colors and texts

- For dark mode, reduce contrasts to avoid halo effects
- Prefer WCAG AAA 7:1 ratio for normal text (ratio between text and backgrounds)
- Prefer WCAG AAA 4.5:1 ratio for larhe text (ratio between text and backgrounds)
- Otherwise apply WCAG AA 4.5:1 for normal text and 3:1 on large text (more than 24 px or 19 px if bold)

### 13.2 Components

- Do not forge to define accessibility hint, label, value and if needed trait

### 13.3 Dates and figures

- For texts or figures, define the suitable accessibility value with formatter (like `DateFormatter`) to fully vocalize content for the user with its locale

### 13.4 Dipslay

- Do not force app in portrait mode
- APp must be usable in landscape mode

### 13.5 Haptics

- Use haptics / vibrations when data are loaded, error occured elements have been tapped / activated, etc

### 13.6 Medias

- Avoid autoplay of videos
- Define accessibilty labels for images if they are not decorative, otherwise hide them from Voice Over

### 13.7 User settings

- If accessibilty settings reduce animations, reduce animations
- If accessibilty settings reduce haptics, reduce haptics

### 13.8 Texts

- Texts must not have frozen size, they must adapt following the dynamic type
