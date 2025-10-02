# OUDS iOS design system toolbox changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased](https://github.com/Orange-OpenSource/ouds-ios/compare/0.19.0...develop)

### Added

- [DesignToolbox] Color scheme selector (Orange-OpenSource/ouds-ios#944)

### Changed

- [Library] Improve README for onboarding and newcomers (Orange-OpenSource/ouds-ios#1005)
- [Library] Improve web documentation for onboarding and newcomers (Orange-OpenSource/ouds-ios#982)
- [DesignToolbox] Migration to Xcode 26.0
- [Library] Apply `Helvetica Neue` font family for themes `Orange`, `Orange Inverse` and `Orange Business Tools` (Orange-OpenSource/ouds-ios#965)

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
