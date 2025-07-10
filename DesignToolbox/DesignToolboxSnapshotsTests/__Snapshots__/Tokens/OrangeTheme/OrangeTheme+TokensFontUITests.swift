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

/// Tests the UI rendering of each **font token** using reference images for `OrangeTheme`
final class OrangeThemeTokensFontUITests: TokensFontUITestsTestCase {

    /// This function tests all font tokens in the `OrangeTheme` with the `light` color scheme.
    /// It iterates through all `NamedFont` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the font, theme, color scheme and horizontalSizeClass.
    @MainActor func testAllFontsOrangeThemeLight() {
        let theme = OrangeTheme()
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllFonts(for: theme, in: interfaceStyle)
    }

    /// This function tests all font tokens in the `OrangeTheme` with the `dark` color scheme.
    /// It iterates through all `NamedFont` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the font, theme, color scheme horizontalSizeClass.
    @MainActor func testAllFontsOrangeThemeDark() {
        let theme = OrangeTheme()
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllFonts(for: theme, in: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
