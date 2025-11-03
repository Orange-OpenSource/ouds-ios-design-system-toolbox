//
// Software Name: OUDSThemesContract iOS
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

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSHorizontalDivider` and `OUDSVerticalDivider` for each parameter  for `WireframeTheme`.
final class WireframeThemeDividerSnapshotsTests: DividerSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = WireframeTheme()
    }

    /// Tests all divider configuration in the `WireframeTheme` with the `light` color schemes.
    @MainActor func testAllDividerWireframeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllDividers(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `WireframeTheme` with the `dark` color schemes.
    @MainActor func testAllDividerWireframeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllDividers(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
