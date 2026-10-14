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

/// Tests the UI rendering of the `OUDSAlertMessage` for each parameter
///
/// To limit the amount of reference images, the `statusIcon` axis is not given a dedicated reference image:
/// it is gathered into a single ``SnapshotGrid`` (one per `status` and per layout configuration), with one
/// assertion (and so one reference image) per grid. Each cell of the grid carries a short caption so a
/// regression stays identifiable directly in the resulting image. See `SnapshotGrid.swift`.
open class AlertMessageSnapshotsTestsTestCase: XCTestCase {

    /// The number of columns used to lay out the `statusIcon` grid for an alert message configuration.
    private static let gridColumns = 3

    /// Fixed size applied to each cell of the grid, so the resulting image has a stable, reproducible size.
    private static let gridCellSize = CGSize(width: 360, height: 220)

    /// This function tests some AlertMessage configuration for the given theme and color schemes on a standard surface.
    ///
    /// To reduce the size of memory of snapshots, two kinds of configuration are considered:
    /// - first: With action at the traling position, with bullet list and without close button
    /// - seconf: With action at the bottom position without bullet but with a close button
    /// For both, it iterates through all `AlertStatus` values; for each one, a single grid image gathers all
    /// `StatusIcons` variations.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAllAlertMessages(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for status in AlertStatus.allCases {
            // First configuration: with bullet list and action at top trailing position
            testAlertMessageGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                status: status,
                actionPosition: .topTrailing,
                closeButton: false,
                bullet2: "Bullet 2 is a bullet with a very long label to test the wrapping")

            // Second configuration: with action at bottom and with close button, but without bullet list
            testAlertMessageGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                status: status,
                actionPosition: .bottom,
                closeButton: true,
                bullet2: "")
        }
    }

    /// Builds the grid cell for a given `statusIcon` variant.
    @MainActor private func statusIconCell(
        _ statusIcon: StatusIcons,
        theme: OUDSTheme,
        status: AlertStatus,
        actionPosition: OUDSAlertMessage.Link.Position,
        closeButton: Bool,
        bullet2: String) -> SnapshotGridCell<AnyView>
    {
        let model = AlertMessageConfigurationModel()
        model.status = status
        model.statusIcon = statusIcon
        model.descriptionText = "Here is a long description that need two lines to be displayed"
        model.actionPosition = actionPosition
        model.closeButton = closeButton
        model.bullet2 = bullet2
        if bullet2.isEmpty {
            model.bullet1 = ""
            model.bullet3 = ""
        }

        return SnapshotGridCell(caption: statusIcon.formattedName) {
            AnyView(AlertMessageDemo(configurationModel: model))
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `statusIcon` variants for a given `status` and layout
    /// configuration, then captures it in a single snapshot.
    ///
    /// The snapshot is saved with a name based on the `status` and `actionPosition`, which are not folded
    /// into the grid.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - status: the status of the alert message
    ///   - actionPosition: position of the action link
    ///   - closeButton: whether the close button is displayed
    ///   - bullet2: the second bullet text (empty string disables the whole bullet list)
    @MainActor private func testAlertMessageGrid(
        theme: OUDSTheme,
        interfaceStyle: UIUserInterfaceStyle,
        status: AlertStatus,
        actionPosition: OUDSAlertMessage.Link.Position,
        closeButton: Bool,
        bullet2: String)
    {
        let cells = StatusIcons.allCases.map {
            statusIconCell(
                $0,
                theme: theme,
                status: status,
                actionPosition: actionPosition,
                closeButton: closeButton,
                bullet2: bullet2)
        }

        // Create a unique snapshot name based on the current configuration :
        //    test_<themeName>_<colorScheme>.<status>-<actionPosition>
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "\(status.technicalDescription)\(actionPosition.technicalDescription)"

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
}

// swiftlint:enable required_deinit
