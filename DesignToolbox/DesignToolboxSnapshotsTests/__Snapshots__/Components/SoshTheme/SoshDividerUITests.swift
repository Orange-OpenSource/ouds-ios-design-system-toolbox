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
import OUDSComponents
import OUDSThemesSosh
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSDivider` for each parameter with `SoshTheme`
final class SoshThemeDividerUITests: DividerUITestsTestCase {

    /// Tests all divider configuration in the `SoshTheme` with the `light` color schemes.
    @MainActor func testAllDividerSoshThemeLight() {
        let theme = SoshTheme()
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllDividers(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `SoshTheme` with the `dark` color schemes.
    @MainActor func testAllDividerSoshThemeDark() {
        let theme = SoshTheme()
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllDividers(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
