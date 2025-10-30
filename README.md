<h1 align="center">Design System Toolbox iOS</h1>

<p align="center">
  Demo application of the OUDS iOS library.
  <br>
  <a href="https://github.com/Orange-OpenSource/ouds-ios/issues/new?template=bug_report.yml" title="Open an issue on GitHub">Report bug</a>
  ·
  <a href="https://ios.unified-design-system.orange.com/" title="Swift library technical documentation on GitHub Pages">Swift documentation</a>
  ·
  <a href="https://unified-design-system.orange.com/" title="Design system global website">Design system</a>
  ·  
  <a href="https://github.com/Orange-OpenSource/ouds-ios/" title="OUDS iOS library">Swift Package library</a>
</p>

<p align="center">
<a href="https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/actions/workflows/build-and-test.yml" title="Build and test status"><img src="https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/actions/workflows/build-and-test.yml/badge.svg" alt="Build and test status"></a>
&nbsp;
<a href="https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/actions/workflows/gitleaks.yml" title="Gitleaks status"><img src="https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/actions/workflows/gitleaks.yml/badge.svg" alt="Gitleaks status"></a>
&nbsp;
<a href="https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/actions/workflows/swiftpolyglot.yml" title="SwiftPolyglot status"><img src="https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/actions/workflows/swiftpolyglot.yml/badge.svg" alt="SwiftPolyglot status"></a>
&nbsp;
<a href="https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/actions/workflows/swiftlint.yml" title="SwiftLint status"><img src="https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/actions/workflows/swiftlint.yml/badge.svg" alt="SwiftLint status"></a>
&nbsp;
<a href="https://scorecard.dev/viewer/?uri=github.com/Orange-OpenSource/ouds-ios-design-system-toolbox" title="OpenSSF Scorecard"><img src="https://api.scorecard.dev/projects/github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/badge" alt="OpenSSF Scorecard"></a>  
&nbsp;
<a href="https://renovatebot.com" title="Renovate status"><img src="https://img.shields.io/badge/renovate-enabled-brightgreen.svg" alt="Renovate status"></a>
</p>

## Status

[![MIT license](https://img.shields.io/github/license/Orange-OpenSource/ouds-ios-design-system-toolbox?style=for-the-badge)](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/main/LICENSE)

[![Versions](https://img.shields.io/github/v/release/Orange-OpenSource/ouds-ios-design-system-toolbox?label=Last%20version&style=for-the-badge)](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/releases)
[![AppStore](https://img.shields.io/itunes/v/6743708286?style=for-the-badge&label=AppStore)](https://apps.apple.com/fr/app/design-system-toolbox/id6743708286)
[![Still maintained](https://img.shields.io/maintenance/yes/2025?style=for-the-badge)](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/issues?q=is%3Aissue+is%3Aclosed)

[![Xcode 26.0](https://img.shields.io/badge/Xcode-26.0-blue?style=for-the-badge)](https://developer.apple.com/documentation/xcode-release-notes/xcode-26-release-notes)

[![iOS 15.0](https://img.shields.io/badge/iOS-15.0-FF1AB2?style=for-the-badge)](https://developer.apple.com/support/app-store)
[![iPadOS 15.0](https://img.shields.io/badge/iPadOS-15.0-FF1AB2?style=for-the-badge)](https://developer.apple.com/support/app-store")

## Content

> [!NOTE]
> This repository contains the design system toolbox app which contains the OUDS iOS Swift Package and displays its features.
> You can find the [detailed technical documentation online](https://ios.unified-design-system.orange.com), 
> and also the [whole design system](https://unified-design-system.orange.com/).
> The source code of the [Swift Package is on Orange-OpenSource/ouds-ios](https://github.com/Orange-OpenSource/ouds-ios).

> [!TIP]
> Releases are immutable and in most of time cryptographically signed.
> You can verify integrity of release and assets with commands below
> using [GitHub CLI](https://cli.github.com/) 
> and available [release tags](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/releases).

To verify integrity of a release *x.y.z*:
```shell
gh release verify x.y.z --repo Orange-OpenSource/ouds-ios-design-system-toolbox
```

To verify integrity of an *asset* (previously downloaded at current location) associated to the release *x.y.z*:
```shell
gh release verify-asset x.y.z asset --repo Orange-OpenSource/ouds-ios-design-system-toolbox
```

For these commands a message should say release is verified or asset verification succeeded.

## Bugs, feature requests and discussions

> [!CAUTION]
> So as to help management team and have in one board all issues related to OUDS iOS, 
> and because the design system toolbox app is just a mirror of the library, 
> any discussions and issues about this app, and in the end, content of this repository, 
> must remain in the [library project](https://github.com/Orange-OpenSource/ouds-ios).

## Contributing

Please read through our [contributing guidelines](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/main/.github/CONTRIBUTING.md). Included are directions for opening issues, coding standards, and notes on development. More technical details are available also in the [DEVELOP](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/main/.github/DEVELOP.md) file.

## Copyright and license

Code released under the [MIT License](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/main/LICENSE).
For images and other assets, please [refer to the NOTICE.txt](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/ain/NOTICE.txt).

## Design System Toolbox

<!-- Mockups designed thanks to https://mockuphone.com/model/iphone-15-pro-max/ -->

<p align="center">
<img src="./images/Tokens list - en - light-portrait.png" alt="List of tokens on iPhone 15 Pro Max (engligh, light mode, portrait)"  height="350" />
&nbsp;
<img src="./images/Colors - en - light-portrait.png" alt="List of colors on iPhone 15 Pro Max (engligh, light mode, portrait)"  height="350" />
&nbsp;
<img src="./images/Components list - en - light-portrait.png" alt="List of components on iPhone 15 Pro Max (engligh, light mode, portrait)"  height="350" />
&nbsp;
<img src="./images/Button - en - light-portrait.png" alt="Button component on iPhone 15 Pro Max (engligh, light mode, portrait)"  height="350" />
</p>

Flash the QrCode below or click on it to download the *Design System Toolbox* app.

<p align="center">
<a href="https://web.unified-design-system.orange.com/docs/0.5/examples/download-app/" title="Orange Unified Desin Sysem Design System Toolbox page"><img src="./images/design-toolbox-download-page-qrcode.png" alt="QrCode redirecting to Orange Unified Desin Sysem Design System Toolbox page" width="125" height="125"></a>
</p>
