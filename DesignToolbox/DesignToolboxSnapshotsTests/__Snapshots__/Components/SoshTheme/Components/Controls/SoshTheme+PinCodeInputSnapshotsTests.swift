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

/// Tests the UI rendering of the `OUDSPinCodeInput` for each parameter for `SoshTheme`.
final class SoshThemePinCodeInputSnapshotsTests: PinCodeInputSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: OUDSTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = SoshTheme()
    }

    /// Tests all pin code input configuration in the `SoshTheme` with the `light` color schemes.
    @MainActor func testAllPinCodeInputsSoshThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllPinCodeInputs(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all pin code input configuration in the `SoshTheme` with the `dark` color schemes.
    @MainActor func testAllPinCodeInputsSoshThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllPinCodeInputs(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
