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
import OUDSThemesOrangeInverse
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSButton` for each parameter for `OrangeInverseTheme`.
final class OrangeInverseThemeButtonUITests: ButtonUITestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var standardTheme: OUDSTheme!
    private var tunedTheme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        standardTheme = OrangeInverseTheme() // Default tuning do not have rounded corners
        tunedTheme = OrangeInverseTheme(tuning: Tuning(hasRoundedButtons: true))
    }

    // MARK: Orange Inverse theme - no tuning

    /// Tests all buttons configuration in the `OrangeInverseTheme` with the `light` color schemes
    /// with default tuning.
    @MainActor func testAllButtonsOrangeInverseStandardThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllButtons(theme: standardTheme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: standardTheme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `OrangeInverseTheme` with the `dark` color schemes
    /// with default tuning.
    @MainActor func testAllButtonsOrangeInverseStandardThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllButtons(theme: standardTheme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: standardTheme, interfaceStyle: interfaceStyle)
    }

    // MARK: Orange Inverse theme - with tuning

    /// Tests all buttons configuration in the `OrangeInverseTheme` with the `light` color schemes
    /// with special tuning (rounded corners)
    @MainActor func testAllButtonsOrangeInverseTunedThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllButtons(theme: tunedTheme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: tunedTheme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `OrangeInverseTheme` with the `dark` color schemes
    /// with special tuning (rounded corners)
    @MainActor func testAllButtonsOrangeInverseTunedThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllButtons(theme: tunedTheme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: tunedTheme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
