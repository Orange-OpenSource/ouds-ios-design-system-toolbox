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

/// Tests the UI rendering of each **size token** using reference images
final class OrangeCompactThemeTokensSizeSnapshotsTests: TokensSizeSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeCompactTheme()
    }

    /// This function tests all size tokens in the `OrangeCompactTheme` with the `light` color scheme.
    /// It iterates through all `NamedSize` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the elevation, theme, and color scheme.
    @MainActor func testAllSizesOrangeCompactThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testSizeIconDecorative(for: theme, in: interfaceStyle)
        testSizeIconWithTypography(for: theme, in: interfaceStyle)
    }

    /// This function tests all size tokens in the `OrangeCompactTheme` with the `dark` color scheme.
    /// It iterates through all `NamedSize` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the elevation, theme, and color scheme.
    @MainActor func testAllSizesOrangeCompactThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testSizeIconDecorative(for: theme, in: interfaceStyle)
        testSizeIconWithTypography(for: theme, in: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_name
