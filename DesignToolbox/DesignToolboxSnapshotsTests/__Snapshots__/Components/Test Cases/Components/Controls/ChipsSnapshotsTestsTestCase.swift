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

/// Tests the UI rendering of the `OUDSFilterChip` and `OUDSSuggestionChip` for each parameter.
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image). Each grid is laid out with one row
/// per `enabled` value so a regression touching an enabled/disabled state stays identifiable at a glance.
///
/// Axes kept as separate files (= filename):
///   - Suggestion: `layout × enabled` (3 × 2 = 6 files per theme/scheme).
///   - Filter: `layout × selected` (3 × 2 = 6 files per theme/scheme).
///
/// Axes folded into each grid:
///   - Suggestion: `iconType × isLongText` (= up to 4 cells; `textOnly` collapses `iconType` → 2 cells).
///   - Filter: `enabled × iconType × isLongText` (= up to 8 cells; `textOnly` collapses `iconType` → 4 cells).
///
/// **/!\ It does not test the hover and pressed states.**
///
/// Each cell of a grid carries a short caption so a regression stays identifiable directly in the resulting
/// image. See `SnapshotGrid.swift`.
open class ChipsSnapshotsTestsTestCase: XCTestCase {

    /// Fixed size applied to each cell of a chip grid. Width accommodates the long-text variant without
    /// truncation; height accommodates two caption lines plus wrapped chip label.
    private static let cellSize = CGSize(width: 240, height: 90)

    /// Long text used to exercise the chip label truncation / wrapping.
    private static let longText = "¡ Bravas patatas ! ¡ Patatas bravas ! ¡ Patatata-patatata-patatas bravas !"

    // MARK: - Entry Point

    /// Tests all chips (Filter and Suggestion) with all layouts, for the given theme and color scheme.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllChips(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Suggestion: layout × enabled promoted; iconType × isLongText folded into the grid.
        for layout in ChipLayout.allCases {
            for enabled in [true, false] {
                testSuggestionGrid(theme: theme,
                                   interfaceStyle: interfaceStyle,
                                   layout: layout,
                                   enabled: enabled)
            }
        }

        // Filter: layout × selected promoted; enabled × iconType × isLongText folded into the grid.
        for layout in ChipLayout.allCases {
            for selected in [true, false] {
                testFilterGrid(theme: theme,
                               interfaceStyle: interfaceStyle,
                               layout: layout,
                               selected: selected)
            }
        }
    }

    // MARK: - Suggestion Grid

    @MainActor private func testSuggestionGrid(theme: OUDSTheme,
                                               interfaceStyle: UIUserInterfaceStyle,
                                               layout: ChipLayout,
                                               enabled: Bool)
    {
        let imageModes: [DefinedStatusIcons] = layout == .textOnly ? [.tintedIcon] : [.tintedIcon, .image]

        var cells: [SnapshotGridCell<AnyView>] = []
        for iconType in imageModes {
            for isLongText in [false, true] {
                let model = SuggestionChipConfigurationModel()
                model.layout = layout
                model.enabled = enabled
                model.iconType = iconType
                if isLongText { model.text = Self.longText }
                cells.append(suggestionCell(theme: theme,
                                            model: model,
                                            caption: suggestionCaption(layout: layout,
                                                                       iconType: iconType,
                                                                       isLongText: isLongText)))
            }
        }

        // columns = isLongText.count = 2 → one row per iconType.
        let columns = 2
        let enabledPattern = enabled ? "Enabled" : "Disabled"
        let name = "\(layout.debugDescription)_\(enabledPattern)"

        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   testName: "testSuggestion_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")",
                   snapshotName: name,
                   columns: columns,
                   cells: cells)
    }

    // MARK: - Filter Grid

    @MainActor private func testFilterGrid(theme: OUDSTheme,
                                           interfaceStyle: UIUserInterfaceStyle,
                                           layout: ChipLayout,
                                           selected: Bool)
    {
        let imageModes: [DefinedStatusIcons] = layout == .textOnly ? [.tintedIcon] : [.tintedIcon, .image]

        var cells: [SnapshotGridCell<AnyView>] = []
        for enabled in [true, false] {
            for iconType in imageModes {
                for isLongText in [false, true] {
                    let model = FilterChipConfigurationModel()
                    model.layout = layout
                    model.selected = selected
                    model.enabled = enabled
                    model.iconType = iconType
                    if isLongText { model.text = Self.longText }
                    cells.append(filterCell(theme: theme,
                                            model: model,
                                            caption: filterCaption(layout: layout,
                                                                   enabled: enabled,
                                                                   iconType: iconType,
                                                                   isLongText: isLongText)))
                }
            }
        }

        // columns = cells per enabled row (= imageModes.count × 2 isLongText values) so one row per `enabled`.
        let columns = imageModes.count * 2
        let selectedPattern = selected ? "Selected" : "Unselected"
        let name = "\(layout.debugDescription)_\(selectedPattern)"

        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   testName: "testFilter_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")",
                   snapshotName: name,
                   columns: columns,
                   cells: cells)
    }

    // MARK: - Cell Builders

    @MainActor private func suggestionCell(theme: OUDSTheme,
                                           model: SuggestionChipConfigurationModel,
                                           caption: String) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    SuggestionChipDemo(configurationModel: model)
                })
        }
    }

    @MainActor private func filterCell(theme: OUDSTheme,
                                       model: FilterChipConfigurationModel,
                                       caption: String) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    FilterChipDemo(configurationModel: model)
                })
        }
    }

    // MARK: - Captions

    private func suggestionCaption(layout: ChipLayout, iconType: DefinedStatusIcons, isLongText: Bool) -> String {
        let text = isLongText ? "long" : "short"
        if layout == .textOnly {
            return text
        }
        return "\(iconShort(iconType))\n\(text)"
    }

    private func filterCaption(layout: ChipLayout, enabled: Bool, iconType: DefinedStatusIcons, isLongText: Bool) -> String {
        let state = enabled ? "enabled" : "disabled"
        let text = isLongText ? "long" : "short"
        if layout == .textOnly {
            return "\(state)\n\(text)"
        }
        return "\(state) · \(iconShort(iconType))\n\(text)"
    }

    private func iconShort(_ iconType: DefinedStatusIcons) -> String {
        switch iconType {
        case .image:
            "image"
        default:
            "tinted"
        }
    }

    // MARK: - Grid Assertion

    /// Composes the grid and captures a single snapshot assertion.
    @MainActor private func assertGrid(theme: OUDSTheme,
                                       interfaceStyle: UIUserInterfaceStyle,
                                       testName: String,
                                       snapshotName: String,
                                       columns: Int,
                                       cells: [SnapshotGridCell<AnyView>])
    {
        let grid = SnapshotGrid(
            columns: columns,
            cellSize: Self.cellSize,
            cells: cells,
            title: "\(testName).\(snapshotName)")

        let illustration = OUDSThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: snapshotName,
                           testName: testName)
    }

    /// This function tests the`OUDSSuggestionChip` skeleton state (default configuration)
    /// for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testSuggestionChipSkeleton(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSSuggestionChip(text: "Suggestion chip") {}
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testChips_skeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "ChipsSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    /// This function tests the`OUDSFilterChip` skeleton state (default configuration)
    /// for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testFilterChipSkeleton(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSFilterChip(text: "Filter chip") {}
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testChips_skeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "ChipsSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

extension ChipLayout: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .textOnly:
            "TextOnly"
        case .textAndIcon:
            "TextAndIcon"
        case .iconOnly:
            "IconOnly"
        }
    }
}

// swiftlint:enable required_deinit
