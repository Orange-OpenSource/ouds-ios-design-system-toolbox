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

/// Tests the UI rendering of the `OUDSBulletList` for each parameter
///
/// To limit the amount of reference images, the `isBold` axis (and, for `unordered` lists, the
/// `unorderedAsset` and `unorderedBulletIsBranded` axes) is not given a dedicated reference image:
/// it is gathered into a single ``SnapshotGrid`` per (theme, color scheme, type, textStyle, levelCount)
/// combination, with one assertion (and so one reference image) per grid. Each cell of the grid carries
/// a short caption so a regression stays identifiable directly in the resulting image. See `SnapshotGrid.swift`.
open class BulletListSnapshotsTestsTestCase: XCTestCase {

    /// The number of columns used to lay out the combinatorial grid for a bullet list configuration.
    private static let gridColumns = 4

    /// Fixed size applied to each cell of the grid, so the resulting image has a stable, reproducible size.
    private static let gridCellSize = CGSize(width: 280, height: 180)

    /// This function tests all BulletList configuration for the given theme and color schemes on a standard surface.
    ///
    /// It iterates through all elements of configuration `BulletListType`, `BulletListTextStyle`, `levelCount`.
    /// For each of these combinations, a single grid image gathers the `isBold` variations (and, for `unordered`
    /// list, the `unorderedAsset` x `unorderedBulletIsBranded` variations as well).
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAllBulletLists(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for type in BulletListType.allCases {
            for textType in BulletListTextStyle.allCases {
                for levelCount in BulletListLevelCount.allCases {
                    testBulletListGrid(theme: theme,
                                       interfaceStyle: interfaceStyle,
                                       type: type,
                                       textStyle: textType,
                                       levelCount: levelCount)
                }
            }
        }
    }

    /// A single configuration of `isBold` x `unorderedAsset` x `unorderedBulletIsBranded` to fold into a grid cell.
    /// For non-`unordered` types, `unorderedAsset`/`unorderedBulletIsBranded` are irrelevant and ignored.
    private struct BulletListVariant {
        let isBold: Bool
        let unorderedAsset: BulletListUnorderedAsset
        let unorderedBulletIsBranded: Bool

        /// All the `isBold` combinations for a non-unordered bullet list (bare, ordered).
        static let allForSimpleType: [BulletListVariant] = [false, true].map {
            BulletListVariant(isBold: $0, unorderedAsset: .bullet, unorderedBulletIsBranded: true)
        }

        /// All the `isBold` x `unorderedAsset` x `unorderedBulletIsBranded` combinations for an unordered bullet list.
        static let allForUnorderedType: [BulletListVariant] = [false, true].flatMap { isBold in
            BulletListUnorderedAsset.allCases.flatMap { asset in
                [false, true].map { isBranded in
                    BulletListVariant(isBold: isBold, unorderedAsset: asset, unorderedBulletIsBranded: isBranded)
                }
            }
        }

        /// Short caption identifying the variant, displayed under its grid cell.
        func caption(type: BulletListType) -> String {
            var components = [isBold ? "Bold" : "Regular"]
            if type == .unordered {
                components.append(unorderedAsset.formattedName)
                components.append(unorderedBulletIsBranded ? "Branded" : "NotBranded")
            }
            return components.joined(separator: " · ")
        }
    }

    /// Builds the grid cell for a given bullet list variant.
    @MainActor private func bulletListVariantCell(
        _ variant: BulletListVariant,
        theme: OUDSTheme,
        type: BulletListType,
        textStyle: BulletListTextStyle,
        levelCount: BulletListLevelCount) -> SnapshotGridCell<AnyView>
    {
        let model = BulletListConfigurationModel()
        model.bulletType = type
        model.textStyle = textStyle
        model.levelCount = levelCount
        model.isBold = variant.isBold
        model.unorderedAsset = variant.unorderedAsset
        model.unorderedBulletIsBranded = variant.unorderedBulletIsBranded

        return SnapshotGridCell(caption: variant.caption(type: type)) {
            AnyView(BulletListDemo(configurationModel: model))
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `isBold` (and, for `unordered` type, `unorderedAsset` x
    /// `unorderedBulletIsBranded`) combinations for a given bullet list configuration, then captures it
    /// in a single snapshot.
    ///
    /// The snapshot is saved with a name based on the parameters which are not folded into the grid:
    ///    test_<themeName>_<colorScheme>.<type>_<textStyle>_<levelCount>
    ///
    /// - Parameters:
    ///   - theme: The theme (OUDSTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - type: the type of the bullet list (bare, ordered, unordered)
    ///   - textStyle: the text style of the bullet list
    ///   - levelCount: the number of nesting levels
    @MainActor private func testBulletListGrid(
        theme: OUDSTheme,
        interfaceStyle: UIUserInterfaceStyle,
        type: BulletListType,
        textStyle: BulletListTextStyle,
        levelCount: BulletListLevelCount)
    {
        let variants = type == .unordered ? BulletListVariant.allForUnorderedType : BulletListVariant.allForSimpleType
        let cells = variants.map {
            bulletListVariantCell($0, theme: theme, type: type, textStyle: textStyle, levelCount: levelCount)
        }

        // Create a unique snapshot name based on the current configuration :
        //    test_<themeName>_<colorScheme>.<type>_<textStyle>_<levelCount>
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let typePattern = type.formattedName
        let textStylePattern = textStyle.formattedName
        let countPattern = switch levelCount {
        case .one:
            "Count-1"
        case .two:
            "Count-2"
        case .three:
            "Count-3"
        }
        let name = "\(typePattern)_\(textStylePattern)_\(countPattern)"

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

    /// This function tests the `OUDSBulletList` skeleton state (default configuration) for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testBulletListSkeleton(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSBulletList {
                OUDSBulletList.Item("First point")
                OUDSBulletList.Item("Second point")
            }
            .oudsSkeleton(isVisible: true, isAnimated: false)
            .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testBulletList_skeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "BulletListSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
