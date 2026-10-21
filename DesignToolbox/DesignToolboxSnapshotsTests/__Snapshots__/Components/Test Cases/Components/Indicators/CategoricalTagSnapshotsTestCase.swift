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

/// Tests the UI rendering of the `OUDSCategoricalTag` for each parameter.
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image). The grid is laid out with one row
/// per category so a regression touching a single category stays identifiable at a glance.
///
/// Axes kept as separate files (= filename):
///   - `layout` (3 values)
///   - the state (`enabled`/`disabled`/`loading`)
///   - `category` (5 values) for the enabled state only. Each category paints the badge with a distinct
///     color so each one deserves a dedicated reference image for easy visual diffs; the disabled state
///     does not depend on `category` and the loading state folds all categories into a single grid.
///
/// Axes folded into the grid:
///   - Enabled: `size × shape` (and `iconType × flipIcon` for `textAndIcon`, where `enableFlipIcon` is
///     true for every category).
///   - Disabled: `size × shape` (and `iconType × flipIcon` for `textAndIcon`). The source code already
///     fixes `category = .category1` for the disabled state since the disabled rendering does not depend
///     on category colors.
///   - Loading: `category × size × shape`. The loading progress indicator is tinted by the category, so
///     the category axis is kept inside the grid rather than promoted to a filename.
///
/// **Warning: the loader state in indeterminate variant tag is not tested because of discrepancies with
/// snapshots comparisons.**
///
/// **Note on the determinate loading indicator**: `OUDSCategoricalTag(loadingLabel:progress:)` uses
/// `OUDSCircularProgressIndicator(animated: true)` internally, which animates the arc from 0 to the
/// target `progress` on first display. A snapshot is captured on the first frame, so the arc is empty
/// (and the track is disabled on this component), making the indicator invisible on the reference
/// image. To get the arc at its target value, snapshot cells for loading configurations disable
/// SwiftUI animations through a `.transaction { $0.animation = nil }` modifier — see ``cell(theme:model:caption:)``.
///
/// Each cell of a grid carries a short caption so a regression stays identifiable directly in the resulting
/// image. See `SnapshotGrid.swift`.
open class CategoricalTagSnapshotsTestsTestCase: XCTestCase {

    /// Fixed size applied to each cell of a categorical tag grid.
    private static let cellSize = CGSize(width: 220, height: 70)

    // MARK: - Categorical Tags

    /// Tests all categorical tags with all layouts, categories, sizes and shapes for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllCategoricalTags(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in CategoricalTagLayout.allCases {
            testCategoricalTagDisabledGrid(theme: theme, interfaceStyle: interfaceStyle, layout: layout)
            for category in OUDSCategoricalTag.Category.allCases {
                testCategoricalTagEnabledGrid(theme: theme,
                                              interfaceStyle: interfaceStyle,
                                              layout: layout,
                                              category: category)
            }
            testCategoricalTagLoadingGrid(theme: theme, interfaceStyle: interfaceStyle, layout: layout)
        }
    }

    // MARK: - Enabled

    /// Builds a ``SnapshotGrid`` gathering all enabled-state variations for a given layout and category.
    ///
    /// Grid is a single-category panel of `size × shape` (and optionally `iconType × flipIcon`) cells.
    /// `category` is promoted to the filename because each category paints the badge with a distinct
    /// color, making a dedicated reference image worthwhile for visual diffs.
    @MainActor private func testCategoricalTagEnabledGrid(theme: OUDSTheme,
                                                          interfaceStyle: UIUserInterfaceStyle,
                                                          layout: CategoricalTagLayout,
                                                          category: OUDSCategoricalTag.Category)
    {
        var cells: [SnapshotGridCell<AnyView>] = []
        for size in OUDSTag.Size.allCases {
            for shape in OUDSTag.Shape.allCases {
                for iconVariant in iconVariants(layout: layout) {
                    let model = CategoricalTagConfigurationModel()
                    model.isLoading = false
                    model.enabled = true
                    model.layout = layout
                    model.category = category
                    model.size = size
                    model.shape = shape
                    model.iconType = iconVariant.iconType
                    model.flipIcon = iconVariant.flipIcon
                    cells.append(cell(theme: theme,
                                      model: model,
                                      caption: sizeShapeCaption(size: size,
                                                                shape: shape,
                                                                iconVariant: iconVariant)))
                }
            }
        }
        // Cap at 4 columns to keep the grid from stretching horizontally when `textAndIcon` iterates on
        // all `iconType × flipIcon` variants (16 cells would otherwise lay out as 2 × 8).
        let columns = min(4, OUDSTag.Shape.allCases.count * iconVariants(layout: layout).count)
        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   layout: layout,
                   state: "\(category.shortName)-Enabled",
                   columns: columns,
                   cells: cells)
    }

    // MARK: - Disabled

    /// Builds a ``SnapshotGrid`` gathering all disabled-state variations for a given layout.
    ///
    /// The disabled rendering does not depend on `category` (fixed to `.category1` as in the original
    /// per-image tests), so only `size × shape` and the optional `iconType × flipIcon` axes vary.
    @MainActor private func testCategoricalTagDisabledGrid(theme: OUDSTheme,
                                                           interfaceStyle: UIUserInterfaceStyle,
                                                           layout: CategoricalTagLayout)
    {
        var cells: [SnapshotGridCell<AnyView>] = []
        for size in OUDSTag.Size.allCases {
            for shape in OUDSTag.Shape.allCases {
                for iconVariant in iconVariants(layout: layout) {
                    let model = CategoricalTagConfigurationModel()
                    model.isLoading = false
                    model.enabled = false
                    model.layout = layout
                    model.category = .category1
                    model.size = size
                    model.shape = shape
                    model.iconType = iconVariant.iconType
                    model.flipIcon = iconVariant.flipIcon
                    cells.append(cell(theme: theme,
                                      model: model,
                                      caption: sizeShapeCaption(size: size, shape: shape, iconVariant: iconVariant)))
                }
            }
        }
        // Cap at 4 columns to keep the grid from stretching horizontally when `textAndIcon` iterates on
        // all `iconType × flipIcon` variants (16 cells would otherwise lay out as 2 × 8).
        let columns = min(4, OUDSTag.Shape.allCases.count * iconVariants(layout: layout).count)
        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   layout: layout,
                   state: "Disabled",
                   columns: columns,
                   cells: cells)
    }

    // MARK: - Loading

    /// Builds a ``SnapshotGrid`` gathering all loading-state variations for a given layout.
    ///
    /// `OUDSCategoricalTag(loadingLabel:)` keeps the `category` parameter (the loader is tinted by the
    /// category colors), so the category axis is kept in the grid.
    @MainActor private func testCategoricalTagLoadingGrid(theme: OUDSTheme,
                                                          interfaceStyle: UIUserInterfaceStyle,
                                                          layout: CategoricalTagLayout)
    {
        var cells: [SnapshotGridCell<AnyView>] = []
        for category in OUDSCategoricalTag.Category.allCases {
            for size in OUDSTag.Size.allCases {
                for shape in OUDSTag.Shape.allCases {
                    let model = CategoricalTagConfigurationModel()
                    model.isLoading = true
                    model.enabled = true
                    model.flipIcon = false
                    model.layout = layout
                    model.category = category
                    model.size = size
                    model.shape = shape
                    model.progressVariant = .determinate
                    model.progressValue = 0.75
                    cells.append(cell(theme: theme,
                                      model: model,
                                      caption: loadingCaption(category: category,
                                                              size: size,
                                                              shape: shape)))
                }
            }
        }
        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   layout: layout,
                   state: "Loading",
                   columns: OUDSTag.Size.allCases.count * OUDSTag.Shape.allCases.count,
                   cells: cells)
    }

    // MARK: - Grid Helpers

    /// A single icon-related variant used to iterate over `iconType × flipIcon`.
    private struct IconVariant {
        let iconType: DefinedStatusIcons
        let flipIcon: Bool
    }

    /// The relevant `iconType × flipIcon` combinations for a given `layout`.
    ///
    /// Mirrors `CategoricalTagConfigurationModel.enableFlipIcon`: the icon axis only varies in
    /// `textAndIcon` layout. In every other case a single neutral variant is returned so grid rows remain
    /// rectangular.
    private func iconVariants(layout: CategoricalTagLayout) -> [IconVariant] {
        guard layout == .textAndIcon else {
            return [IconVariant(iconType: .tintedIcon, flipIcon: false)]
        }
        return DefinedStatusIcons.allCases.flatMap { iconType in
            [false, true].map { IconVariant(iconType: iconType, flipIcon: $0) }
        }
    }

    /// Caption for the loading state: keeps the category since it is folded in the grid.
    private func loadingCaption(category: OUDSCategoricalTag.Category,
                                size: OUDSTag.Size,
                                shape: OUDSTag.Shape) -> String
    {
        "\(category.shortName)\n\(size.shortName)·\(shape.shortName)"
    }

    /// Caption for enabled and disabled states: category is in the filename, only size/shape and
    /// optional icon variant are shown.
    private func sizeShapeCaption(size: OUDSTag.Size,
                                  shape: OUDSTag.Shape,
                                  iconVariant: IconVariant) -> String
    {
        let base = "\(size.shortName)·\(shape.shortName)"
        guard let icon = iconVariantSuffix(iconVariant) else {
            return base
        }
        return "\(base)\n\(icon)"
    }

    private func iconVariantSuffix(_ iconVariant: IconVariant) -> String? {
        if iconVariant.iconType == .tintedIcon, !iconVariant.flipIcon {
            return nil
        }
        let iconLabel = iconVariant.iconType == .image ? "Original" : "Template"
        let flipLabel = iconVariant.flipIcon ? "Flip" : "NoFlip"
        return "\(iconLabel)·\(flipLabel)"
    }

    /// Builds the grid cell for a given `CategoricalTagConfigurationModel`.
    ///
    /// For loading configurations, SwiftUI animations are disabled through a transaction so the
    /// `OUDSCircularProgressIndicator` reveal animation is skipped and the snapshot captures the arc
    /// at its target `progress` value instead of an empty arc at `t=0`.
    @MainActor private func cell(theme: OUDSTheme,
                                 model: CategoricalTagConfigurationModel,
                                 caption: String) -> SnapshotGridCell<AnyView>
    {
        let isLoading = model.isLoading
        return SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    CategoricalTagDemo(configurationModel: model)
                        .transaction { transaction in
                            if isLoading {
                                transaction.animation = nil
                            }
                        }
                })
        }
    }

    /// Composes the grid and captures a single snapshot assertion.
    ///
    /// The snapshot is saved with a name based on the parameters which are not folded into the grid:
    ///    testCategoricalTag_<themeName>_<colorScheme>.<layout>-<state>
    @MainActor private func assertGrid(theme: OUDSTheme,
                                       interfaceStyle: UIUserInterfaceStyle,
                                       layout: CategoricalTagLayout,
                                       state: String,
                                       columns: Int,
                                       cells: [SnapshotGridCell<AnyView>])
    {
        let testName = "testCategoricalTag_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "\(layout.debugDescription)-\(state)"

        let grid = SnapshotGrid(
            columns: columns,
            cellSize: Self.cellSize,
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

// MARK: - Short Name Helpers

extension CategoricalTagLayout: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .textOnly:
            "textOnly"
        case .textAndBullet:
            "textAndBullet"
        case .textAndIcon:
            "textAndIcon"
        }
    }
}

extension OUDSCategoricalTag.Category {
    var shortName: String {
        switch self {
        case .category1:
            "Cat1"
        case .category2:
            "Cat2"
        case .category3:
            "Cat3"
        case .category4:
            "Cat4"
        case .category5:
            "Cat5"
        }
    }
}

// swiftlint:enable required_deinit
