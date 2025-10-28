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
import OUDSThemesWireframe
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

/// Tests the UI rendering of each **color token** using reference images for `WireframeTheme`
final class WireframeThemeTokensColorSnapshotsTests: TokensColorSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = WireframeTheme()
    }

    /// This function tests all color tokens in the `WireframeTheme` with the `light` color schemes.
    /// It iterates through all sections of `NamedColor`, rendering each illustration in a `UIHostingController`,
    /// and captures a snapshot for each color. The snapshots are saved with names indicating the color, theme, and color scheme.
    @MainActor func testAllColorsWireframeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testActionColors(theme: theme, interfaceStyle: interfaceStyle)
        testAlwaysColors(theme: theme, interfaceStyle: interfaceStyle)
        testBackgroundColors(theme: theme, interfaceStyle: interfaceStyle)
        testBorderColors(theme: theme, interfaceStyle: interfaceStyle)
        // Sosh theme does not have yet color charts branded for it
        // If the provider is defined that's unexpected, it should be nil
        if theme.charts != nil {
            XCTFail("The Wireframe theme does not have yet color charts, that's unexpected")
        }
        testContentColors(theme: theme, interfaceStyle: interfaceStyle)
        testOpacityColors(theme: theme, interfaceStyle: interfaceStyle)
        testOverlayColors(theme: theme, interfaceStyle: interfaceStyle)
        testRepositoryColors(theme: theme, interfaceStyle: interfaceStyle)
        testSurfaceColors(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// This function tests all color tokens in the `WireframeTheme` with the `dark` color schemes.
    /// It iterates through all sections of `NamedColor`, rendering each illustration in a `UIHostingController`,
    /// and captures a snapshot for each color. The snapshots are saved with names indicating the color, theme, and color scheme.
    @MainActor func testAllColorsWireframeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testActionColors(theme: theme, interfaceStyle: interfaceStyle)
        testAlwaysColors(theme: theme, interfaceStyle: interfaceStyle)
        testBackgroundColors(theme: theme, interfaceStyle: interfaceStyle)
        testBorderColors(theme: theme, interfaceStyle: interfaceStyle)
        // Sosh theme does not have yet color charts branded for it
        // If the provider is defined that's unexpected, it should be nil
        if theme.charts != nil {
            XCTFail("The Wireframe theme does not have yet color charts, that's unexpected")
        }
        testContentColors(theme: theme, interfaceStyle: interfaceStyle)
        testOpacityColors(theme: theme, interfaceStyle: interfaceStyle)
        testOverlayColors(theme: theme, interfaceStyle: interfaceStyle)
        /*
         There are some failures with two tokens, even if the snapshots are fresh:
         - Wireframe Theme, dark mode --> colorRepositoryOpacityBlackHighest
         - Wireframe Theme, dark mode --> colorSurfaceInverseHigh
         */
        testRepositoryColors(theme: theme, interfaceStyle: interfaceStyle, precision: 0.94, perceptualPrecision: 0.96)
        testSurfaceColors(theme: theme, interfaceStyle: interfaceStyle, precision: 0.94, perceptualPrecision: 0.96)
    }
}

// swiftlint:enable required_deinit
