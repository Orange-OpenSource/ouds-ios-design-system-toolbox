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

/// Tests the UI rendering of the `OUDSSkeleton` for each parameter.
///
/// To limit the amount of reference images, the `shape` axis (4 values: `Rectangle`,
/// `RoundedRectangle` with corner radius `0` and `.infinity`, `Circle`) and the `securityMargin` axis
/// (2 values: `true` / `false`) are not given a dedicated reference image each: they are both gathered
/// into a single ``SnapshotGrid`` per theme/color scheme, with one assertion (and so one reference image)
/// per grid. Each cell of the grid carries a short caption so a regression stays identifiable directly
/// in the resulting image. See `SnapshotGrid.swift`.
///
/// **The shimmer animation is disabled for the tests (`isAnimated: false`) to make snapshots deterministic.**
@available(iOS 16.0, *) // <--- available iOS 16+ because of AnyShape
open class SkeletonSnapshotsTestsTestCase: XCTestCase {

    /// The number of columns used to lay out the shapes grid (one column per shape).
    private static let gridColumns = 4

    /// Fixed size applied to each cell of the grid, matching the original per-snapshot frame.
    private static let cellSize = CGSize(width: 200, height: 62)

    /// This function tests all skeleton configurations for the given theme and color scheme.
    ///
    /// It gathers both the `shape` axis and the `securityMargin` axis into a single ``SnapshotGrid``,
    /// producing one reference image per theme × color scheme instead of one image per combination.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllSkeletons(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        testSkeletonGrid(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Builds a single ``SnapshotGrid`` cell for the given `shape` × `securityMargin` combination.
    ///
    /// - Parameters:
    ///   - shapeName: The technical name of the shape, used as part of the cell caption.
    ///   - shape: The shape applied on the skeleton.
    ///   - securityMargin: Whether to apply vertical padding to the skeleton.
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    @MainActor private func skeletonCell(shapeName: String,
                                         shape: AnyShape,
                                         securityMargin: Bool,
                                         theme: OUDSTheme) -> SnapshotGridCell<AnyView>
    {
        let securityMarginCaption = securityMargin ? "+ securityMargin" : "no securityMargin"
        let caption = "\(shapeName)\n\(securityMarginCaption)"
        return SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    OUDSSkeleton(securityMargin: securityMargin, shape: shape)
                        .frame(width: Self.cellSize.width, height: Self.cellSize.height, alignment: .center)
                        .showSkeleton(isVisible: true, isAnimated: false)
                })
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `shape` × `securityMargin` combinations for the given
    /// theme and color scheme, then captures it in a single snapshot.
    ///
    /// The snapshot is saved with a name based on the parameters which are not folded into the grid:
    ///    test_<themeName>_<colorScheme>.AllShapes
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor private func testSkeletonGrid(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let shapes: [(name: String, shape: AnyShape)] = [
            ("Rectangle", AnyShape(Rectangle())),
            ("RoundedRectangle_radius0", AnyShape(RoundedRectangle(cornerRadius: 0))),
            ("RoundedRectangle_radiusInfinity", AnyShape(RoundedRectangle(cornerRadius: .infinity))),
            ("Circle", AnyShape(Circle())),
        ]

        var cells: [SnapshotGridCell<AnyView>] = []
        for securityMargin in [true, false] {
            for (shapeName, shape) in shapes {
                cells.append(skeletonCell(shapeName: shapeName,
                                          shape: shape,
                                          securityMargin: securityMargin,
                                          theme: theme))
            }
        }

        // Create a unique snapshot name based on the current configuration :
        //    test_<themeName>_<colorScheme>.AllShapes
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "AllShapes"

        let grid = SnapshotGrid(
            columns: Self.gridColumns,
            cellSize: Self.cellSize,
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
