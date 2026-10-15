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

/// Tests the UI rendering of the `OUDSBadgeStandard`, `OUDSBadgeIcon` and `OUDSBadgeCount` for each parameter
///
/// To limit the amount of reference images, badges being tiny illustrations:
///   - `OUDSBadgeStandard`: the `status` (6 values) and `size` (4 values) axes are gathered into a single
///     ``SnapshotGrid`` (24 cells).
///   - `OUDSBadgeCount`: the `status` (6 values) and `size` (2 values) axes are gathered into a single
///     ``SnapshotGrid`` (12 cells).
///   - `OUDSBadgeIcon`: the `statusIcon` axis (image/tintedIcon) is kept as a separate file since it changes
///     the nature of the rendered glyph; the `statusKind` (6 values) and `size` (4 values) axes are gathered
///     into a single ``SnapshotGrid`` per `statusIcon` (24 cells).
/// Each cell of a grid carries a short caption so a regression stays identifiable directly in the resulting
/// image. See `SnapshotGrid.swift`.
open class BadgeSnapshotsTestsTestCase: XCTestCase {

    /// The number of columns used to lay out the `OUDSBadgeStandard` and `OUDSBadgeIcon` grids, so each row
    /// shows all sizes of one single status (one row per status).
    private static let standardAndIconGridColumns = OUDSBadgeStandard.Size.allCases.count

    /// The number of columns used to lay out the `OUDSBadgeCount` grid, so each row shows all sizes of one
    /// single status (one row per status).
    private static let countGridColumns = OUDSBadgeCount.Size.allCases.count

    /// Fixed size applied to each cell of the `OUDSBadgeStandard` grid.
    private static let standardCellSize = CGSize(width: 80, height: 60)

    /// Fixed size applied to each cell of the `OUDSBadgeIcon` grid.
    private static let iconCellSize = CGSize(width: 80, height: 70)

    /// Fixed size applied to each cell of the `OUDSBadgeCount` grid.
    private static let countCellSize = CGSize(width: 100, height: 60)

    /// This function tests all badges with all types, status and size for the given theme and color scheme.
    ///
    /// It iterates through the axes which are kept as separate files, gathering the other axes into grids.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllBadges(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        testBadgeStandardGrid(theme: theme, interfaceStyle: interfaceStyle)
        testBadgeCountGrid(theme: theme, interfaceStyle: interfaceStyle)
        for statusIcon in DefinedStatusIcons.allCases {
            testBadgeIconGrid(theme: theme, interfaceStyle: interfaceStyle, statusIcon: statusIcon)
        }
    }

    // MARK: - OUDSBadgeStandard

    /// Builds the grid cell for a given `OUDSBadgeStandard` status and size.
    @MainActor private func badgeStandardCell(
        status: OUDSBadgeStandard.Status,
        size: OUDSBadgeStandard.Size,
        theme: OUDSTheme) -> SnapshotGridCell<AnyView>
    {
        let model = BadgeStandardConfigurationModel()
        model.status = status
        model.standardSize = size
        return SnapshotGridCell(caption: "\(status.technicalDescription)\n\(size.technicalDescription)") {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    BadgeStandardDemo(configurationModel: model)
                })
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `status` and `size` values of `OUDSBadgeStandard`,
    /// then captures it in a single snapshot.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    @MainActor private func testBadgeStandardGrid(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let cells = OUDSBadgeStandard.Status.allCases.flatMap { status in
            OUDSBadgeStandard.Size.allCases.map { size in
                badgeStandardCell(status: status, size: size, theme: theme)
            }
        }

        let testName = "testBadge_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "StandardBadge"

        let grid = SnapshotGrid(
            columns: Self.standardAndIconGridColumns,
            cellSize: Self.standardCellSize,
            cells: cells,
            title: "\(testName).\(name)")

        let illustration = OUDSThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    // MARK: - OUDSBadgeIcon

    /// Builds the grid cell for a given `OUDSBadgeIcon` status kind, size and status icon.
    @MainActor private func badgeIconCell(
        statusKind: BadgeIconStatusKind,
        size: OUDSBadgeStandard.Size,
        statusIcon: DefinedStatusIcons,
        theme: OUDSTheme) -> SnapshotGridCell<AnyView>
    {
        let model = BadgeIconConfigurationModel()
        model.statusKind = statusKind
        model.size = size
        model.statusIcon = statusIcon
        return SnapshotGridCell(caption: "\(statusKind.technicalDescription)\n\(size.technicalDescription)") {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    BadgeIconDemo(configurationModel: model)
                })
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `statusKind` and `size` values of `OUDSBadgeIcon` for a given
    /// `statusIcon`, then captures it in a single snapshot.
    ///
    /// The snapshot is saved with a name based on the parameter which is not folded into the grid:
    ///    testBadge_<themeName>_<colorScheme>.IconBadge-<statusIcon>
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - statusIcon: The status icon kind (image or tintedIcon)
    @MainActor private func testBadgeIconGrid(theme: OUDSTheme,
                                              interfaceStyle: UIUserInterfaceStyle,
                                              statusIcon: DefinedStatusIcons)
    {
        let cells = BadgeIconStatusKind.allCases.flatMap { statusKind in
            OUDSBadgeStandard.Size.allCases.map { size in
                badgeIconCell(statusKind: statusKind, size: size, statusIcon: statusIcon, theme: theme)
            }
        }

        let testName = "testBadge_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "IconBadge-\(statusIcon.technicalDescription)"

        let grid = SnapshotGrid(
            columns: Self.standardAndIconGridColumns,
            cellSize: Self.iconCellSize,
            cells: cells,
            title: "\(testName).\(name)")

        let illustration = OUDSThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    // MARK: - OUDSBadgeCount

    /// Builds the grid cell for a given `OUDSBadgeCount` status and size.
    @MainActor private func badgeCountCell(
        status: OUDSBadgeStandard.Status,
        size: OUDSBadgeCount.Size,
        theme: OUDSTheme) -> SnapshotGridCell<AnyView>
    {
        let model = BadgeCountConfigurationModel()
        model.status = status
        model.countSize = size
        model.countText = "100"
        return SnapshotGridCell(caption: "\(status.technicalDescription)\n\(size.technicalDescription)") {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    BadgeCountDemo(configurationModel: model)
                })
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `status` and `size` values of `OUDSBadgeCount`,
    /// then captures it in a single snapshot.
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    @MainActor private func testBadgeCountGrid(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let cells = OUDSBadgeStandard.Status.allCases.flatMap { status in
            OUDSBadgeCount.Size.allCases.map { size in
                badgeCountCell(status: status, size: size, theme: theme)
            }
        }

        let testName = "testBadge_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "CountBadge"

        let grid = SnapshotGrid(
            columns: Self.countGridColumns,
            cellSize: Self.countCellSize,
            cells: cells,
            title: "\(testName).\(name)")

        let illustration = OUDSThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
