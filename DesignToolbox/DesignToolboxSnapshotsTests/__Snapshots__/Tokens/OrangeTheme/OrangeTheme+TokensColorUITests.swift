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
import OUDSThemesOrange
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

/// Tests the UI rendering of each **color token** using reference images for `OrangeTheme`
final class OrangeThemeTokensColorUITests: TokensColorUITestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeTheme()
    }

    /// This function tests all color tokens in the `OrangeTheme` with the `light` color schemes.
    /// It iterates through all sections of `NamedColor`, rendering each illustration in a `UIHostingController`,
    /// and captures a snapshot for each color. The snapshots are saved with names indicating the color, theme, and color scheme.
    @MainActor func testAllColorsOrangeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testActionColors(theme: theme, interfaceStyle: interfaceStyle)
        testAlwaysColors(theme: theme, interfaceStyle: interfaceStyle)
        testBackgroundColors(theme: theme, interfaceStyle: interfaceStyle)
        testBorderColors(theme: theme, interfaceStyle: interfaceStyle)
        testChartColors(theme: theme, interfaceStyle: interfaceStyle)
        testContentColors(theme: theme, interfaceStyle: interfaceStyle)
        testDecorativeColors(theme: theme, interfaceStyle: interfaceStyle)
        testOpacityColors(theme: theme, interfaceStyle: interfaceStyle)
        testOverlayColors(theme: theme, interfaceStyle: interfaceStyle)
        testRepositoryColors(theme: theme, interfaceStyle: interfaceStyle)
        testSurfaceColors(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// This function tests all color tokens in the `OrangeTheme` with the `dark` color schemes.
    /// It iterates through all sections of `NamedColor`, rendering each illustration in a `UIHostingController`,
    /// and captures a snapshot for each color. The snapshots are saved with names indicating the color, theme, and color scheme.
    @MainActor func testAllColorsOrangeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testActionColors(theme: theme, interfaceStyle: interfaceStyle)
        testAlwaysColors(theme: theme, interfaceStyle: interfaceStyle)
        testBackgroundColors(theme: theme, interfaceStyle: interfaceStyle)
        testBorderColors(theme: theme, interfaceStyle: interfaceStyle)
        testChartColors(theme: theme, interfaceStyle: interfaceStyle)
        testContentColors(theme: theme, interfaceStyle: interfaceStyle)
        testDecorativeColors(theme: theme, interfaceStyle: interfaceStyle)
        testOpacityColors(theme: theme, interfaceStyle: interfaceStyle)
        testOverlayColors(theme: theme, interfaceStyle: interfaceStyle)
        testRepositoryColors(theme: theme, interfaceStyle: interfaceStyle)
        testSurfaceColors(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
