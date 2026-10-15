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

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSInlineAlert` for each parameter
///
/// To limit the amount of reference images, the `statusIcon` axis is not given a dedicated reference image:
/// it is gathered into a single ``SnapshotGrid`` (one per `status`), with one assertion (and so one reference
/// image) per grid. Each cell of the grid carries a short caption so a regression stays identifiable directly
/// in the resulting image. See `SnapshotGrid.swift`.
open class InlineAlertSnapshotsTestsTestCase: XCTestCase {

    /// The number of columns used to lay out the `statusIcon` grid for an inline alert configuration.
    private static let gridColumns = 3

    /// Fixed size applied to each cell of the grid, so the resulting image has a stable, reproducible size.
    private static let gridCellSize = CGSize(width: 360, height: 80)

    /// This function tests some InlineAlert configuration for the given theme and color schemes on a standard surface.
    /// It iterates through all `AlertStatus` values; for each one, a single grid image gathers all `StatusIcons`
    /// variations.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAllInlineAlerts(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for status in AlertStatus.allCases {
            testInlineAlertGrid(theme: theme, interfaceStyle: interfaceStyle, status: status)
        }
    }

    /// Builds the grid cell for a given `statusIcon` variant.
    @MainActor private func statusIconCell(
        _ statusIcon: StatusIcons,
        theme: OUDSTheme,
        status: AlertStatus) -> SnapshotGridCell<AnyView>
    {
        let model = InlineAlertConfigurationModel()
        model.status = status
        model.statusIcon = statusIcon

        return SnapshotGridCell(caption: statusIcon.formattedName) {
            AnyView(InlineAlertDemo(configurationModel: model))
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `statusIcon` variants for a given `status`, then captures it
    /// in a single snapshot.
    ///
    /// The snapshot is saved with a name based on the `status`, which is not folded into the grid.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - status: the status of the inline alert
    @MainActor private func testInlineAlertGrid(
        theme: OUDSTheme,
        interfaceStyle: UIUserInterfaceStyle,
        status: AlertStatus)
    {
        let cells = StatusIcons.allCases.map {
            statusIconCell($0, theme: theme, status: status)
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = status.technicalDescription

        let grid = SnapshotGrid(
            columns: Self.gridColumns,
            cellSize: Self.gridCellSize,
            cells: cells,
            title: "\(testName).\(name)")

        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Capture the snapshot of the grid with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    /// This function tests the `OUDSInlineAlert` skeleton state (default configuration) for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testInlineAlertSkeleton(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSInlineAlert(label: "Inline alert", status: .info)
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testInlineAlert_skeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "InlineAlertSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
