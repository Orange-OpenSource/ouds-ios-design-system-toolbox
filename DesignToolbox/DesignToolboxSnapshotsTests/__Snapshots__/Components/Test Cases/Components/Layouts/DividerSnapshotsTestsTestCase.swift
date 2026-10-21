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

/// Tests the UI rendering of the `OUDSDivider` for each parameter
///
/// To limit the amount of reference images, the `dividerColor` axis (`OUDSDividerColor`, 9 values) is not
/// given a dedicated reference image each: it is gathered into a single ``SnapshotGrid`` per orientation
/// (horizontal/vertical, kept as separate files since the layout differs), with one assertion (and so one
/// reference image) per grid. Each cell of the grid carries a short caption so a regression stays
/// identifiable directly in the resulting image. See `SnapshotGrid.swift`.
open class DividerSnapshotsTestsTestCase: XCTestCase {

    /// The number of columns used to lay out the `dividerColor` grid.
    private static let gridColumns = 3

    /// Fixed size applied to each cell of the grid for a horizontal divider.
    private static let horizontalCellSize = CGSize(width: 140, height: 60)

    /// Fixed size applied to each cell of the grid for a vertical divider.
    private static let verticalCellSize = CGSize(width: 60, height: 140)

    /// This function tests all divider configurations for the given theme and color schemes on a standard surface.
    ///
    /// It iterates through both layout `orientations`, gathering all `OUDSDividerColor` values of each
    /// orientation into a single grid.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAllDividers(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for orientation: DividerConfigurationModel.Orientation in [.horizontal, .vertical] {
            testDividerGrid(theme: theme, interfaceStyle: interfaceStyle, orientation: orientation)
        }
    }

    /// Builds the grid cell for a given divider color and orientation.
    ///
    /// `OUDSVerticalDivider` (resp. `OUDSHorizontalDivider`) only fixes its own thickness and relies on
    /// its parent to stretch it along the other axis (exactly like the real pages do, wrapping it in a
    /// `HStack`/`VStack`). Without such a parent stretching it, the divider keeps its intrinsic minimal
    /// length and barely shows up once laid out in a fixed-size grid cell. Wrapping it in a `HStack`/`VStack`
    /// with `.frame(maxHeight: .infinity)`/`.frame(maxWidth: .infinity)` reproduces that stretching so the
    /// divider fills the whole cell, as it would on its real usage page.
    @MainActor private func dividerColorCell(
        _ dividerColor: OUDSDividerColor,
        theme: OUDSTheme,
        orientation: DividerConfigurationModel.Orientation) -> SnapshotGridCell<AnyView>
    {
        let divider = DividerDemo(configurationModel: DividerConfigurationModel(orientation: orientation, selectedColor: dividerColor))
        return SnapshotGridCell(caption: dividerColor.formattedName) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    switch orientation {
                    case .horizontal:
                        VStack { divider.frame(maxWidth: .infinity) }
                    case .vertical:
                        HStack { divider.frame(maxHeight: .infinity) }
                    }
                })
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `OUDSDividerColor` values for a given orientation,
    /// then captures it in a single snapshot.
    ///
    /// The snapshot is saved with a name based on the parameter which is not folded into the grid:
    ///    test_<themeName>_<colorScheme>.<orientation>
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - orientation: the orientation of the divider (i.e. OUDSHorizontalDivider or OUDSVerticalDivider)
    @MainActor private func testDividerGrid(theme: OUDSTheme,
                                            interfaceStyle: UIUserInterfaceStyle,
                                            orientation: DividerConfigurationModel.Orientation)
    {
        let cells = OUDSDividerColor.allCases.map {
            dividerColorCell($0, theme: theme, orientation: orientation)
        }

        // Create a unique snapshot name based on the current configuration :
        //    test_<themeName>_<colorScheme>.<orientation>
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let orientationPatern = orientation == .horizontal ? "Horizontal" : "Vertical"
        let name = orientationPatern

        let grid = SnapshotGrid(
            columns: Self.gridColumns,
            cellSize: orientation == .horizontal ? Self.horizontalCellSize : Self.verticalCellSize,
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
