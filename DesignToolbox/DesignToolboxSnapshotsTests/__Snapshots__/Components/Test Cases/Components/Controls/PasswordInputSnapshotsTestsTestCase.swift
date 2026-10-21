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

/// Tests the UI rendering of the `OUDSPasswordInput` for each parameter.
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image).
///
/// Axes kept as separate files (= filename):
///   - `status` ∈ {enabled, error, loading, readOnly, disabled}: promoted so each file keeps a reasonable
///     amount of password inputs and so a regression is easy to identify.
///
/// Axes folded into each grid (= `outlined × lockIcon` = 2 × 2 = 4 cells):
///   - 2 columns: `lockIcon` ∈ {no lock, lock}.
///   - 2 rows: `outlined` ∈ {filled, outlined}.
///
/// Total: 5 files per theme-scheme instead of 20.
///
/// **Note on the Loading status**: `OUDSTextInput.loading(progress:)` renders an
/// `OUDSCircularProgressIndicator(animated: true)` that animates from 0 to the target value. The
/// `TestPasswordInputView` applies the "Solution F" (`.transaction { $0.animation = nil }`) so the arc is
/// captured at its target value instead of appearing empty at t=0.
///
/// **/!\ It does not test the hover and pressed states.**
open class PasswordInputSnapshotsTestsTestCase: XCTestCase {

    // MARK: - Entry Point

    /// Tests all password input configurations for the given theme and color scheme on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllPasswordInputs(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for status in OUDSTextInput.Status.allCases {
            testPasswordInputGrid(theme: theme,
                                  interfaceStyle: interfaceStyle,
                                  status: status)
        }
    }

    // MARK: - Grid Builder

    @MainActor private func testPasswordInputGrid(theme: OUDSTheme,
                                                  interfaceStyle: UIUserInterfaceStyle,
                                                  status: OUDSTextInput.Status)
    {
        // 2 columns per lockIcon, 2 rows per outlined.
        let rowAxes: [Bool] = [false, true] // outlined
        let columnAxes: [Bool] = [false, true] // lockIcon

        var cells: [SnapshotGridCell<AnyView>] = []
        for outlined in rowAxes {
            for lockIcon in columnAxes {
                cells.append(cell(theme: theme,
                                  lockIcon: lockIcon,
                                  status: status,
                                  outlined: outlined,
                                  caption: caption(outlined: outlined, lockIcon: lockIcon)))
            }
        }

        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let snapshotName = statusShort(status).capitalized

        let grid = SnapshotGrid(
            columns: columnAxes.count,
            cellSize: CGSize(width: 400, height: 320),
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
                                 lockIcon: Bool,
                                 status: OUDSTextInput.Status,
                                 outlined: Bool,
                                 caption: String) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    TestPasswordInputView(lockIcon: lockIcon,
                                          status: status,
                                          outlined: outlined)
                })
        }
    }

    // MARK: - Captions / Names

    private func caption(outlined: Bool, lockIcon: Bool) -> String {
        let outlinedShort = outlined ? "outlined" : "filled"
        let lockShort = lockIcon ? "lock" : "no lock"
        return "\(outlinedShort)\n\(lockShort)"
    }

    private func statusShort(_ status: OUDSTextInput.Status) -> String {
        switch status {
        case .enabled:
            "enabled"
        case .error, .textualError:
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
    }

    /// This function tests the `OUDSPasswordInput` skeleton state (default configuration) for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testPasswordInputSkeleton(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSPasswordInput(label: "Password", password: .constant(""))
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testPasswordInput_skeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "PasswordInputSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit

// MARK: - Test Password Input View

struct TestPasswordInputView: View {

    // MARK: - Stored properties

    let lockIcon: Bool
    let status: OUDSTextInput.Status
    let outlined: Bool

    @State private var password = ""

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

    private var content: some View {
        VStack(spacing: 24) {
            OUDSPasswordInput(label: "Password",
                              password: $password,
                              lockIcon: lockIcon,
                              isOutlined: outlined,
                              status: status)

            OUDSPasswordInput(label: "Password",
                              password: $password,
                              placeholder: "Placeholder",
                              prefix: "CORP-",
                              lockIcon: lockIcon,
                              helperText: "Helper text.",
                              isOutlined: outlined,
                              status: status)
        }
        .padding(.horizontal, 12)
    }

    private var isLoadingStatus: Bool {
        if case .loading = status { return true }
        return false
    }
}
