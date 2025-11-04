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
/// Tests the UI rendering of the `OUDSTextInput` for each parameter
open class TextInputSnapshotsTestsTestCase: XCTestCase {

    /// This function tests some Text input configuration for the given theme and color schemes on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// It iterates through all combinations of configuration:
    /// - the rounded layout
    /// - the style of the text input (default, alternative)
    /// - status of the text input (the loader is dropped still the progress indicator is done)
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllTextInputs(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for outlined in [true, false] {
            // Drop the loading status still the progress indicator is done
            for status in OUDSTextInput.Status.allCases where status != .loading {
                testTextInput(theme: theme, interfaceStyle: interfaceStyle, testType: .styleAndStatus, status: status, outlined: outlined)
                testTextInput(theme: theme, interfaceStyle: interfaceStyle, testType: .helpers, status: status, outlined: outlined)
            }
        }
    }

    /// This function tests some Text input configuration for the given theme and color schemes on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// It iterates through all combinations of configuration:
    /// - the rounded layout
    /// - the style of the text input (default, alternative)
    /// - status of the text input (the loader is dropped still the progress indicator is done)
    ///
    /// According to the `testStyle`, the right view for illustraiton is created and the right name of test is geneated.
    /// To reduce the number of snapshots, some configuration are set in a single illustration.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - testStyle: the type of test expected
    ///   - status: the status of the text input
    ///   - outlined: flag to know if outlined
    @MainActor private func testTextInput(theme: OUDSTheme,
                                          interfaceStyle: UIUserInterfaceStyle,
                                          testType: TestTextInputView.TestType,
                                          status: OUDSTextInput.Status,
                                          outlined: Bool)
    {
        // Generate the illustration for configuration elements
        let illustration = OUDSThemeableView(theme: theme) {
            TestTextInputView(type: testType, status: status, outlined: outlined)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test<testType>_<themeName>_<colorScheme>.<roundedPattern><stylePattern><statusPattern>
        let testName = "test-\(testType)_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let outlinedPattern = outlined ? ".outlined" : ""
        let statusPattern = status.technicalDescription.contains("error") ? "error" : status.technicalDescription

        let named = "\(outlinedPattern)\(statusPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: named,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit

struct TestTextInputView: View {

    /// Two types of test
    enum TestType: String {
        /// Used to test status and style on subset available layouts
        case styleAndStatus
        /// Used to test helpers
        case helpers
    }

    // MARK: - Stored properties

    let type: TestType
    let status: OUDSTextInput.Status
    let outlined: Bool
    private let icon = Image(decorative: "ic_heart")
    @State private var text = ""

    // MARK: - Body

    var body: some View {
        switch type {
        case .styleAndStatus:
            textInputWithStatus
        case .helpers:
            textinputWithHelper
        }
    }

    // MARK: - Layout for tests

    // swiftlint:disable closure_body_length
    /// View to test all layouts in once
    private var textInputWithStatus: some View {
        VStack(alignment: .leading, spacing: 1) {
            // Simplest text case
            OUDSTextInput(label: "Label",
                          text: $text,
                          isOutlined: outlined,
                          status: status)

            // With leading icon
            OUDSTextInput(label: "Label",
                          text: $text,
                          leadingIcon: icon,
                          isOutlined: outlined,
                          status: status)

            // With tariling action
            OUDSTextInput(label: "Label",
                          text: $text,
                          trailingAction: trailingAction,
                          isOutlined: outlined,
                          status: status)

            // With leading icon and tariling action
            OUDSTextInput(label: "Label",
                          text: $text,
                          leadingIcon: icon,
                          trailingAction: trailingAction,
                          isOutlined: outlined,
                          status: status)

            // More complex with placeholder
            OUDSTextInput(label: "Label",
                          text: $text,
                          placeholder: "PlaceHolder",
                          prefix: "£",
                          suffix: "$",
                          isOutlined: outlined,
                          status: status)

            // With placeholder and leading icon
            OUDSTextInput(label: "Label",
                          text: $text,
                          placeholder: "PlaceHolder",
                          prefix: "£",
                          suffix: "$",
                          leadingIcon: icon,
                          isOutlined: outlined,
                          status: status)

            // With placeholder and trailing action
            OUDSTextInput(label: "Label",
                          text: $text,
                          placeholder: "PlaceHolder",
                          prefix: "£",
                          suffix: "$",
                          trailingAction: trailingAction,
                          isOutlined: outlined,
                          status: status)

            // Full options
            OUDSTextInput(label: "Label",
                          text: $text,
                          placeholder: "PlaceHolder",
                          prefix: "£",
                          suffix: "$",
                          leadingIcon: icon,
                          trailingAction: trailingAction,
                          isOutlined: outlined,
                          status: status)
        }
    }

    // swiftlint:enable closure_body_length

    /// View to test helpers (Helper Text, Helper Link)
    private var textinputWithHelper: some View {
        VStack(alignment: .leading, spacing: 1) {
            OUDSTextInput(label: "Label",
                          text: $text,
                          helperText: "Helper text",
                          isOutlined: outlined,
                          status: status)

            OUDSTextInput(label: "Label",
                          text: $text,
                          helperLink: helperLink,
                          isOutlined: outlined,
                          status: status)

            OUDSTextInput(label: "Label",
                          text: $text,
                          helperText: "Helper text",
                          helperLink: helperLink,
                          isOutlined: outlined,
                          status: status)
        }
    }

    // MARK: - Heleprs

    private var trailingAction: OUDSTextInput.TrailingAction {
        .init(icon: icon, actionHint: "", action: {})
    }

    private var helperLink: OUDSTextInput.Helperlink {
        .init(text: "HelperLink") {}
    }
}
