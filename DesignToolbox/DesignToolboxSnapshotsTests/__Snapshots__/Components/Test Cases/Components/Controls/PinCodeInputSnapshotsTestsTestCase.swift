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

/// Tests the UI rendering of the `OUDSPinCodeInput` for each parameter.
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image).
///
/// Axes kept as separate files (= filename):
///   - `length` ∈ {4, 6, 8}: the horizontal width of the component varies notably with the number of boxes,
///     so splitting keeps the grid cells homogeneous per file.
///
/// Axes folded into each grid (= `status × outlined × isFull × helperText` = 2 × 2 × 2 × 2 = 16 cells):
///   - For `length ∈ {4, 6}`: 4 columns × 4 rows (cells 350×180).
///   - For `length == 8`: 2 columns × 8 rows (cells 600×180). The 8-boxes pin code is wider than the
///     narrow 350pt cell can accommodate, so each row holds only two cells.
///
/// Total: 3 files per theme-scheme instead of 48.
open class PinCodeInputSnapshotsTestsTestCase: XCTestCase {

    // MARK: - Entry Point

    /// Tests all pin code input configurations for the given theme and color scheme on a standard surface.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllPinCodeInputs(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for length in OUDSPinCodeInput.Length.allCases {
            testPinCodeGrid(theme: theme,
                            interfaceStyle: interfaceStyle,
                            length: length)
        }
    }

    // MARK: - Grid Builder

    @MainActor private func testPinCodeGrid(theme: OUDSTheme,
                                            interfaceStyle: UIUserInterfaceStyle,
                                            length: OUDSPinCodeInput.Length)
    {
        // 4 columns: outlined × isFull
        // 4 rows: status × helperText
        let columnAxes: [(outlined: Bool, isFull: Bool)] = [
            (false, false), (false, true), (true, false), (true, true),
        ]
        let rowAxes: [(status: OUDSPinCodeInput.Status, helperText: String)] = [
            (.enabled, ""),
            (.enabled, "Helper text"),
            (.error(message: "Error message"), ""),
            (.error(message: "Error message"), "Helper text"),
        ]

        var cells: [SnapshotGridCell<AnyView>] = []
        for row in rowAxes {
            for column in columnAxes {
                cells.append(cell(theme: theme,
                                  length: length,
                                  isFull: column.isFull,
                                  helperText: row.helperText,
                                  outlined: column.outlined,
                                  status: row.status,
                                  caption: caption(outlined: column.outlined,
                                                   isFull: column.isFull,
                                                   status: row.status,
                                                   helperText: row.helperText)))
            }
        }

        let testName = "test-_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let snapshotName = "Length\(lengthPattern(length))"

        // Length 8 is too wide for 4 narrow columns, so it uses a 2-column layout with wider cells.
        let gridColumns = length == .eight ? 2 : columnAxes.count
        let gridCellSize = length == .eight
            ? CGSize(width: 600, height: 180)
            : CGSize(width: 350, height: 180)

        let grid = SnapshotGrid(
            columns: gridColumns,
            cellSize: gridCellSize,
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

    // swiftlint:disable function_parameter_count
    @MainActor private func cell(theme: OUDSTheme,
                                 length: OUDSPinCodeInput.Length,
                                 isFull: Bool,
                                 helperText: String,
                                 outlined: Bool,
                                 status: OUDSPinCodeInput.Status,
                                 caption: String) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    TestPinCodeInputView(length: length,
                                         isFull: isFull,
                                         helperText: helperText,
                                         outlined: outlined,
                                         status: status)
                })
        }
    }

    // swiftlint:enable function_parameter_count

    // MARK: - Captions / Names

    private func caption(outlined: Bool, isFull: Bool, status: OUDSPinCodeInput.Status, helperText: String) -> String {
        let outlinedShort = outlined ? "outlined" : "filled"
        let fullShort = isFull ? "full" : "empty"
        let statusShort = status == .enabled ? "enabled" : "error"
        let helperShort = helperText.isEmpty ? "no helper" : "helper"
        return "\(outlinedShort) · \(fullShort)\n\(statusShort) · \(helperShort)"
    }

    private func lengthPattern(_ length: OUDSPinCodeInput.Length) -> String {
        switch length {
        case .four:
            "4"
        case .six:
            "6"
        case .eight:
            "8"
        }
    }
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
                         hiddenCharacters: true,
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
