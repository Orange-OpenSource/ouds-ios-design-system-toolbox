# OUDS iOS design system toolbox changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased](https://github.com/Orange-OpenSource/ouds-ios/compare/2.3.0...develop)

### Added

- [Library] `OUDSAsyncImage` API for cached `AsyncImage` and use inside `list item` components (Orange-OpenSource/ouds-ios#1681)
- [Library] Leading, trailing and bottom slots for `list item` components (Orange-OpenSource/ouds-ios#1568)
- [Library] `OUDSAsyncImage` API for cached `AsyncImage` and use inside `list item` components (#1681)
- [Library] Helpers to apply OUDS styles for rich text (Orange-OpenSource/ouds-ios#1682)
- [DesignToolbox] `typography` components (Orange-OpenSource/ouds-ios#1679)
- [Library] `typography` components (Orange-OpenSource/ouds-ios#1580)
- [Library] `static list item` and `navigation list item` components (Orange-OpenSource/ouds-ios#265)
- [Library] `linear progress indicator` component (Orange-OpenSource/ouds-ios#1509) 
- [Library] `circular progress indicator` component (Orange-OpenSource/ouds-ios#409)
- [DesignToolbox] Sandbox / debug view for experiments and easy debugging
- [DesignToolbox] Support of `tvOS` in Design System Toolbox app and keep `watchOS` on light app (Orange-OpenSource/ouds-ios#1480)
- [Library] `Tab view` component to use SwiftUI `Tab` API (Orange-OpenSource/ouds-ios#1452)
- [Library] `View modifier` to force keyboard closing on tap (Orange-OpenSource/ouds-ios#1530)
- [Library] `View modifier` to apply theme on Liquid Glass SwiftUI `TabView` (Orange-OpenSource/ouds-ios#1459)
- [Library] `View modifier` to add custom accessibility traits inside `text area` component (Orange-OpenSource/ouds-ios#1597)
- [Library] Flag to let `link` component take full width (Orange-OpenSource/ouds-ios#1576)
- [Library] Component tokens for `accordions`, `progress indicators` and `typography` components (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)
- [Library] Semantic tokens of `colors` dedicated to AI (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579) 
- [Library] Components tokens for `list item` (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)
- [Library] Components tokens for `button` dedicated to AI (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)

### Changed

- [Library] `password input` component to version 1.3.1 (Orange-OpenSource/ouds-ios#1526)
- [Library] `text input` component to version 1.4.1 (Orange-OpenSource/ouds-ios#1524)
- [Library] `linear progress indicator` component to version 1.2.0 (Orange-OpenSource/ouds-ios#1674)
- [Library] `progress indicator` components to version 1.2.0 (Orange-OpenSource/ouds-ios#1674)
- [Library] `text area` component to version 1.2.1 (Orange-OpenSource/ouds-ios#1527)
- [Library] `button` component to version 3.3.0 (Orange-OpenSource/ouds-ios#1583)
- [DesignToolbox] Swift Package `accessibility-statement-lib-ios` to v2.4.0-beta.1
- [Library] **BREAKING**: `link` component to v2.4.0 (Orange-OpenSource/ouds-ios#1640)
- [Library] `suggestion chip` and `filter chip` components to v1.5.0 (Orange-OpenSource/ouds-ios#1588)
- [Library] **BREAKING**: `link` component to v2.3.0 (Orange-OpenSource/ouds-ios#1589)
- [Library] Detection of forced legacy layout for navigation elements
- [Library] **BREAKING**: `.neutral` and `.accent` `badge icon status` signatures
- [Library] **BREAKING**: `.neutral` and `.accent` `alert status` parameter name
- [Library] **BREAKING**: `.icon` and `.textAndIcon` layouts for `chip picker data` object
- [Library] `elevation` semantic tokens for `Orange`, `Orange Compact`, `Sosh` and `Wireframe` themes (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)
- [Library] `color` semantic tokens for `Orange`, `Orange Compact`, `Sosh` and `Wireframe` themes (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)
- [Library] `link` component tokens for `Sosh` theme (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)
- [Library] `button` component tokens for `Orange Compact` theme (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)
- [Library] `alert` component tokens for `Sosh` and `Wireframe` themes (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)
- [Library] `text input` component tokens for `Sosh` theme (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)
- [Library] `text area` component tokens for `Orange`, `Orange Compact`, `Sosh` and `Wireframe` themes (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)
- [Library] **BREAKING**: Components token for `tag` component  (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)
- [Library] **BREAKING**: Components token for `link` component  (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)
- [Library] **BREAKING**: Components token for `icon` component  (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)
- [Library] **BREAKING**: Components token for `button` component  (tokens library v2.6.0) (Orange-OpenSource/ouds-ios#1579)

### Fixed

- [DesignToolbox] Use of asset for typography heading marker (Orange-OpenSource/ouds-ios#1689)
- [DesignToolbox] Adjust title color on toolbar bar top when content color change (Orange-OpenSource/ouds-ios#1563)
- [DesignToolbox] Status picker of progress indicators not disabled if colored surface enabled
- [DesignToolbox] Vocalization with `Voice Over` of badges for tab bar demo (Orange-OpenSource/ouds-ios#1227)
- [Library] `Voice Over` announcement of displayed `alert` component (Orange-OpenSource/ouds-ios#1491)
- [Library] Usage of `PIN code input` with *Full Keyboard Access* (Orange-OpenSource/ouds-ios#1631)
- [Library] Usage of `password input` with *Full Keyboard Access* (Orange-OpenSource/ouds-ios#1562)
- [Library] Usage of `text input` with *Full Keyboard Access* (Orange-OpenSource/ouds-ios#1562)
- [Library] Vocalization priority for `alert message` components and usage with *Full Keyboard Access* (Orange-OpenSource/ouds-ios#1564)
- [Library] `PIN code input` component usage with Voice Over (Orange-OpenSource/ouds-ios#1529)
- [Library] Missing `badges` on `toolbar top` component for app on iOS 27 with Xcode 26.5 and disabled Liquid Glass configuration (Orange-OpenSource/ouds-ios#1623)
- [Library] Missing "core_common_back" localized string for `back` button of `toolbar top` component (Orange-OpenSource/ouds-ios#1577)
- [Library] For `alert` components, add default vocalisation on "info" status (Orange-OpenSource/ouds-ios#1561)
- [Library] Icon assets for unordered `bullet list` item not displayed (Orange-OpenSource/ouds-ios#1615)

### Removed

- [Library] **BREAKING**: `forceOUDSLegacyTabBar` and `OUDSLegacyTabBarModifier`, for `forceOUDSLegacyLayout` and `OUDSLegacyLayoutModifier`
- [Library] **BREAKING**: Deprecated `OUDSBadge` API
- [Library] **BREAKING**: Deprecated type `OUDSIcon`
- [Library] **BREAKING**: Deprecated initializers for `button`, `checkbox`, `chips`, `radio`, `switch`, `checkbox`, `text input`, `badge`, `link`, `tag` components
- [Library] **BREAKING**: Component tokens of `control item` component (Orange-OpenSource/ouds-ios#1579)
- [Library] **BREAKING**: Component tokens of `expand link` component (Orange-OpenSource/ouds-ios#1579)

## [2.3.0](https://github.com/Orange-OpenSource/ouds-ios/compare/2.2.0...2.3.0) - 2026-07-09

### Added

- [Library] Open API to use easily fixed and scaled icons, and interactions layers (Orange-OpenSource/ouds-ios#1569)
- [Library] Skill to create local theme
- [Library] Use of original image possible for components with icons (Orange-OpenSource/ouds-ios#1511)
- [Library] Migration skill for AI agents
- [Library] View modifier to fill colors on `Shape`
- [Library] Helper to register local fonts configurations for custom themes

### Changed

- [DesignToolbox] Ruby Gem `fastlane` from v2.236.1 to v2.237.0
- [DesignToolbox] Ruby Gem `json` from v2.19.8 to v2.19.9
- [DesignToolbox] GitHub Action `github/codeql-action/upload-sarif` from v4.36.1 to 4.37.0 for `scorecard` workflow
- [DesignToolbox] GitHub Action `ruby/setup-ruby` from v1.313.0 to v1.316.0 for all workflow
- [DesignToolbox] GitHub Action `actions/checkout` from v6.0.3 to v7.0.0 for all workflow

### Deprecated

- [Library] Components with several configuration parameters for images (Orange-OpenSource/ouds-ios#1511)

## [2.2.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/2.1.0...2.2.0) - 2026-06-18

### Added

- [Library] Use of original image possible for components with icons (Orange-OpenSource/ouds-ios#1511)
- [Library] Helper to forge a font object with OUDS typography tokens (Orange-OpenSource/ouds-ios#1550)
- [Library] Flag to limit the height of the `text area` component (Orange-OpenSource/ouds-ios#1528)
- [Library] `View modifier` for fonts using only token (Orange-OpenSource/ouds-ios#1534)
- [DesignToolbox] Alert to notify the user an update is available in App Store (Orange-OpenSource/ouds-ios#1548)

### Changed

- [DesignToolbox] `fastlane` Ruby gem from v2.235.0 to v2.236.1
- [DesignToolbox] `json` Ruby gem from v2.19.8 to v2.19.9
- [DesignToolbox] `ruby/setup-ruby` GitHub Action from v1.310.0 to v1.313.0 for `build-and-test` workflow
- [DesignToolbox] `github/codeql-action/upload-sarif` GitHub Action from v4.36.1 to v4.36.2 for `scorecard` workflow 
- [Library] `badge` components with dedicated API and version 1.3 for `badge icon` (Orange-OpenSource/ouds-ios#1439)

### Fixed

- [Library] `tab bar` layout is broken for iOS 27 (Orange-OpenSource/ouds-ios#1557)
- [DesignToolbox] Wording key displayed in fonts page for `watchOS` and `tvOS` (Orange-OpenSource/ouds-ios#1553)
- [Library] Label and description of `alert message` component not vocalized together (Orange-OpenSource/ouds-ios#1552)

### Deprecated

- [Library] `badge` umbrella component managing the three variants (Orange-OpenSource/ouds-ios#1439)

## [2.1.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/2.0.0...2.1.0) - 2026-06-03

### Changed

- [DesignToolbox] Accessibility statement library v2.3.0
- [DesignToolbox] `checkout` action from v6.0.2 to v6.0.3 in workflows
- [DesignToolbox] `gitleaks/gitleaks-action` action to v3.0.0 for `gitleaks` workflow
- [DesignToolbox] `json` gem from v2.19.5 to v2.19.8
- [DesignToolbox] `Ruby` version from v4.0.3 to v4.0.5 for `build-and-test` workflow
- [DesignToolbox] `fastlane` gem from v2.233.1 to v2.235.0
- [DesignToolbox] `actions/dependency-review-action` action to v5.0.0 for `dependency-review` workflow
- [DesignToolbox] `ruby/setup-ruby` action from v1.306.0 to v1.310.0 for `build-and-test` workflow
- [Library] `text area` component (Orange-OpenSource/ouds-ios#1448)
- [Library] `text input` component typography with label moderate typography for texts (Orange-OpenSource/ouds-ios#1446)
- [Library] `password input` component typography with label moderate typography for texts (Orange-OpenSource/ouds-ios#1443)
- [Library] `PIN code input` component with new typography (Orange-OpenSource/ouds-ios#1444)
- [Library] `tag` component with label medium moderate typography for text (Orange-OpenSource/ouds-ios#1449)
- [Library] `filter chip` and `suggestion chip` components with label medium moderate typography for text (Orange-OpenSource/ouds-ios#1441)
- [Library] `input tag` component with label medium moderate typography for text (Orange-OpenSource/ouds-ios#1450)
- [DesignToolbox] Mutualize description of enums options of the configuration used by pickers (Orange-OpenSource/ouds-ios#1493)

## [2.0.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/1.4.0...2.0.0) - 2026-05-07

### Added

- [Library] Rich text support for `alert message`, `bullet list`, `switch item`, `radio item`, `checkbox item`, `text area`, `text input`, `password input`, `PIN code input` components (Orange-OpenSource/ouds-ios#1405)
- [Library] `badge` on `toolbar` components items with icons (Orange-OpenSource/ouds-ios#1398)
- [DesignToolbox] Search feature for tokens and components groups (iOS 26+ with Liquid Glass) (Orange-OpenSource/ouds-ios#1451)

### Changed

- [DesignToolbox] `github/codeql-action/upload-sarif` action from v4.35.2 to v4.35.3 for `scorecard` workflow
- [DesignToolbox] `Ruby` version from v4.0.2 to v4.0.3 for `build-and-test` workflow
- [DesignToolbox] `fastlane` gem from v2.232.2 to v2.233.1
- [DesignToolbox] `json` gem from v2.19.3 to v2.19.5
- [DesignToolbox] `ruby/setup-ruby` action from v1.301.0 to v1.306.0 for `build-and-test` workflow
- [DesignToolbox] Accessibility statement library v2.2.0
- [DesignToolbox] Liquid Glass status tag in about menu with management of iOS until 18 case
- [Library] `link` component to center the indicator on multiline (Orange-OpenSource/ouds-ios#1482)
- [DesignToolbox] Move from Xcode 26.3 to Xcode 26.4, and Swift 6.2 to Swift 6.3 (Orange-OpenSource/ouds-ios#1356)
- [Library] Update of tokens (tokens librairies v2.5.0) (Orange-OpenSource/ouds-ios#1473)
- [DesignToolbox] Use `accessibility-statement-lib-ios` v2.2.0-beta.3
- [Library] Update of tokens (tokens librairies v2.4.0) (Orange-OpenSource/ouds-ios#1437)

### Fixed

- [Library] Overlay items of `tab bar` component still displayed even if hidden for disabled Liquid Glass for deep navigations app (Orange-OpenSource/ouds-ios#1490)
- [Library] Missing error vocalization with Voice Over for `switch item` component (Orange-OpenSource/ouds-ios#1484)
- [DesignToolbox] Redirection page for stable builds in about page (Orange-OpenSource/ouds-ios#1457)
- [Library] Overlay items of `tab bar` component still displayed even if hidden for disabled Liquid Glass (Orange-OpenSource/ouds-ios#1434)
- [Library] Selected tab indicator in `tab bar` component if Liquid Glass not applied (Orange-OpenSource/ouds-ios#1428)

## [1.4.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/1.3.0...1.4.0) - 2026-04-16

### Added

- [Library] Support of disabled `Liquid Glass` for `tab bar` and `toolbar` components (Orange-OpenSource/ouds-ios#1408)
- [Library] `toolbar top` and `toolbar bottom` components (Orange-OpenSource/ouds-ios#1174)
- [Library] `text area` component (Orange-OpenSource/ouds-ios#543)
- [Library] `PIN code input` component (Orange-OpenSource/ouds-ios#998)
- [Library] `borderDefault()` view modifier helper to apply a default border using default tokens from the current theme (Orange-OpenSource/ouds-ios#1379)
- [Library] `LocalizedStringKey` and `Bundle` initializers for components using `String` for texts and accessibility labels (Orange-OpenSource/ouds-ios#1366)
- [Library] `oudsTintColor` view modifier helper to apply tint color from a `MultipleColorSemanticToken` (Orange-OpenSource/ouds-ios#1370)
- [Library] `verbose` flag on `OUDSLogger` to suppress debug and log messages by default (Orange-OpenSource/ouds-ios#1365)

### Changed

- [DesignToolbox] `ruby/setup-ruby` action from v1.2960 to v1.301.0 for `build-and-test` workflow
- [DesignToolbox] `github/codeql-action/upload-sarif` action from v4.34.1 to v4.35.2 for `scorecard` workflow
- [DesignToolbox] `actions/upload-artifact` action from v7.0.0 to v7.0.1 for `scorecard` workflow
- [DesignToolbox] `tab bar` component initialization (Orange-OpenSource/ouds-ios#1373)
- [Library] Optimization of public API (frozen structs and enums, inlinable properties) (Orange-OpenSource/ouds-ios#1382)
- [DesignToolbox] Use short description for components pages (Orange-OpenSource/ouds-ios#1286)
- [Library] Update illustrations in documentation for `alert message` component (Orange-OpenSource/ouds-ios#1359)
- [Library] View modifiers and methods prefixed by `ouds` are replaced by same names without such `ouds` (Orange-OpenSource/ouds-ios#1346)
- [DesignToolbox] Move from Xcode 26.2 to Xcode 26.3 (Orange-OpenSource/ouds-ios#1375)

### Fixed

- [Library] Vocalization and management of focus for `PIN code input` component (Orange-OpenSource/ouds-ios#1409)
- [Library] Accessibility label for `alert` components for `warning` and `negative` statuses (Orange-OpenSource/ouds-ios#1407)
- [Library] Accessibility hint for double-tap to unselect action for `filter chip` component (Orange-OpenSource/ouds-ios#1277)
- [DesignToolbox] Display of accessibility label for buttons, chips and badge components sample code (Orange-OpenSource/ouds-ios#1378)

## [1.3.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/1.2.0...1.3.0) - 2026-03-26

### Added
 
- [Library] View helpers to use scaled spaces tokens to add padding and to create HStack/VStack (Orange-OpenSource/ouds-ios#1324)
- [Library] Helper to apply grid margin (Orange-OpenSource/ouds-ios#1317)
- [Library] `inline alert` component (Orange-OpenSource/ouds-ios#1307)
- [Library] `alert message` component (Orange-OpenSource/ouds-ios#1159)

### Changed

- [DesignToolbox] `fastlane` gem from v2.232.1 to v2.232.2
- [DesignToolbox] `json` RubyGem from v2.18.1 to v2.19.3
- [DesignToolbox] `Ruby` version from v4.0.1 to v4.0.2 for `build-and-test` workflow
- [DesignToolbox] `ruby/setup-ruby` action to v1.288.0 for `build-and-test` workflow
- [DesignToolbox] `actions/upload-artifact` action from v6.0.0 to v7.0.0 for `scorecard` workflow
- [DesignToolbox] `actions/dependency-review-action` action to v4.9.0 for `dependency-review` workflow
- [DesignToolbox] `github/codeql-action/upload-sarif` action to v4.34.1 for `scorecard` workflow
- [Library] `alert message` component with new label colors (Orange-OpenSource/ouds-ios#1342)
- [DesignToolbox] Files for agentic AI (Orange-OpenSource/ouds-ios#1341)
- [DesignToolbox] In the design toolbox, use grid margin helper (Orange-OpenSource/ouds-ios#1299)
- [Library] Update Bullet list API to rename unordered icon to asset (Orange-OpenSource/ouds-ios#1326)
- [DesignToolbox] Use of updated `bullet list` component API ("unordered icon" to "unordered asset") (Orange-OpenSource/ouds-ios#1326)
- [DesignToolbox] Update wording keys (Orange-OpenSource/ouds-ios#1325)
- [Library] Signatures of control-item-based components (Orange-OpenSource/ouds-ios#1314)

### Fixed

- [Library] Size of loader for `button` component (Orange-OpenSource/ouds-ios#1296)
- [Library] Size of the bullet for unordered and bare `bullet list` components (Orange-OpenSource/ouds-ios#1300)
- [Library] Size of the bullet for unordered and bare bullet list component (Orange-OpenSource/ouds-ios#1300)

## [1.2.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/1.1.0...1.2.0) - 2026-02-13

### Added

- [Library] `password input` component (Orange-OpenSource/ouds-ios#997)
- [Library] `bullet list` component (Orange-OpenSource/ouds-ios#513)

### Changed

- [DesignToolbox] `ruby/setup-ruby` action from v1.286.0 to v1.288.0 for `build-and-test` workflow
- [DesignToolbox] `github/codeql-action/upload-sarif` action for `scorecard` workflow
- [DesignToolbox] `json` RubyGem from v2.18.0 to v2.18.1
- [DesignToolbox] Update `fastlane` gem from v2.231.1 to v2.232.1
- [DesignToolbox] Rename of *Orange Business Tools*  theme to *Orange Compact* (Orange-OpenSource/ouds-ios#1292)

## [1.1.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/1.0.0...1.1.0) - 2026-01-27

### Added

- [Library] Add flag to let `button` takes the screen full width (Orange-OpenSource/ouds-ios#1252)
- [Library] Stop animation of switch if defined in accessibility settings (Orange-OpenSource/ouds-ios#660)
- [Library] Display in logs components versions

### Changed

- [DesignToolbox] Update `fastlane` gem from v2.229.1 to v2.231.1
- [DesignToolbox] `ruby/setup-ruby` action from v1.271.0 to v1.286.0 for `build-and-test` workflow
- [DesignToolbox] `Ruby` version from v3.4.8 to v4.0.1 for `build-and-test` workflows
- [DesignToolbox] `github/codeql-action/upload-sarif` action for `scorecard` workflow
- [DesignToolbox] Update GitHub Actions `checkout` action from v6.0.1 to v6.0.2
- [DesignToolbox] Accessibility statement library v2.1.1
- [DesignToolbox] Update `swift-snapshot-testing` from 1.18.1 to 1.18.7
- [DesignToolbox] Update components definitions using available DSM definitions (Orange-OpenSource/ouds-ios#1238)
- [DesignToolbox] Migration from Xcode 26.1 to Xcode 26.2
- [DesignToolbox] Migration from Xcode 26.0 to Xcode 26.1.1
- [Library] Unused `status` and `size` properties of `badge` component (count and icon variants) removed (Orange-OpenSource/ouds-ios#1233)
- [Library] Various cleanings in the documentation
- [Library] Update constants file with versions values in comments for documentation
- [Library] Display tokens librairies versions in themes Swift files
- [Library] **BREAKING**: Rename component tokens `buttonBorder*` to `border*`
- [Library] **BREAKING**: Rename some multiple token object (from plural to singular form)
- [Library] Use `DynamicTypeSize` instead of `ContentSizeCategory` (Orange-OpenSource/ouds-ios#1187)

### Fixed

- [DesignToolbox] ToolBar buttons for theme and color scheme indicators do not work anymore (Orange-OpenSource/ouds-ios#1244)
- [Library] Cycle in attribute graph with OUDS tab bar and Xcode 26.2 (Orange-OpenSource/ouds-ios#1247) (Orange-OpenSource/ouds-ios#1249)
- [DesignToolbox] Custom icon does not change on theme switch on `badge` and `tag` components pages (Orange-OpenSource/ouds-ios#1218)

## [1.0.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/0.22.0...1.0.0) - 2025-12-18

### Added

- [Library] `tab bar` component (Orange-OpenSource/ouds-ios#1135)
- [Library] `constrainedMaxWidth` parameter to control items and text input components (Orange-OpenSource/ouds-ios#1211)

### Changed

- [DesignToolbox] Update `net-http` gem from v0.8.0 to v0.9.1
- [DesignToolbox] `Ruby` version from v3.4.7 to v3.4.8 for `build-and-test` workflows
- [DesignToolbox] `actions/upload-artifact` action from v5.0.0 to v6.0.0 for `scorecard` workflow
- [DesignToolbox] `ruby/setup-ruby` action from v1.268.0 to v1.271.0 for `build-and-test` workflow
- [DesignToolbox] `json` RubyGem from v2.16.0 to v2.18.0
- [DesignToolbox] Update GitHub Actions `checkout` action from v6.0.0 to v6.0.1
- [DesignToolbox] `github/codeql-action/upload-sarif` action for `scorecard` workflow
- [DesignToolbox] Change TestFlight upload process to use `altool` (Orange-OpenSource/ouds-ios#1195)
- [DesignToolbox] Define timeout of 1 hour for all GitHub Actions workflows
- [DesignToolbox] Update wording keys and translations (Orange-OpenSource/ouds-ios#1200)
- [DesignToolbox] Use v1.4 icons with appropriate size in tab app bar items
- [DesignToolbox] Update color screen to display in list undefined (Orange-OpenSource/ouds-ios#1217)
- [DesignToolbox] Components illustrations (Orange-OpenSource/ouds-ios#1207)
- [DesignToolbox] Display versions using OUDS tag in about menu (Orange-OpenSource/ouds-ios#1203)
- [DesignToolbox] Display of colors and size semantic tokens (Orange-OpenSource/ouds-ios#1206)
- [Library] Color semantic tokens (Orange-OpenSource/ouds-ios#1206)
- [DesignToolbox] Define timeout of 2 hours for all GitHub Actions workflows
- [Library] Update icons to v1.4.0 (Orange-OpenSource/ouds-ios#1193)
- [DesignToolbox] Use the OUDS `tag` component to show the component design version in pages (Orange-OpenSource/ouds-ios#1176)
- [Library] Update `switch` components to v1.5.0 (Orange-OpenSource/ouds-ios#1138)
- [Library] Update `radio` components to v1.4.0 (Orange-OpenSource/ouds-ios#1139)
- [Library] Update `checkbox` components to v2.4.0 (Orange-OpenSource/ouds-ios#1137)
- [Library] Read only variant for `checkbox` and  `checkbox indeterminate` components (Orange-OpenSource/ouds-ios#1137)

### Fixed

- [Library] The warning icon for Orange theme is not the right one used on `tag` and `badge` (Orange-OpenSource/ouds-ios#1219)
- [Library] Icon not shown for negative `tag` and `badge` types (Orange-OpenSource/ouds-ios#1216)
- [Library] Set accessibility hint on placeholder if no helper text in `text input` (Orange-OpenSource/ouds-ios#1083)
- [Library] Separate label from trait, state, value and error message in `text input`, `checkbox`, `radio and `switch` (Orange-OpenSource/ouds-ios#1188)
- [DesignToolbox] `radio` and `switch` in read-only mode are still active (Orange-OpenSource/ouds-ios#1224)
- [Library] Missing accessibility label for badge `standard` and `count` types (Orange-OpenSource/ouds-ios#1060) (Orange-OpenSource/ouds-ios#1222)
- [Library] Set own accessibility label to trailing action in `TextInput` (Orange-OpenSource/ouds-ios#1087)
- [Library] Scale icons with information for tag and badge components (Orange-OpenSource/ouds-ios#1179) 

## [0.22.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/0.21.0...0.22.0) - 2025-11-28

### Added

- [Library] `bar` component tokens (Orange-OpenSource/ouds-ios#1169)
- [Library] `effect` raw and semantic tokens (Orange-OpenSource/ouds-ios#1169)
- [Library] Icon flip option for `text input` component trailing action (Orange-OpenSource/ouds-ios#1041)
- [Library] Icon flip option for `button` component (Orange-OpenSource/ouds-ios#1124)
- [DesignToolbox] Support for `watchOS` (Orange-OpenSource/ouds-ios#1110)
- [DesignToolbox] Support for `tvOS` (Orange-OpenSource/ouds-ios#1109)

### Changed

- [DesignToolbox] Update `net-http` gem from v0.7.0 to v0.8.0
- [DesignToolbox] `github/codeql-action/upload-sarif` action for `scorecard` workflow
- [DesignToolbox] `ruby/setup-ruby` action from v1.267.0 to v1.268.0 for `build-and-test` workflow
- [DesignToolbox] Update GitHub Actions `checkout` action from v5 to v6
- [DesignToolbox] Update `fastlane` gem from v2.228.0 to v2.229.1
- [Library] Add an accessible label for badge standard type (Orange-OpenSource/ouds-ios#1056)
- [Library] `Wireframe` theme `border` semantic tokens (tokens libraries System v2.3) (Orange-OpenSource/ouds-ios#1158)
- [Library] `size` semantic tokens (tokens libraries System v2.3) (Orange-OpenSource/ouds-ios#1158)
- [DesignToolbox] Use of Solaris and themed icons (Orange-OpenSource/ouds-ios#805) (Orange-OpenSource/ouds-ios#1127) 
- [Library] Update `badge` to use internal icons for some status (Orange-OpenSource/ouds-ios#1136)
- [DesignToolbox] Page of color semantic tokens (tokens libraries Core v1.9, System v2.2) 
- [Library] `color` semantic tokens (tokens libraries Core v1.9, System v2.2)
- [Library] `icon` component tokens (tokens libraries Core v1.9, System v2.2)
- [Library] `control item` component tokens (tokens libraries Core v1.9, System v2.2) 
- [DesignToolbox] `actions/dependency-review-action` action from v4.8.1 to v4.8.2 for `dependency-review` workflow
- [DesignToolbox] `json` RubyGem from v2.15.2 to v2.16.0
- [Library] `color` semantic tokens (tokens libraries Core v1.9, System v2.2)
- [Library] `icon` component tokens (tokens libraries Core v1.9, System v2.2)
- [Library] `control item` component tokens (tokens libraries Core v1.9, System v2.2) 
- [Library] Update `text input` to display the label on two lines and in the middle when no placeholder and one line at top otherwise (Orange-OpenSource/ouds-ios#1086) 

### Removed

- [DesignToolbox] `CocoaPods` tool (Orange-OpenSource/ouds-ios#1103)

### Fixed

- [Library] Switch control cannot be toggled by swipe (Orange-OpenSource/ouds-ios#995)
- [Library] Fonts and typography not applied (Orange, Sosh, Wireframe) on watchOS (Orange-OpenSource/ouds-ios#1142)
- [Library] Fonts and typography not applied (Orange, Sosh, Wireframe) on tvOS (Orange-OpenSource/ouds-ios#1145)
- [Library] Typography with line height token and dedicated line spacing and paddings (Orange-OpenSource/ouds-ios#594)
- [Library] `font` composite semantic tokens
- [Library] View modifiers for typography 
- [Library] `font` composite raw tokens
- [Library] Keyboard focus and VoiceOver focus issue on chip component (Orange-OpenSource/ouds-ios#914)
- [DesignToolbox] Missing or badly named parameters in code samples of components

## [0.21.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/0.20.0...0.21.0) - 2025-11-05

### Added

- [Library] Add umbrella Swift Package product to wrap all others (Orange-OpenSource/ouds-ios#1117)
- [DesignToolbox] GitHub Actions workflow to move the SNAPSHOT tag
- [DesignToolbox] Support of `visionOS` (Orange-OpenSource/ouds-ios#1102)
- [DesignToolbox] Support of `macOS` (Orange-OpenSource/ouds-ios#1102)
- [Library] `input tag` component (Orange-OpenSource/ouds-ios#917)
- [Library] Swift DocC tutorial (Orange-OpenSource/ouds-ios#919)

### Changed

- [DesignToolbox] `SwiftFormat/CLI` pod from v0.58.3 to v0.58.5
- [DesignToolbox] `actions/upload-artifact` action from v4.6.2 to v5.0.0 for `scorecard` workflow
- [DesignToolbox] `github/codeql-action/upload-sarif` action from v3 to v4 for `scorecard` workflow
- [DesignToolbox] `json` RubyGem from v2.15.1 to v2.15.2
- [DesignToolbox] `ruby/setup-ruby` action from v1.265.0 to v1.267.0 for `build-and-test` workflow
- [DesignToolbox] `SwiftLint` pod from v0.62.1 to v0.62.2
- [DesignToolbox] Update `net-http` gem from v0.6.0 to v0.7.0
- [DesignToolbox] Hide divider by default in `radio item`, `checkbox item` and `switch item` (Orange-OpenSource/ouds-ios#971)
- [Library] Update `button` component to version v3.2.0 (Orange-OpenSource/ouds-ios#1034)
- [Library] Standalone checkbox and radio button should have rounded corners with Sosh and Wireframe themes (Orange-OpenSource/ouds-ios#1079)
- [Library] Update `OUDSBadge` to version 1.2 (Orange-OpenSource/ouds-ios#1043)
- [Library] Update `badge` component to version v1.2.0 (Orange-OpenSource/ouds-ios#1043)
- [Library] Reduce number of imports by using higher level Swift Package product (Orange-OpenSource/ouds-ios#1117)
- [Library] Shorten names of raw, semantic and components tokens and associated modifiers (Orange-OpenSource/ouds-ios#1030)
- [DesignToolbox] Use `OUDSButton` in code sample panes (Orange-OpenSource/ouds-ios#1081)
- [DesignToolbox] Add missing semantic tokens of colors in list (Orange-OpenSource/ouds-ios#1084)
- [DesignToolbox] Change positions of color scheme and theme selectors (Orange-OpenSource/ouds-ios#1082)
- [Library] Update `radio item` to v1.3.0 (Orange-OpenSource/ouds-ios#1072)
- [Library] Update `switch item` to v1.4.0 (Orange-OpenSource/ouds-ios#1071)
- [Library] Update `checkbox item` to v2.3.0 (Orange-OpenSource/ouds-ios#1069)
- [Library] Provide predefined icons for `OUDSTag` components (Orange-OpenSource/ouds-ios#912)
- [Library] Update `OUDSTag` to 1.4 version (Orange-OpenSource/ouds-ios#1037)
- [Library] Update `OUDSTag` to 1.3 version (Orange-OpenSource/ouds-ios#945)
- [Library] Expose dimensions for pickers components (Orange-OpenSource/ouds-ios#1080)
- [DesignToolbox] Use `OUDSTextInput` in components configuration sections (Orange-OpenSource/ouds-ios#1059)
- [DesignToolbox] Update `link` component version (Orange-OpenSource/ouds-ios#1035)
- [Library] Apply new tokens library (v1.8.0) (Orange-OpenSource/ouds-ios#1070)
- [Library] Update `text input` to display error message if error, and display suffix/prefix even if placeholder empty (Orange-OpenSource/ouds-ios#1063)

### Removed

- [DesignToolbox] `periphery` workfow on GitHub Actions

### Fixed

- [Library] Apply rounded corners for hover and pressed states of radio button and checkbox components (Orange-OpenSource/ouds-ios#1078)

## [0.20.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/0.19.0...0.20.0) - 2025-10-15

### Added

- [Library] `text input` component (Orange-OpenSource/ouds-ios#406)
- [Library] `body moderate` and `label moderate` typography and tokens (Orange-OpenSource/ouds-ios#1003)
- [DesignToolbox] Use `Helvetica Neue Arabic` font family if arabic (Orange-OpenSource/ouds-ios#1006)
- [Library] Management of `Helvetica Neue Arabic` font family (Orange-OpenSource/ouds-ios#1006)
- [DesignToolbox] Color scheme selector (Orange-OpenSource/agUITesouds-ios#944)

### Changed

- [DesignToolbox] `actions/dependency-review-action` action from v4.7.3 to v4.8.1 for `dependency-review` workflow
- [DesignToolbox] `SwiftFormat/CLI` pod from v0.57.2 to v0.58.3
- [DesignToolbox] `ossf/scorecard-action` action from v2.4.2 to v2.4.3 for `scorecard` workflow
- [DesignToolbox] `json` RubyGem from v2.15.0 to v2.15.1
- [DesignToolbox] `github/codeql-action/upload-sarif` action from v3 to v4 for `scorecard` workflow
- [DesignToolbox] `ruby/setup-ruby` action from v1.263.0 to v1.265.0 for `build-and-test` and `periphery` workflows
- [DesignToolbox] `Ruby` version from v3.3 to v3.4.7 for `build-and-test` and `periphery` workflows
- [DesignToolbox] `SwiftLint` pod from v0.61.0 to v0.62.1
- [Library] Apply `Shantell Sans` font family for `Wireframe` theme instead of `Chalkboard SE` (Orange-OpenSource/ouds-ios#990)
- [Library] Icon for components catalog documentation (Orange-OpenSource/ouds-ios#1019)
- [Library] Tokens library v1.6 (Orange-OpenSource/ouds-ios#991)
- [Library] Improve README for onboarding and newcomers (Orange-OpenSource/ouds-ios#1005)
- [Library] Improve web documentation for onboarding and newcomers (Orange-OpenSource/ouds-ios#982)
- [DesignToolbox] Migration to Xcode 26.0
- [Library] Apply `Helvetica Neue` font family for themes `Orange`, `Orange Inverse` and `Orange Business Tools` (Orange-OpenSource/ouds-ios#965)

### Removed

- [Library] Button should be disabled in loading state (Orange-OpenSource/ouds-ios#988)
- [DesignToolbox] `Orange Inverse` theme (Orange-OpenSource/ouds-ios#1038)

## [0.19.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/0.18.0...0.19.0) - 2025-09-24

### Changed

- [DesignToolbox] Update `json` RubyGem from v2.13.2 to v2.15.2
- [DesignToolbox] Update `ruby/setup-ruby` GitHub Actions action from v1.257.0 to v1.263.0
- [Library] Button component `hierarchy` property renamed to `appearance` (Orange-OpenSource/ouds-ios#969)
- [DesignToolbox] Update `json` RubyGem from v2.13.1 to v2.13.2
- [DesignToolbox] Update various GitHub Actions workflows dependencies
- [DesignToolbox] Theme selector icon (Orange-OpenSource/ouds-ios#943)
- [DesignToolbox] [Library] Tuning of themes and theme selector (Orange-OpenSource/ouds-ios#951)

### Fixed

- [Library] Button in minimal hierarchy does not handle the hover state (Orange-OpenSource/ouds-ios#942)
- [Library] Vocalisation of badge with icons (Orange-OpenSource/ouds-ios#957)
- [Library] Badge component does not have bigger sizes if text sizes is increased (Orange-OpenSource#844)

## [0.18.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/0.17.0...0.18.0) - 2025-09-05

### Added

- [DesignToolbox] Generation of illustrations for App Store and documentation (Orange-OpenSource/ouds-ios#920)
- [Library] Illustrations in documentation (Orange-OpenSource/ouds-ios#666)
- [Library] Tag component (Orange-OpenSource/ouds-ios#408)

### Changed

- [DesignToolbox] Update `json` RubyGem from v2.13.1 to v2.13.2
- [DesignToolbox] Update GitHub Actions `checkout` action from v4 to v5
- [DesignToolbox] Update `SwiftLint` pod from v0.59.1 to v0.60.0
- [DesignToolbox] Migration to Xcode 16.4
- [DesignToolbox] Notifications for alpha, beta and stable builds (Orange-OpenSource/ouds-ios#899)
- [Library] Update API to use a specific size for count and icon badge types (Orange-OpenSource/ouds-ios#855)
- [DesignToolbox] [Library] Structure of components and files in repository (Orange-OpenSource/ouds-ios#908)
- [DesignToolbox] Use chip picker for selections in component screens configurations (Orange-OpenSource/ouds-ios#841)
- [Library] Chip version 1.3.0 (tokens library v1.5.0) (Orange-OpenSource/ouds-ios#906)
- [Library] Text input component tokens (tokens library v1.5.0) (Orange-OpenSource/ouds-ios#898)
- [Library] Link component tokens (tokens library v1.5.0) (Orange-OpenSource/ouds-ios#898)
- [Library] Button mono component tokens (tokens library v1.5.0) (Orange-OpenSource/ouds-ios#898)
- [Library] Button component tokens (tokens library v1.5.0) (Orange-OpenSource/ouds-ios#898)
- [Library] Button version 3.0.0 (add brand hierarchy and rounded property, update minimal variant) (Orange-OpenSource/ouds-ios#887)

### Fixed

- [DesignToolbox] URL of design system website in privacy policy page
- [DesignToolbox] Default badge type in badge page (Orange-OpenSource/ouds-ios#909)
- [Library] Voice Over vocalization for checkbox picker root item if error (Orange-OpenSource/ouds-ios#754)
- [Library] Voice Over vocalization for disabled checkbox, radio button and switch (Orange-OpenSource/ouds-ios#715)
- [Library] Icon of badge component does not resize if big texts used (Orange-OpenSource/ouds-ios#844)

## [0.17.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/0.16.0...0.17.0) - 2025-07-24

### Added

- [Library] Wireframe theme (Orange-OpenSource/ouds-ios#669)
- [Library] Text input component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Text area component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Select input component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Quantity input component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Tag input component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Pin code input component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Color charts for Orange Business Tools theme
- [Library] Orange Inverse theme (Orange-OpenSource/ouds-ios#828)
- [Library] Orange Business Tools theme (Orange-OpenSource/ouds-ios#821)
- [DesignToolbox] GitHub references in about page (Orange-OpenSource/ouds-ios#852)
- [DesignToolbox] Alert killing or not the app when theme changed (if toggled) (Orange-OpenSource/ouds-ios#850)
- [Library] Chip components (Orange-OpenSource/ouds-ios#407)
- [Library] Add `badge` components (Orange-OpenSource/ouds-ios#514) (Orange-OpenSource/ouds-ios#847)

### Changed

- [Library] Color semantic tokens (tokens library v1.4.0) (Orange-OpenSource/ouds-ios#883)
- [Library] Border semantic tokens (tokens library v1.4.0) (Orange-OpenSource/ouds-ios#883)
- [Library] Text input component tokens (tokens library v1.4.0) (Orange-OpenSource/ouds-ios#883)
- [Library] Button component tokens (tokens library v1.4.0) (Orange-OpenSource/ouds-ios#883)
- [Library] Control item component (Orange-OpenSource/ouds-ios#875)
- [Library] Opacity semantic tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Color repository semantic tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Color mode semantic tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Space semantic tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Tag component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Link component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Chip component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Button component (Orange-OpenSource/ouds-ios#875)
- [Library] Button component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Bullet list component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Split color charts semantic tokens to dedicated provider (Orange-OpenSource/ouds-ios#856)
- [Tool] Update `json` RubyGem from v2.12.2 to v2.13.0
- [DesignToolbox] Update `fastlane` gem from v2.227.2 to v2.228.0
- [DesignToolbox] Update `SwiftFormat/CLI` pod from v0.56.4 to v0.57.2
- [Library] Swift package `swift-docc-plugin` from v1.4.3 to v1.4.5
- [Library] Update `fastlane` gem from v2.227.2 to v2.228.0
- [Library] Swift package `SwifFormat` from v0.56.4 to v0.57.2
- [DesignToolbox] Update the position of the design component version (Orange-OpenSource/ouds-ios#848)
- [DesignToolbox] Replace components illustrations by the components themselves (Orange-OpenSource/ouds-ios#820)
- [DesignToolbox] Update `badge` component screen (Orange-OpenSource/ouds-ios#840)
- [DesignToolbox] Available color modes and surfaces by theme for `colored surface` component
- [Library] Color mode semantic tokens (tokens library v1.1.0)
- [Library] Color multiple semantic tokens (tokens library v1.1.0)

### Removed

- [Library] List item component tokens
- [Library] Input text component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Select component tokens (tokens library v1.3.0) (Orange-OpenSource/ouds-ios#875)
- [Library] Orange theme font family raw tokens

### Fixed

- [DesignToolbox] Fix default indicator position in `switch control item` (Orange-OpenSource/ouds-ios#845)
- [Library] Update `controlItem` component to use `controlItemBorderRadius*` tokens (Orange-OpenSource/ouds-ios#777)
- [Library] Update `switch` component to use `switchBorderRadius*` tokens (Orange-OpenSource/ouds-ios#780)
- [Library] Sosh theme (Orange-OpenSource/ouds-ios#665)

## [0.16.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/0.15.0...0.16.0) - 2025-07-07

### Added

- [DesignToolbox] Versions of components in pages (Orange-OpenSource/ouds-ios#760)
- [Library] Versions of components in package
- [Library] New content-on color semantic tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] New repository color semantic tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Dimension semantic tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Size semantic tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [DesignToolbox] More UI tests for a11Y configurations
- [DesignToolbox] Add in about page link to online CHANGELOG (Orange-OpenSource/ouds-ios#678)

### Changed

- [Library] Button component tokens (tokens library v1.2.0)
- [Library] Link component tokens (tokens library v1.2.0)
- [Library] Checkbox component tokens (tokens library v1.2.0)
- [Library] Radio button component tokens (tokens library v1.2.0)
- [Library] Button component tokens (tokens library v1.2.0)
- [Library] Tag component tokens (tokens library v1.2.0)
- [Library] Tag component tokens (tokens library v1.2.0)
- [Library] Button component tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Switch component tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Checkbox component tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Control item component tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Link component tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Tag component tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Chip component tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Badge component tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Space semantic tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Border semantic tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Size semantic tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Color semantic tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Tool] Update `SwiftFormat/CLI` pod from v0.56.2 to v0.56.4
- [Library] Optional accessibility identifiers for items of radio picker and checkbox picker components
- [DesignToolbox] Simplify component demo Screen (Orange-OpenSource/ouds-ios#721)
- [DesignToolbox] Mutualize configuration of `control items` demos (`switch`, `radio button`, `checkbox`) (Orange-OpenSource/ouds-ios#621) 
- [Library] Color raw tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Dimension raw tokens (tokens library v1.1.0) (Orange-OpenSource/ouds-ios#664)
- [Library] Update the names and the order of the divider colors (Orange-OpenSource/ouds-io#712)
- [Library] In low power mode, stop animations of loading button (Orange-OpenSource/ouds-ios#661)
- [Library] Update the names and the order of the divider colors (Orange-OpenSource/ouds-ios#712)
- [Library] In low power mode, stop animations of loading button (Orange-OpenSource/ouds-ios#661) 
- [DesignToolbox] Update cards backgrounds token (Orange-OpenSource/ouds-ios#695)
- [Tool] Update `SwiftFormat/CLI` pod from v0.56.1 to v0.56.2

### Fixed

- [Library] Divider in a ControlItem should not increase the size of this component (Orange-OpenSource/ouds-ios#525)
- [Library] Background color in pressed and hover states for Radio button and Checkbox components (Orange-OpenSource/ouds-ios#720)
- [DesignToolbox] Update background color in component illustration view (Orange-OpenSource/ouds-ios#723)
- [DesignToolbox] In radio item page icons never flipped when flip option toggled (Orange-OpenSource/ouds-ios#675)
- [Library] Change color of button loader in high contrast light mode (Orange-OpenSource/ouds-ios#437)
- [Library] Change color of indicator and borders in high contrast mode (light scheme) for radio and checkbox components (Orange-OpenSource/ouds-ios#645)

## [0.15.0](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/releases/tag/0.15.0) - 2025-05-28

### Added

- [DesignToolbox] Add in app settings the third-party components list
- [DesignToolbox] Hyperlinks to design system, source code and issues board in about page
- [DesignToolbox] Copy/paste build details from about page (Orange-OpenSource/ouds-ios#677)
- [Library] API and tools to check contrast ratio of colors (Orange-OpenSource/ouds-ios#656)

### Changed

- [DesignToolbox] Uses OUDS iOS v0.15.0
- [Tool] Update `json` RubyGem from v2.12.0 to v2.12.2
- [DesignToolbox] Display of build details about OUDS iOS package version in about page (Orange-OpenSource/ouds-ios#679)
- [DesignToolbox] Add title in Component and Token screens (Orange-OpenSource/ouds-ios#662)
- [Tool] Update `SwiftFormat/CLI` pod from v0.55.5 to v0.56.1
- [Tool] Update `fastlane` RubyGem from v2.227.1 to v2.227.2
- [Tool] Update `json` RubyGem from v2.11.3 to v2.12.0
- [DesignToolbox] Various cleanings and split of design system toolbox app from independant repository (Orange-OpenSource/ouds-ios#187)
- [DesignToolbox] Udpate wordings to avoid traduction for components and tokens names (Orange-OpenSource/ouds-ios#654)
- [DesignToolbox] Use the new Switch component in all screens of the application (Orange-OpenSource/ouds-ios#431)
- [Library] Debug warnings for link and button components for WCAG 2.1 3:1 and 4.5:1 ratios on colored surface (Orange-OpenSource/ouds-ios#656)

### Fixed

- [Library] Set border as inner stroke (Orange-OpenSource/ouds-ios#680)
- [Library] Bad wording key for accessibility label of switch item (Orange-OpenSource/ouds-ios#642)
- [Library] Missing accessibility hint for switch (Orange-OpenSource/ouds-ios#642)
- [Library] Missing token `colorBorderMuted` (Orange-OpenSource/ouds-ios#643)
- [Tool] Update `SwiftFormat/CLI` pod from v0.55.5 to v0.56.1 ([#3](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/pull/3))
- [Tool] Update `fastlane` RubyGem from v2.227.1 to v2.227.2 ([#1](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/pull/1))
- [Tool] Update `json` RubyGem from v2.11.3 to v2.12.0 ([#2](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/pull/2))
- Various cleanings and split of design system toolbox app from independant repository ([Orange-OpenSource/ouds-ios#187](https://github.com/Orange-OpenSource/ouds-ios/issues/187))
- Udpate wordings to avoid traduction for components and tokens names ([Orange-OpenSource/ouds-ios#654](https://github.com/Orange-OpenSource/ouds-ios/issues/654))
- Use the new Switch component in all screens of the application ([Orange-OpenSource/ouds-ios#431](https://github.com/Orange-OpenSource/ouds-ios/issues/431))
