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

/// Tests the UI rendering of the `OUDSTextArea` for each parameter.
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image).
///
/// Axes kept as separate files (= filename):
///   - `testType` ∈ {styleAndStatus, helpers}: each test type exercises a different content inside each cell
///     (status variants vs helper variants).
///   - `status` ∈ {enabled, error, loading, readOnly, disabled}: promoted so each file keeps a reasonable
///     amount of text areas (otherwise a single file would stack dozens of them, hurting readability).
///
/// Axes folded into each grid:
///   - `outlined × constrainedMaxWidth` (= 2 × 2 = 4 cells).
///
/// Grid layout:
///   - 2 columns: `outlined` ∈ {filled, outlined}.
///   - 2 rows: `constrainedMaxWidth` ∈ {full-width, constrained}.
///
/// **Note on the Loading status**: `OUDSTextArea.loading(progress:)` renders an
/// `OUDSCircularProgressIndicator(animated: true)` that animates from 0 to the target value. The
/// `TestTextAreaView` applies the "Solution F" (`.transaction { $0.animation = nil }`) so the arc is
/// captured at its target value instead of appearing empty at t=0.
///
/// **/!\ It does not test the hover and pressed states.**
open class TextAreaSnapshotsTestsTestCase: XCTestCase {

    // MARK: - Entry Point

    /// Tests all text area configurations for the given theme and color scheme on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllTextAreas(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for testType in TestTextAreaView.TestType.allCases {
            for status in OUDSTextArea.Status.allCases {
                testTextAreaGrid(theme: theme,
                                 interfaceStyle: interfaceStyle,
                                 testType: testType,
                                 status: status)
            }
        }
    }

    // MARK: - Grid Builder

    @MainActor private func testTextAreaGrid(theme: OUDSTheme,
                                             interfaceStyle: UIUserInterfaceStyle,
                                             testType: TestTextAreaView.TestType,
                                             status: OUDSTextArea.Status)
    {
        // 2 columns per outlined, 2 rows per constrainedMaxWidth.
        let rowAxes: [Bool] = [false, true] // constrainedMaxWidth
        let columnAxes: [Bool] = [false, true] // outlined

        var cells: [SnapshotGridCell<AnyView>] = []
        for constrainedMaxWidth in rowAxes {
            for outlined in columnAxes {
                cells.append(cell(theme: theme,
                                  testType: testType,
                                  outlined: outlined,
                                  constrainedMaxWidth: constrainedMaxWidth,
                                  status: status,
                                  caption: caption(outlined: outlined,
                                                   constrainedMaxWidth: constrainedMaxWidth)))
            }
        }

        let testName = "test-\(testType)_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let snapshotName = statusShort(status).capitalized

        let grid = SnapshotGrid(
            columns: columnAxes.count,
            cellSize: testType.cellSize,
            cells: cells,
            title: "\(testName).\(snapshotName)",
            cellSpacing: 24,
            rowSpacing: 24)

        let illustration = OUDSThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: snapshotName,
                           testName: testName)
    }

    // MARK: - Cell Builder

    @MainActor private func cell(theme: OUDSTheme,
                                 testType: TestTextAreaView.TestType,
                                 outlined: Bool,
                                 constrainedMaxWidth: Bool,
                                 status: OUDSTextArea.Status,
                                 caption: String) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    TestTextAreaView(type: testType,
                                     outlined: outlined,
                                     constrainedMaxWidth: constrainedMaxWidth,
                                     status: status)
                })
        }
    }

    // MARK: - Captions

    private func caption(outlined: Bool, constrainedMaxWidth: Bool) -> String {
        let outlinedShort = outlined ? "outlined" : "filled"
        let constrainedShort = constrainedMaxWidth ? "constrained" : "full-width"
        return "\(outlinedShort)\n\(constrainedShort)"
    }

    private func statusShort(_ status: OUDSTextArea.Status) -> String {
        switch status {
        case .enabled:
            "enabled"
        case .error:
            "error"
        case .loading:
            "loading"
        case .readOnly:
            "readOnly"
        case .disabled:
            "disabled"
        default:
            "other"
        }

    /// This function tests the `OUDSTextArea` skeleton state (default configuration) for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testTextAreaSkeleton(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSTextArea(label: "Label", text: .constant(""))
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testTextArea_skeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "TextAreaSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit

// MARK: - Test Text Area View

struct TestTextAreaView: View {

    /// Two types of test.
    enum TestType: String, CaseIterable {
        /// Used to test status on available layouts.
        case styleAndStatus
        /// Used to test helpers (plain text, characters max count, helper link).
        case helpers

        /// Fixed cell size used by the enclosing ``SnapshotGrid``. `helpers` stacks four text areas so
        /// the cell needs to be taller than ``styleAndStatus`` (which stacks two). Heights account for the
        /// 24pt inter-text-area spacing applied in `TestTextAreaView`.
        var cellSize: CGSize {
            switch self {
            case .styleAndStatus:
                CGSize(width: 400, height: 310)
            case .helpers:
                CGSize(width: 400, height: 620)
            }
        }
    }

    // MARK: - Properties

    let type: TestType
    let outlined: Bool
    let constrainedMaxWidth: Bool
    let status: OUDSTextArea.Status

    @State private var text = ""

    // MARK: - Body

    var body: some View {
        content
            // Solution F: force the circular progress indicator used by `.loading` to appear at its target
            // value instead of animating from 0 (which would otherwise capture an empty arc).
            .transaction { transaction in
                if isLoadingStatus {
                    transaction.animation = nil
                }
            }
    }

    @ViewBuilder
    private var content: some View {
        switch type {
        case .styleAndStatus:
            textAreaWithStatus
        case .helpers:
            textAreaWithHelpers
        }
    }

    private var isLoadingStatus: Bool {
        if case .loading = status { return true }
        return false
    }

    // MARK: - Layout for tests

    /// View to test basic status combinations
    private var textAreaWithStatus: some View {
        VStack(alignment: .leading, spacing: 24) {
            // Simplest case — no placeholder, no helper
            OUDSTextArea(label: "Label",
                         text: $text,
                         isOutlined: outlined,
                         constrainedMaxWidth: constrainedMaxWidth,
                         status: status)

            // With placeholder
            OUDSTextArea(label: "Label",
                         text: $text,
                         placeholder: "Placeholder",
                         isOutlined: outlined,
                         constrainedMaxWidth: constrainedMaxWidth,
                         status: status)
        }
        .padding(.horizontal, 12)
    }

    /// View to test helpers (Helper Text, Characters Max Count, Helper Link)
    private var textAreaWithHelpers: some View {
        VStack(alignment: .leading, spacing: 24) {
            // With plain helper text
            OUDSTextArea(label: "Label",
                         text: $text,
                         helperText: .plain("Helper text"),
                         isOutlined: outlined,
                         constrainedMaxWidth: constrainedMaxWidth,
                         status: status)

            // With characters max count
            OUDSTextArea(label: "Label",
                         text: $text,
                         helperText: .charactersMaxCount(180),
                         isOutlined: outlined,
                         constrainedMaxWidth: constrainedMaxWidth,
                         status: status)

            // With helper link
            OUDSTextArea(label: "Label",
                         text: $text,
                         helperLink: helperLink,
                         isOutlined: outlined,
                         constrainedMaxWidth: constrainedMaxWidth,
                         status: status)

            // With plain helper text and helper link
            OUDSTextArea(label: "Label",
                         text: $text,
                         helperText: .plain("Helper text"),
                         helperLink: helperLink,
                         isOutlined: outlined,
                         constrainedMaxWidth: constrainedMaxWidth,
                         status: status)
        }
        .padding(.horizontal, 12)
    }

    // MARK: - Helpers

    private var helperLink: OUDSTextArea.Helperlink {
        .init(text: "HelperLink") {}
    }
}

// MARK: - Extension of OUDS Text Area Status

extension OUDSTextArea.Status: @retroactive CaseIterable, @retroactive Hashable, DesignToolboxEnumLocalizedRepresentable {

    public static let allCases: [OUDSTextArea.Status] =
        [.enabled, .error(message: "app_components_textArea_errorDescription_label".localized()), .loading(progress: 0.75), .readOnly, .disabled]

    public var wordingKey: String {
        switch self {
        case .enabled:
            "app_common_enabled_tech"
        case .error:
            "app_components_common_error_tech"
        case .richError:
            "app_components_common_richError_tech"
        case .loading:
            "app_components_common_loader_tech"
        case .readOnly:
            "app_components_common_readOnly_tech"
        case .disabled:
            "app_common_disabled_tech"
        }
    }

    public var technicalDescription: String {
        if self == .readOnly {
            return ".readOnly"
        }
        if case let .error(message) = self {
            return ".error(message: \"\(message)\")"
        } else {
            return ".\(wordingKey.localized().lowercased())"
        }
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(wordingKey)
    }
}
