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

// swiftlint:disable required_deinit
// swiftlint:disable type_name

/// Tests the UI rendering of each **opacity token** using reference images for `WireframeTheme`.
final class WireframeThemeTokensOpacitySnapshotsTests: TokensOpacitySnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = WireframeTheme()
    }

    /// This function tests all opacity tokens in the `WireframeTheme` with the `light` color scheme.
    /// It iterates through all `NamedOpacity` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the elevation, theme, and color scheme.
    @MainActor func testAllOpacitiesWireframeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testOpacities(for: theme, in: interfaceStyle)
    }

    /// This function tests all opacity tokens in the `WireframeTheme` with the `dark` color scheme.
    /// It iterates through all `NamedOpacity` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the elevation, theme, and color scheme.
    @MainActor func testAllOpacitiesWireframeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testOpacities(for: theme, in: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_name
