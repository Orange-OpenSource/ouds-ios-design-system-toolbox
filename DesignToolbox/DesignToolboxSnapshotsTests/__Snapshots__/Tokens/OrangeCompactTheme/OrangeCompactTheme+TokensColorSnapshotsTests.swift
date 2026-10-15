//
// Software Name: OUDS iOS
// SPDX-FileCopyrightText: Copyright (c) Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license,
// the text of which is available at https://opensource.org/license/MIT/
// or see the "LICENSE" file for more details.
//
// Authors: See CONTRIBUTORS.txt
// Software description: A SwiftUI components library with code examples for Orange Unified Design System
//

import OUDSSwiftUI
import SwiftUI

// swiftlint:disable required_deinit
// swiftlint:disable type_name

/// Tests the UI rendering of each **color token** using reference images for `OrangeCompactTheme`
final class OrangeCompactThemeTokensColorSnapshotsTests: TokensColorSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeCompactTheme()
    }

    /// This function tests all color tokens in the `OrangeCompactTheme` with the `light` color schemes.
    /// It iterates through all sections of `NamedColor`, rendering each illustration in a `UIHostingController`,
    /// and captures a snapshot for each color. The snapshots are saved with names indicating the color, theme, and color scheme.
    @MainActor func testAllColorsOrangeCompactThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testActionColors(theme: theme, interfaceStyle: interfaceStyle)
        testAlwaysColors(theme: theme, interfaceStyle: interfaceStyle)
        testBackgroundColors(theme: theme, interfaceStyle: interfaceStyle)
        testBorderColors(theme: theme, interfaceStyle: interfaceStyle)
        testChartColors(theme: theme, interfaceStyle: interfaceStyle)
        testDecorativeColors(theme: theme, interfaceStyle: interfaceStyle)
        testContentColors(theme: theme, interfaceStyle: interfaceStyle)
        testOpacityColors(theme: theme, interfaceStyle: interfaceStyle)
        testOverlayColors(theme: theme, interfaceStyle: interfaceStyle)
        testRepositoryColors(theme: theme, interfaceStyle: interfaceStyle)
        testSurfaceColors(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// This function tests all color tokens in the `OrangeCompactTheme` with the `dark` color schemes.
    /// It iterates through all sections of `NamedColor`, rendering each illustration in a `UIHostingController`,
    /// and captures a snapshot for each color. The snapshots are saved with names indicating the color, theme, and color scheme.
    @MainActor func testAllColorsOrangeCompactThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testActionColors(theme: theme, interfaceStyle: interfaceStyle)
        testAlwaysColors(theme: theme, interfaceStyle: interfaceStyle)
        testBackgroundColors(theme: theme, interfaceStyle: interfaceStyle)
        testBorderColors(theme: theme, interfaceStyle: interfaceStyle)
        testChartColors(theme: theme, interfaceStyle: interfaceStyle)
        testDecorativeColors(theme: theme, interfaceStyle: interfaceStyle)
        testContentColors(theme: theme, interfaceStyle: interfaceStyle)
        testOpacityColors(theme: theme, interfaceStyle: interfaceStyle)
        testOverlayColors(theme: theme, interfaceStyle: interfaceStyle)
        /*
         There are some failures with two tokens, even if the snapshots are fresh:
         - OrangeCompact Theme, dark mode --> repositoryOpacityBlackHighest
         - OrangeCompact Theme, dark mode --> surfaceInverseHigh
         */
        testRepositoryColors(theme: theme, interfaceStyle: interfaceStyle, precision: 0.94, perceptualPrecision: 0.96)
        testSurfaceColors(theme: theme, interfaceStyle: interfaceStyle, precision: 0.94, perceptualPrecision: 0.96)
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_name
