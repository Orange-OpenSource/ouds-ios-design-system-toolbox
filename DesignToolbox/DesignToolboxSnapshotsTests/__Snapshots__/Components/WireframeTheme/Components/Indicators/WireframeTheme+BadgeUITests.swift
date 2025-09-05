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

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSBadge` components for each parameter with `WireframeTheme`
final class WireframeThemeBadgeUITests: BadgeUITestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = WireframeTheme()
    }

    /// Tests all bages configuration in the `WireframeTheme` with the `light` color schemes.
    @MainActor func testAllBagesWireframeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllBadges(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all badges configuration in the `WireframeTheme` with the `dark` color schemes.
    @MainActor func testAllBadgesWireframeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllBadges(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
