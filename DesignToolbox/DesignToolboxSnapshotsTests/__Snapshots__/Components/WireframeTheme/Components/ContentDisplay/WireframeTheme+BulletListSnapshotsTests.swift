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

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSBulletList` for each parameter for `WireframeTheme`.
final class WireframeThemeBulletListSnapshotsTests: BulletListSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var standardTheme: OUDSTheme!
    private var tunedTheme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        standardTheme = WireframeTheme() // Default tuning do not have rounded corners
        tunedTheme = WireframeTheme(tuning: Tuning(hasRoundedBulletLists: true))
    }

    // MARK: Orange theme - no tuning

    /// Tests all BulletLists configuration in the `WireframeTheme` with the `light` color schemes
    /// with default tuning.
    @MainActor func testAllBulletListsOrangeStandardThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllBulletLists(theme: standardTheme, interfaceStyle: interfaceStyle)
    }

    /// Tests all BulletLists configuration in the `WireframeTheme` with the `dark` color schemes
    /// with default tuning.
    @MainActor func testAllBulletListsOrangeStandardThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllBulletLists(theme: standardTheme, interfaceStyle: interfaceStyle)
    }

    // MARK: Orange theme - with tuning

    /// Tests all BulletLists configuration in the `WireframeTheme` with the `light` color schemes
    /// with special tuning (rounded corners)
    @MainActor func testAllBulletListsOrangeTunedThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllBulletLists(theme: tunedTheme, interfaceStyle: interfaceStyle)
    }

    /// Tests all BulletLists configuration in the `WireframeTheme` with the `dark` color schemes
    /// with special tuning (rounded corners)
    @MainActor func testAllBulletListsOrangeTunedThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllBulletLists(theme: tunedTheme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
