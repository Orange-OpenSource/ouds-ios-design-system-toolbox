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

/// Tests the UI rendering of each **border token** using reference images for `OrangeBusinessToolsTheme`
final class OrangeBusinessToolsThemeTokensBorderSnapshotsTests: TokensBorderSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeBusinessToolsTheme()
    }

    /// This function tests all border tokens in the `OrangeBusinessToolsTheme` with the `light` color schemes.
    /// It iterates through all `NamedBorderWidth`, `NamedBorderRafius`, and`NamedBorderStyle` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. Each snapshot is saved with a name that indicates the spacing type, theme, and color scheme.
    @MainActor func testAllBorderOrangeBusinessToolsThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testBorderWidth(for: theme, in: interfaceStyle)
        testBorderRadius(for: theme, in: interfaceStyle)
        testBorderStyle(for: theme, in: interfaceStyle)
    }

    /// This function tests all border tokens in the `OrangeBusinessToolsTheme` with  the `dark` color schemes.
    /// It iterates through all `NamedSize` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. Each snapshot is saved with a name that indicates the spacing type, theme, and color scheme.
    @MainActor func testAllBorderOrangeBusinessToolsThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testBorderWidth(for: theme, in: interfaceStyle)
        testBorderRadius(for: theme, in: interfaceStyle)
        testBorderStyle(for: theme, in: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_name
