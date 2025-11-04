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
import XCTest

// swiftlint:disable required_deinit

/// Tests the UI rendering of the `OUDSFilterChip` and `OUDSSuggestionChip` for each parameter.
final class OrangeThemeChipsSnapshotsTests: ChipsSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = OrangeTheme()
    }

    /// Tests all chips configuration in the `OrangeTheme` with the `light` color schemes.
    @MainActor func testAllChipsOrangeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllChips(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all chips configuration in the `OrangeTheme` with the `dark` color schemes.
    @MainActor func testAllChipsOrangeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllChips(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
