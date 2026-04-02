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
import SnapshotTesting
import SwiftUI
import XCTest

// MARK: - Test Cases

// swiftlint:disable required_deinit
/// Tests the UI rendering of the `OUDSPinCodeInput` for each parameter
open class PinCodeInputSnapshotsTestsTestCase: XCTestCase {

    /// This function tests some pin code input configuration for the given theme and color schemes on a standard surface.
    ///
    /// It iterates through all combinations of configuration:
    /// - the outlined layout
    /// - the length (4, 6, 8)
    /// - status of the text input (enabled, error)
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllPinCodeInputs(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for outlined in [true, false] {
            for length in OUDSPinCodeInput.Length.allCases {
                for helperText in ["", "Helper text"] {
                    for isFull in [true, false] {
                        testPinCodeInput(theme: theme,
                                         interfaceStyle: interfaceStyle,
                                         length: length,
                                         isFull: isFull,
                                         helperText: helperText,
                                         outlined: outlined,
                                         status: .enabled)

                        testPinCodeInput(theme: theme,
                                         interfaceStyle: interfaceStyle,
                                         length: length,
                                         isFull: isFull,
                                         helperText: helperText,
                                         outlined: outlined,
                                         status: .error(message: "Error message"))
                    }
                }
            }
        }
    }

    // swiftlint:disable function_parameter_count
    /// This function tests some pin code input configurations for the given theme and color schemes on a standard surface.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors
    ///   - length: The number of boxes
    ///   - isFull: True if all digits are filled, false if all of them are empty. Allows testing the placeholders for empty and non-empty boxes.
    ///   - helperText: The helper text to display for the enabled status
    ///   - outlined: Flag to know if outlined
    ///   - status: The status of the component
    @MainActor private func testPinCodeInput(theme: OUDSTheme,
                                             interfaceStyle: UIUserInterfaceStyle,
                                             length: OUDSPinCodeInput.Length,
                                             isFull: Bool,
                                             helperText: String,
                                             outlined: Bool,
                                             status: OUDSPinCodeInput.Status)
    {
        // Generate the illustration for configuration elements
        let illustration = OUDSThemeableView(theme: theme) {
            TestPinCodeInputView(length: length,
                                 isFull: isFull,
                                 helperText: helperText,
                                 outlined: outlined,
                                 status: status)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test<testType>_<themeName>_<colorScheme>.<roundedPattern><stylePattern><statusPattern>
        let testName = "test-_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let lengthPattern = switch length {
        case .four:
            "4"
        case .six:
            "6"
        case .eight:
            "8"
        }
        let isFullPattern = isFull ? "_Full" : "_Empty"
        let helperTextPattern = !helperText.isEmpty ? "_WithHelperText" : ""
        let outlinedPattern = outlined ? "_Outlined" : ""
        let statusPattern = status == .enabled ? "_Enabled" : "_Error"

        let named = "\(lengthPattern)\(isFullPattern)\(helperTextPattern)\(outlinedPattern)\(statusPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: named,
                           testName: testName)
    }
    // swiftlint:enable function_parameter_count
}

// swiftlint:enable required_deinit

// MARK: - Test Pin Code Input View

struct TestPinCodeInputView: View {

    let length: OUDSPinCodeInput.Length
    let isFull: Bool
    let helperText: String
    let outlined: Bool
    let status: OUDSPinCodeInput.Status

    // MARK: - Body

    var body: some View {
        OUDSPinCodeInput(.constant(mockData(isFull)),
                         length: length,
                         helperText: helperText,
                         isOutlined: outlined,
                         status: status,
                         autofocus: false)
            .padding(5) // Just to save borders of edge boxes
    }

    private func mockData(_ isFull: Bool) -> String {
        switch length {
        case .four:
            isFull ? "1234" : ""
        case .six:
            isFull ? "123456" : ""
        case .eight:
            isFull ? "12345678" : ""
        }
    }
}
