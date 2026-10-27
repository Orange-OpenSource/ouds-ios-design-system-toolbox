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

/// Tests the UI rendering of the `OUDSAlertBanner` for each parameter
///
/// To limit the amount of reference images, the `statusIcon` axis is not given a dedicated reference image:
/// it is gathered into a single ``SnapshotGrid`` (one per `status` and per layout configuration), with one
/// assertion (and so one reference image) per grid. Each cell of the grid carries a short caption so a
/// regression stays identifiable directly in the resulting image. See `SnapshotGrid.swift`.
open class AlertBannerSnapshotsTestsTestCase: XCTestCase {

    /// The number of columns used to lay out the `statusIcon` grid for an alert Banner configuration.
    private static let gridColumns = 3

    /// Fixed size applied to each cell of the grid, so the resulting image has a stable, reproducible size.
    private static let gridCellSize = CGSize(width: 360, height: 220)

    /// This function tests some AlertBanner configuration for the given theme and color schemes on a standard surface.
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
    @MainActor func testAllAlertBanners(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for status in AlertStatus.allCases {
            // First configuration: with bullet list and action at top trailing position
            testAlertBannerGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                status: status,
                layout: .center)

            // Second configuration: with action at bottom and with close button, but without bullet list
            testAlertBannerGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                status: status,
                layout: .start)
        }
    }

    /// Builds the grid cell for a given `layout` variant.
    @MainActor private func layoutCell(
        layout: AlertBannerConfigurationModel.Layout,
        theme: OUDSTheme,
        status: AlertStatus,
        alignemnt: OUDSAlertBanner.Alignment?) -> SnapshotGridCell<AnyView>
    {
        let model = AlertBannerConfigurationModel()
        model.layout = layout
        model.status = status
        model.descriptionText = "Here is a long description that need two lines to be displayed"
        model.containersAlignment = alignemnt ?? .center
        model.actionPosition = .topTrailing
        model.hasActionLink = alignemnt != nil
        model.closeButton = true

        return SnapshotGridCell(caption: layout.formattedName) {
            AnyView(AlertBannerDemo(configurationModel: model))
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
    ///   - status: the status of the alert Banner
    ///   - actionPosition: position of the action link
    ///   - closeButton: whether the close button is displayed
    @MainActor private func testAlertBannerGrid(
        theme: OUDSTheme,
        interfaceStyle: UIUserInterfaceStyle,
        status: AlertStatus,
        layout: AlertBannerConfigurationModel.Layout)
    {
        // Alignment set to nil means no action link
        // Filter .center alignment for .center layout (because always on top)
        let actionAlignemnt: [OUDSAlertBanner.Alignment?] = [nil, .center, .top].filter {
            !(layout == .center && $0 == .center)
        }

        let cells = actionAlignemnt.map { alignment in
            layoutCell(
                layout: layout,
                theme: theme,
                status: status,
                alignemnt: alignment)
        }

        // Create a unique snapshot name based on the current configuration :
        //    test_<themeName>_<colorScheme>.<status>-<layout>
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "\(status.technicalDescription)\(layout.technicalDescription)"

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

    /// This function tests the `OUDSAlertBanner` skeleton state (default configuration) for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAlertBannerSkeleton(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSAlertBanner(layout: .start(label: "Alert Banner", status: .negative))
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testAlertBanner_skeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "AlertBannerSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
