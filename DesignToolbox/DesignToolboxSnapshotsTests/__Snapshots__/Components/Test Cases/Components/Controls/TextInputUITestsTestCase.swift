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
import OUDSThemesOrange
import OUDSTokensRaw
import OUDSTokensSemantic
import SnapshotTesting
import SwiftUI
import XCTest

// MARK: - Test Cases

// swiftlint:disable required_deinit
/// Tests the UI rendering of the `OUDSTextInput` for each parameter
open class TextInputUITestsTestCase: XCTestCase {

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

        for rounded in [true, false] {
            for style in OUDSTextInput.Style.allCases {
                // Drop the loading status still the progress indicator is done
                for status in OUDSTextInput.Status.allCases where status != .loading {
                    testTextInput(theme: theme, interfaceStyle: interfaceStyle, testType: .styleAndStatus, rounded: rounded, status: status, style: style)
                    testTextInput(theme: theme, interfaceStyle: interfaceStyle, testType: .helpers, rounded: rounded, status: status, style: style)
                }
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
    ///   - rounded: the rounded flag
    ///   - status: the status of the text input
    ///   - style: the style of the text input
    @MainActor private func testTextInput(theme: OUDSTheme,
                                          interfaceStyle: UIUserInterfaceStyle,
                                          testType: TestTextInputView.TestType,
                                          rounded: Bool,
                                          status: OUDSTextInput.Status,
                                          style: OUDSTextInput.Style)
    {
        // Generate the illustration for configuration elements
        let illustration = OUDSThemeableView(theme: theme) {
            TestTextInputView(type: testType, status: status, style: style)
                .environment(\.oudsRoundedTextInput, rounded)
                .background(theme.colors.colorBgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test<testType>_<themeName>_<colorScheme>.<roundedPattern><stylePattern><statusPattern>
        let testName = "test\(testType)_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let roundedPettern = rounded ? ".rounded" : ""
        let stylePattern = style.technicalDescription.localized()
        let statusPattern = status.technicalDescription

        let named = "\(roundedPettern)\(stylePattern)\(statusPattern)"

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
    let style: OUDSTextInput.Style
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

    /// View to test all layouts in once
    private var textInputWithStatus: some View {
        VStack(alignment: .leading, spacing: 1) {
            OUDSTextInput(layout: .label, label: "Label", text: $text, status: status)
            OUDSTextInput(layout: .label, label: "Label", text: $text, leadingIcon: icon, status: status)
            OUDSTextInput(layout: .label, label: "Label", text: $text, trailingAction: trailingAction, status: status)
            OUDSTextInput(layout: .label, label: "Label", text: $text, leadingIcon: icon, trailingAction: trailingAction, status: status)

            OUDSTextInput(layout: .placeholder, label: "Label", text: $text, placeholder: placeholder, status: status)
            OUDSTextInput(layout: .placeholder, label: "Label", text: $text, placeholder: placeholder, leadingIcon: icon, status: status)
            OUDSTextInput(layout: .placeholder, label: "Label", text: $text, placeholder: placeholder, trailingAction: trailingAction, status: status)
            OUDSTextInput(layout: .placeholder, label: "Label", text: $text, placeholder: placeholder, leadingIcon: icon, trailingAction: trailingAction, status: status)
        }
    }

    /// View to test helpers (Helper Text, Helper Link)
    private var textinputWithHelper: some View {
        VStack(alignment: .leading, spacing: 1) {
            OUDSTextInput(layout: .label, label: "Label", text: $text, helperText: "Helper text", status: status)
            OUDSTextInput(layout: .label, label: "Label", text: $text, helperLink: helperLink, status: status)
            OUDSTextInput(layout: .label, label: "Label", text: $text, helperText: "Helper text", helperLink: helperLink, status: status)
        }
    }

    // MARK: - Heleprs

    private var trailingAction: OUDSTextInput.TrailingAction {
        .init(icon: icon, accessibilityLabel: "", action: {})
    }

    private var placeholder: OUDSTextInput.Placeholder {
        .init(text: "PlaceHolder", prefix: "£", suffix: "$")
    }

    private var helperLink: OUDSTextInput.Helperlink {
        .init(text: "HelperLink") {}
    }
}
