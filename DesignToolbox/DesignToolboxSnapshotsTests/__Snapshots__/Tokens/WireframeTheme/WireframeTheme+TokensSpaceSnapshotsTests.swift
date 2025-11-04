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

/// Tests the UI rendering of each **space token** using reference images for `WireframeTheme`
final class WireframeThemeTokensSpaceSnapshotsTests: TokensSpaceSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = WireframeTheme()
    }

    /// This function tests all _ tokens in the `WireframeTheme` with  the `light` color schemes.
    /// It iterates through all `NamedSpace` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. Each snapshot is saved with a name that indicates the spacing type, theme, and color scheme.
    @MainActor func testAllSpacesWireframeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testScaledProperty(theme: theme, interfaceStyle: interfaceStyle)
        testFixedProperty(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingInline(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingInset(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingBlock(theme: theme, interfaceStyle: interfaceStyle)
        testColumnGap(theme: theme, interfaceStyle: interfaceStyle)
        testRowGap(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// This function tests all space tokens in the `WireframeTheme` with both the  `dark` color schemes.
    /// It iterates through all `NamedSize` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the space type, theme, and interfaceStyle (i.e color scheme).
    @MainActor func testAllSpacesWireframeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testScaledProperty(theme: theme, interfaceStyle: interfaceStyle)
        testFixedProperty(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingInline(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingInset(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingBlock(theme: theme, interfaceStyle: interfaceStyle)
        testColumnGap(theme: theme, interfaceStyle: interfaceStyle)
        testRowGap(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
