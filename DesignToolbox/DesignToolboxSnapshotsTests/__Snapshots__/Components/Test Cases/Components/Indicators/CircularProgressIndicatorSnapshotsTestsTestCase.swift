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
// swiftlint:disable type_name

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSCircularProgressIndicator` for each parameter.
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image). The grid is laid out with one row
/// per `gapSize` so a regression touching a single gap size stays identifiable at a glance.
///
/// Axes kept as separate files (= filename):
///   - `status` (6 values) and `track` (`true` / `false`): each pair produces a distinctly different color
///     palette and visual rendering, making a per-combination reference image worthwhile for visual diffs
///     → 12 files per theme/scheme for the main grid.
///   - A dedicated `HelperText` file gathers the three helper-text configurations (fixed on
///     `neutral / default / track / progress 0.75`) that are decoupled from the main matrix.
///
/// Axes folded into the grid:
///   - Main grid: `gapSize × progress` (= 2 × 5 = 10 cells).
///   - Helper text grid: three fixed configurations in a single row.
///
/// **Warning: only the determinate variant is tested. The indeterminate variant is not tested yet
/// as we face troubles with animations and snapshots.**
///
/// **Note on the reveal animation**: `OUDSCircularProgressIndicator(animated: true)` animates the arc
/// from 0 to the target `progress` on first display. To make snapshots deterministic the configuration
/// model forces `animated = false` on every tested cell, so the arc is captured at its target value.
///
/// Each cell of a grid carries a short caption so a regression stays identifiable directly in the resulting
/// image. See `SnapshotGrid.swift`.
open class CircularProgressIndicatorSnapshotsTestsTestCase: XCTestCase {

    /// Fixed progress values covering the full [0, 1] range.
    private static let testedProgressValues: [Double] = [0.0, 0.25, 0.5, 0.75, 1.0]

    /// Fixed size applied to each cell of a progress indicator grid. Width accommodates the indicator and
    /// an optional helper text; height accommodates two caption lines.
    private static let cellSize = CGSize(width: 200, height: 110)

    // MARK: - Entry Points

    /// Tests all determinate circular progress indicators with all statuses, gap sizes, track on/off and
    /// the five predefined progress values for the given theme and color scheme.
    ///
    /// **The indeterminate variant is not tested yet as we face troubles with animations and snapshots.**
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllCircularProgressIndicators(theme: OUDSTheme,
                                                      interfaceStyle: UIUserInterfaceStyle)
    {
        for status in OUDSProgressIndicatorStatus.allCases {
            for track in [true, false] {
                testCircularMainGrid(theme: theme,
                                     interfaceStyle: interfaceStyle,
                                     status: status,
                                     track: track)
            }
        }
        testCircularHelperTextGrid(theme: theme, interfaceStyle: interfaceStyle)
    }

    // MARK: - Main Grid

    /// Builds a ``SnapshotGrid`` for a given `status × track` pair, folding `gapSize × progress`.
    ///
    /// Grid is laid out with `columns = progress.count` so each row corresponds to a `gapSize`.
    @MainActor private func testCircularMainGrid(theme: OUDSTheme,
                                                 interfaceStyle: UIUserInterfaceStyle,
                                                 status: OUDSProgressIndicatorStatus,
                                                 track: Bool)
    {
        var cells: [SnapshotGridCell<AnyView>] = []
        for gapSize in OUDSProgressIndicatorGapSize.allCases {
            for progress in Self.testedProgressValues {
                let model = CircularProgressIndicatorConfigurationModel()
                model.variant = .determinate
                model.status = status
                model.gapSize = gapSize
                model.track = track
                model.progress = progress
                model.animated = false
                model.helperTextType = .none
                cells.append(cell(theme: theme,
                                  model: model,
                                  caption: mainCaption(gapSize: gapSize, progress: progress)))
            }
        }
        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   name: "\(status.technicalDescription)\(track ? "-track" : "-noTrack")",
                   columns: Self.testedProgressValues.count,
                   cells: cells)
    }

    // MARK: - Helper Text Grid

    /// Groups the three helper-text configurations (fixed on `neutral / default / track / progress 0.75`)
    /// in a single reference image.
    @MainActor private func testCircularHelperTextGrid(theme: OUDSTheme,
                                                       interfaceStyle: UIUserInterfaceStyle)
    {
        var cells: [SnapshotGridCell<AnyView>] = []

        // Description + "Uploading..."
        let descriptionModel = baseHelperModel()
        descriptionModel.helperTextType = .description
        descriptionModel.helperText = "Uploading..."
        cells.append(cell(theme: theme, model: descriptionModel, caption: "description\nUploading..."))

        // Percent + "Uploading..."
        let percentWithTextModel = baseHelperModel()
        percentWithTextModel.helperTextType = .percent
        percentWithTextModel.helperText = "Uploading..."
        cells.append(cell(theme: theme, model: percentWithTextModel, caption: "percent\nUploading..."))

        // Percent + empty
        let percentOnlyModel = baseHelperModel()
        percentOnlyModel.helperTextType = .percent
        percentOnlyModel.helperText = ""
        cells.append(cell(theme: theme, model: percentOnlyModel, caption: "percent\n(no helper text)"))

        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   name: "HelperText",
                   columns: cells.count,
                   cells: cells)
    }

    private func baseHelperModel() -> CircularProgressIndicatorConfigurationModel {
        let model = CircularProgressIndicatorConfigurationModel()
        model.variant = .determinate
        model.status = .neutral
        model.gapSize = .default
        model.track = true
        model.progress = 0.75
        model.animated = false
        return model
    }

    // MARK: - Grid Helpers

    private func mainCaption(gapSize: OUDSProgressIndicatorGapSize, progress: Double) -> String {
        "\(stripLeadingDot(gapSize.technicalDescription))\nprogress \(Int((progress * 100).rounded()))%"
    }

    /// Strips a leading `.` from a technical description (e.g. `.default` → `default`) to keep captions compact.
    private func stripLeadingDot(_ value: String) -> String {
        value.hasPrefix(".") ? String(value.dropFirst()) : value
    }

    @MainActor private func cell(theme: OUDSTheme,
                                 model: CircularProgressIndicatorConfigurationModel,
                                 caption: String) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    CircularProgressIndicatorDemo(configurationModel: model)
                })
        }
    }

    /// Composes the grid and captures a single snapshot assertion.
    ///
    /// Snapshot name follows the historical scheme:
    ///   testCircularProgressIndicator_<themeName>_<colorScheme>.DeterminateCircularProgressIndicator-<name>
    @MainActor private func assertGrid(theme: OUDSTheme,
                                       interfaceStyle: UIUserInterfaceStyle,
                                       name: String,
                                       columns: Int,
                                       cells: [SnapshotGridCell<AnyView>])
    {
        let testName = "testCircularProgressIndicator_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let snapshotName = "DeterminateCircularProgressIndicator-\(name)"

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
}

// swiftlint:enable type_name
// swiftlint:enable required_deinit
