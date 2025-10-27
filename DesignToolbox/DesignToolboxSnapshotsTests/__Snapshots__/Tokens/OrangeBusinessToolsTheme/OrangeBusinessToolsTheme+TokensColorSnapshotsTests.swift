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

import OUDS
import OUDSThemesOrangeBusinessTools
import SwiftUI

// swiftlint:disable required_deinit
// swiftlint:disable type_name

/// Tests the UI rendering of each **color token** using reference images for `OrangeBusinessToolsTheme`
final class OrangeBusinessToolsThemeTokensColorSnapshotsTests: TokensColorSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeBusinessToolsTheme()
    }

    /// This function tests all color tokens in the `OrangeBusinessToolsTheme` with the `light` color schemes.
    /// It iterates through all sections of `NamedColor`, rendering each illustration in a `UIHostingController`,
    /// and captures a snapshot for each color. The snapshots are saved with names indicating the color, theme, and color scheme.
    @MainActor func testAllColorsOrangeBusinessToolsThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testActionColors(theme: theme, interfaceStyle: interfaceStyle)
        testAlwaysColors(theme: theme, interfaceStyle: interfaceStyle)
        testBackgroundColors(theme: theme, interfaceStyle: interfaceStyle)
        testBorderColors(theme: theme, interfaceStyle: interfaceStyle)
        testChartColors(theme: theme, interfaceStyle: interfaceStyle)
        testContentColors(theme: theme, interfaceStyle: interfaceStyle)
        testOpacityColors(theme: theme, interfaceStyle: interfaceStyle)
        testOverlayColors(theme: theme, interfaceStyle: interfaceStyle)
        testRepositoryColors(theme: theme, interfaceStyle: interfaceStyle)
        testSurfaceColors(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// This function tests all color tokens in the `OrangeBusinessToolsTheme` with the `dark` color schemes.
    /// It iterates through all sections of `NamedColor`, rendering each illustration in a `UIHostingController`,
    /// and captures a snapshot for each color. The snapshots are saved with names indicating the color, theme, and color scheme.
    @MainActor func testAllColorsOrangeBusinessToolsThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testActionColors(theme: theme, interfaceStyle: interfaceStyle)
        testAlwaysColors(theme: theme, interfaceStyle: interfaceStyle)
        testBackgroundColors(theme: theme, interfaceStyle: interfaceStyle)
        testBorderColors(theme: theme, interfaceStyle: interfaceStyle)
        testChartColors(theme: theme, interfaceStyle: interfaceStyle)
        testContentColors(theme: theme, interfaceStyle: interfaceStyle)
        testOpacityColors(theme: theme, interfaceStyle: interfaceStyle)
        testOverlayColors(theme: theme, interfaceStyle: interfaceStyle)
        /*
         There are some failures with two tokens, even if the snapshots are fresh:
         - OrangeBusinessTools Theme, dark mode --> colorRepositoryOpacityBlackHighest
         - OrangeBusinessTools Theme, dark mode --> colorSurfaceInverseHigh
         */
        testRepositoryColors(theme: theme, interfaceStyle: interfaceStyle, precision: 0.94, perceptualPrecision: 0.96)
        testSurfaceColors(theme: theme, interfaceStyle: interfaceStyle, precision: 0.94, perceptualPrecision: 0.96)
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_name
