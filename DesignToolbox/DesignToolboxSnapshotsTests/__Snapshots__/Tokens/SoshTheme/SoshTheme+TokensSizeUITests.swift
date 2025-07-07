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
import OUDSThemesSosh
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

/// Tests the UI rendering of each **size token** using reference images
final class SoshThemeTokensSizeUITests: TokensSizeUITestsTestCase {

    /// This function tests all size tokens in the `SoshTheme` with the `light` color scheme.
    /// It iterates through all `NamedSize` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the elevation, theme, and color scheme.
    @MainActor func testAllSizesSoshThemeLight() {
        let theme = SoshTheme()
        let interfaceStyle = UIUserInterfaceStyle.light
        testSizeIconDecorative(for: theme, in: interfaceStyle)
        testSizeIconWithTypography(for: theme, in: interfaceStyle)
    }

    /// This function tests all size tokens in the `SoshTheme` with the `dark` color scheme.
    /// It iterates through all `NamedSize` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the elevation, theme, and color scheme.
    @MainActor func testAllSizesSoshThemeDark() {
        let theme = SoshTheme()
        let interfaceStyle = UIUserInterfaceStyle.dark
        testSizeIconDecorative(for: theme, in: interfaceStyle)
        testSizeIconWithTypography(for: theme, in: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
