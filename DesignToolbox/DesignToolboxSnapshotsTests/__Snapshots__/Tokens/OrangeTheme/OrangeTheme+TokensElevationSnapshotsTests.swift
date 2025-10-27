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
import SwiftUI

// swiftlint:disable required_deinit

/// Tests the UI rendering of each **elevation token** using reference images for `OrangeTheme`
final class OrangeThemeTokensElevationSnapshotsTests: TokensElevationSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeTheme()
    }

    /// This function tests all elevation tokens in the `OrangeTheme` with the `light` color scheme.
    /// It iterates through all `NamedElevation` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the elevation, theme, and color scheme.
    @MainActor func testAllElevationsOrangeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testElevations(for: theme, in: interfaceStyle)
    }

    /// This function tests all elevation tokens in the `OrangeTheme` with the `dark` color scheme.
    /// It iterates through all `NamedElevation` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the elevation, theme, and color scheme.
    @MainActor func testAllElevationsOrangeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testElevations(for: theme, in: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
