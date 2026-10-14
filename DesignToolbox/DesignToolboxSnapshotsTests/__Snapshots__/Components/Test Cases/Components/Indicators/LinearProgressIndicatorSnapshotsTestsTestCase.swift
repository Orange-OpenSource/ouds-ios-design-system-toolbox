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

import OUDSComponents
import OUDSSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit
// swiftlint:disable type_name

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSLinearProgressIndicator` for each parameter.
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image). The grid is laid out with one row
/// per `gapSize` so a regression touching a single gap size stays identifiable at a glance.
///
/// Axes kept as separate files (= filename):
///   - `status` (6 values) and `track` (`true` / `false`): each pair produces a distinctly different color
///     palette and visual rendering, making a per-combination reference image worthwhile for visual diffs
///     → 12 files per theme/scheme for the main grid.
///   - A dedicated `Extras` file gathers the `stopIndicator × helperText` and
///     `helperType × alignment × helperText` configurations (all fixed on
///     `neutral / default / track / progress 0.5`) that are decoupled from the main matrix.
///
/// Axes folded into the grid:
///   - Main grid: `gapSize × progress` (= 2 × 5 = 10 cells).
///   - Extras grid: 15 fixed configurations covering the Linear-specific `stopIndicator`,
///     `determinateHelperTextType`, `helperTextAlignment` and `helperText` axes.
///
/// **Warning: only the determinate variant is tested. The indeterminate variant is not tested yet
/// as we face troubles with animations and snapshots.**
///
/// **Note on the reveal animation**: `OUDSLinearProgressIndicator(animated: true)` animates the bar
/// from 0 to the target `progress` on first display. To make snapshots deterministic the configuration
/// model forces `animated = false` on every tested cell, so the bar is captured at its target value.
///
/// Each cell of a grid carries a short caption so a regression stays identifiable directly in the resulting
/// image. See `SnapshotGrid.swift`.
open class LinearProgressIndicatorSnapshotsTestsTestCase: XCTestCase {

    /// Fixed progress values covering the full [0, 1] range.
    private static let testedProgressValues: [Double] = [0.0, 0.25, 0.5, 0.75, 1.0]

    /// Fixed size applied to each cell of a progress indicator grid. Width accommodates the horizontal
    /// bar and an optional helper text; height accommodates two caption lines.
    private static let cellSize = CGSize(width: 240, height: 110)

    // MARK: - Entry Points

    /// Tests all determinate linear progress indicators with all statuses, gap sizes, track on/off and
    /// the five predefined progress values for the given theme and color scheme.
    ///
    /// Also produces a dedicated `Extras` grid covering the Linear-specific `stopIndicator`,
    /// `determinateHelperTextType`, `helperTextAlignment` and `helperText` axes on a fixed base.
    ///
    /// **The indeterminate variant is not tested yet as we face troubles with animations and snapshots.**
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllLinearProgressIndicators(theme: OUDSTheme,
                                                    interfaceStyle: UIUserInterfaceStyle)
    {
        for status in OUDSProgressIndicatorStatus.allCases {
            for track in [true, false] {
                testLinearMainGrid(theme: theme,
                                   interfaceStyle: interfaceStyle,
                                   status: status,
                                   track: track)
            }
        }
        testLinearExtrasGrid(theme: theme, interfaceStyle: interfaceStyle)
    }

    // MARK: - Main Grid

    /// Builds a ``SnapshotGrid`` for a given `status × track` pair, folding `gapSize × progress`.
    @MainActor private func testLinearMainGrid(theme: OUDSTheme,
                                               interfaceStyle: UIUserInterfaceStyle,
                                               status: OUDSProgressIndicatorStatus,
                                               track: Bool)
    {
        var cells: [SnapshotGridCell<AnyView>] = []
        for gapSize in OUDSProgressIndicatorGapSize.allCases {
            for progress in Self.testedProgressValues {
                let model = LinearProgressIndicatorConfigurationModel()
                model.variant = .determinate
                model.status = status
                model.gapSize = gapSize
                model.track = track
                model.progress = progress
                model.animated = false
                model.stopIndicator = false
                model.helperText = ""
                model.determinateHelperTextType = .none
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

    // MARK: - Extras Grid

    /// Groups the Linear-specific configurations (fixed on `neutral / default / track / progress 0.5`)
    /// into a single reference image. Covers:
    ///  - `stopIndicator × helperText` (3 cells, with `(false, "")` skipped as it is already covered by
    ///    the main grid under `neutral-track`).
    ///  - `determinateHelperTextType × helperTextAlignment × helperText` (12 cells).
    @MainActor private func testLinearExtrasGrid(theme: OUDSTheme,
                                                 interfaceStyle: UIUserInterfaceStyle)
    {
        var cells: [SnapshotGridCell<AnyView>] = []

        // Block 1: stopIndicator × helperText (3 cells, same skip rule as the original tests).
        for stopIndicator in [true, false] {
            for helperText in ["", "Uploading…"] {
                if !stopIndicator, helperText.isEmpty { continue }
                let model = extrasBaseModel()
                model.stopIndicator = stopIndicator
                model.helperText = helperText
                model.determinateHelperTextType = .percent
                model.helperTextAlignment = .center
                cells.append(cell(theme: theme,
                                  model: model,
                                  caption: "stop=\(stopIndicator)\n\(helperText.isEmpty ? "no text" : "with text")"))
            }
        }

        // Block 2: helperType × alignment × helperText (12 cells, skips .none which is covered elsewhere).
        for type in DeterminateProgressIndicatorHelperType.allCases where type != .none {
            for alignment in OUDSLinearProgressIndicator.HelperTextAlignment.allCases {
                for helperText in ["", "Uploading…"] {
                    let model = extrasBaseModel()
                    model.stopIndicator = false
                    model.determinateHelperTextType = type
                    model.helperTextAlignment = alignment
                    model.helperText = helperText
                    let typeLabel = stripLeadingDot(type.technicalDescription)
                    let alignLabel = stripLeadingDot(alignment.technicalDescription)
                    let textLabel = helperText.isEmpty ? "no text" : "with text"
                    let caption = "\(typeLabel)·\(alignLabel)\n\(textLabel)"
                    cells.append(cell(theme: theme, model: model, caption: caption))
                }
            }
        }

        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   name: "Extras",
                   columns: 3,
                   cells: cells)
    }

    private func extrasBaseModel() -> LinearProgressIndicatorConfigurationModel {
        let model = LinearProgressIndicatorConfigurationModel()
        model.variant = .determinate
        model.status = .neutral
        model.gapSize = .default
        model.track = true
        model.progress = 0.5
        model.animated = false
        return model
    }

    // MARK: - Grid Helpers

    private func mainCaption(gapSize: OUDSProgressIndicatorGapSize, progress: Double) -> String {
        "\(stripLeadingDot(gapSize.technicalDescription))\nprogress \(Int((progress * 100).rounded()))%"
    }

    /// Strips a leading `.` from a technical description (e.g. `.center` → `center`) to keep captions compact.
    private func stripLeadingDot(_ value: String) -> String {
        value.hasPrefix(".") ? String(value.dropFirst()) : value
    }

    @MainActor private func cell(theme: OUDSTheme,
                                 model: LinearProgressIndicatorConfigurationModel,
                                 caption: String) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    LinearProgressIndicatorDemo(configurationModel: model)
                })
        }
    }

    /// Composes the grid and captures a single snapshot assertion.
    ///
    /// Snapshot name follows the historical scheme:
    ///   testLinearProgressIndicator_<themeName>_<colorScheme>.DeterminateLinearProgressIndicator-<name>
    @MainActor private func assertGrid(theme: OUDSTheme,
                                       interfaceStyle: UIUserInterfaceStyle,
                                       name: String,
                                       columns: Int,
                                       cells: [SnapshotGridCell<AnyView>])
    {
        let testName = "testLinearProgressIndicator_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let snapshotName = "DeterminateLinearProgressIndicator-\(name)"

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
