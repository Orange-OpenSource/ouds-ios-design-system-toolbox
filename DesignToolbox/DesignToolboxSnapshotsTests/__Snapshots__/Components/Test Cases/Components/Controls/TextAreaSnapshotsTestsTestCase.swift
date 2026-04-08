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
/// Tests the UI rendering of the `OUDSTextArea` for each parameter
open class TextAreaSnapshotsTestsTestCase: XCTestCase {

    /// This function tests some text area configurations for the given theme and color schemes on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// It iterates through all combinations of configuration:
    /// - the constrained max width layout
    /// - the status of the text area
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllTextAreas(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for constrainedMaxWidth in [true, false] {
            // Drop the loading status still the progress indicator is done
            for status in OUDSTextArea.Status.allCases where status != .loading {
                testTextArea(theme: theme,
                             interfaceStyle: interfaceStyle,
                             testType: .styleAndStatus,
                             constrainedMaxWidth: constrainedMaxWidth,
                             status: status)
                testTextArea(theme: theme,
                             interfaceStyle: interfaceStyle,
                             testType: .helpers,
                             constrainedMaxWidth: constrainedMaxWidth,
                             status: status)
            }
        }
    }

    /// This function tests a text area configuration for the given theme and color scheme on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// According to the `testType`, the right view for illustration is created and the right name of test is generated.
    /// To reduce the number of snapshots, some configurations are set in a single illustration.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - testType: The type of test expected.
    ///   - constrainedMaxWidth: Whether the max width is constrained.
    ///   - status: The status of the text area.
    @MainActor private func testTextArea(theme: OUDSTheme,
                                         interfaceStyle: UIUserInterfaceStyle,
                                         testType: TestTextAreaView.TestType,
                                         constrainedMaxWidth: Bool,
                                         status: OUDSTextArea.Status)
    {
        // Generate the illustration for configuration elements
        let illustration = OUDSThemeableView(theme: theme) {
            TestTextAreaView(type: testType,
                             constrainedMaxWidth: constrainedMaxWidth,
                             status: status)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration:
        // test<testType>_<themeName>_<colorScheme>.<constrainedPattern><statusPattern>
        let testName = "test-\(testType)_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let constrainedPattern = constrainedMaxWidth ? "_Constrained" : ""
        let statusPattern = status.technicalDescription.contains("error") ? "error" : status.technicalDescription

        let named = "\(constrainedPattern)\(statusPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: named,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit

struct TestTextAreaView: View {

    /// Two types of test
    enum TestType: String {
        /// Used to test status on available layouts
        case styleAndStatus
        /// Used to test helpers (plain text, characters remaining, helper link)
        case helpers
    }

    // MARK: - Stored properties

    let type: TestType
    let constrainedMaxWidth: Bool
    let status: OUDSTextArea.Status

    @State private var text = ""

    // MARK: - Body

    var body: some View {
        switch type {
        case .styleAndStatus:
            textAreaWithStatus
        case .helpers:
            textAreaWithHelpers
        }
    }

    // MARK: - Layout for tests

    /// View to test basic status combinations
    private var textAreaWithStatus: some View {
        VStack(alignment: .leading, spacing: 1) {
            // Simplest case — no placeholder, no helper
            OUDSTextArea(label: "Label",
                         text: $text,
                         constrainedMaxWidth: constrainedMaxWidth,
                         status: status)

            // With placeholder
            OUDSTextArea(label: "Label",
                         text: $text,
                         placeholder: "Placeholder",
                         constrainedMaxWidth: constrainedMaxWidth,
                         status: status)
        }
    }

    /// View to test helpers (Helper Text, Characters Remaining, Helper Link)
    private var textAreaWithHelpers: some View {
        VStack(alignment: .leading, spacing: 1) {
            // With plain helper text
            OUDSTextArea(label: "Label",
                         text: $text,
                         helperText: .plain("Helper text"),
                         constrainedMaxWidth: constrainedMaxWidth,
                         status: status)

            // With characters max count
            OUDSTextArea(label: "Label",
                         text: $text,
                         helperText: .charactersMaxCount(200),
                         constrainedMaxWidth: constrainedMaxWidth,
                         status: status)

            // With helper link
            OUDSTextArea(label: "Label",
                         text: $text,
                         helperLink: helperLink,
                         constrainedMaxWidth: constrainedMaxWidth,
                         status: status)

            // With plain helper text and helper link
            OUDSTextArea(label: "Label",
                         text: $text,
                         helperText: .plain("Helper text"),
                         helperLink: helperLink,
                         constrainedMaxWidth: constrainedMaxWidth,
                         status: status)
        }
    }

    // MARK: - Helpers

    private var helperLink: OUDSTextArea.Helperlink {
        .init(text: "HelperLink") {}
    }
}
