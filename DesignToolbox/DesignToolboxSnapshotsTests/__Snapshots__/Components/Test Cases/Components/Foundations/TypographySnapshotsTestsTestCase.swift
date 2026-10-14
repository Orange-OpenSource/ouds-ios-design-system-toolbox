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

/// Tests the UI rendering of the `OUDSDisplay`, `OUDSHeading`, `OUDSBody`, `OUDSLabel` and `OUDSCode`
/// typography components for each parameter.
///
/// To limit the amount of reference images, each typography family is folded into a single
/// ``SnapshotGrid`` (one assertion = one reference image per theme-scheme):
///   - `Display.png`: 1 column × N rows, one per `OUDSDisplay.Size`.
///   - `Heading.png`: 1 column × N rows, one per `OUDSHeading.Size` + the "with marker" variant for `.large`
///     + the "colored substring" variant.
///   - `Body.png`: 3 columns `OUDSBody.Weight` × N rows `OUDSBody.Size`.
///   - `Label.png`: 3 columns `OUDSLabel.Weight` × N rows `OUDSLabel.Size`.
///   - `Code.png`: single-cell grid.
///
/// Total: 5 files per theme-scheme instead of ~31.
open class TypographySnapshotsTestsTestCase: XCTestCase {

    @MainActor func testAllTypography(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        testAllDisplays(theme: theme, interfaceStyle: interfaceStyle)
        testAllHeadings(theme: theme, interfaceStyle: interfaceStyle)
        testAllBodies(theme: theme, interfaceStyle: interfaceStyle)
        testAllLabels(theme: theme, interfaceStyle: interfaceStyle)
        testCode(theme: theme, interfaceStyle: interfaceStyle)
    }

    // MARK: - Display

    @MainActor func testAllDisplays(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let sizes = OUDSDisplay.Size.allCases

        var cells: [SnapshotGridCell<AnyView>] = []
        for size in sizes {
            cells.append(SnapshotGridCell(caption: "size\(size.technicalDescription)") {
                AnyView(
                    OUDSThemeableView(theme: theme) {
                        OUDSDisplay(text: "Display", size: size)
                    })
            })
        }

        emit(theme: theme,
             interfaceStyle: interfaceStyle,
             snapshotName: "Display",
             columns: 1,
             cellSize: CGSize(width: 420, height: 140),
             cells: cells)
    }

    // MARK: - Heading

    @MainActor func testAllHeadings(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let sizes = OUDSHeading.Size.allCases

        var cells: [SnapshotGridCell<AnyView>] = []
        for size in sizes {
            cells.append(SnapshotGridCell(caption: "size\(size.technicalDescription)") {
                AnyView(
                    OUDSThemeableView(theme: theme) {
                        OUDSHeading(text: "Heading", size: size, hasMarker: false)
                    })
            })
        }
        // The marker is only honored for `size == .large` and when the theme supports it.
        cells.append(SnapshotGridCell(caption: "size.large\nmarker") {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    OUDSHeading(text: "Heading", size: .large, hasMarker: true)
                })
        })
        // The colored substring is only meaningful for `size == .large`.
        cells.append(SnapshotGridCell(caption: "coloredSubstring") {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    OUDSHeading(text: "Welcome to Sosh", coloredText: "Sosh")
                })
        })

        emit(theme: theme,
             interfaceStyle: interfaceStyle,
             snapshotName: "Heading",
             columns: 1,
             cellSize: CGSize(width: 420, height: 110),
             cells: cells)
    }

    // MARK: - Body

    @MainActor func testAllBodies(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let sizes = OUDSBody.Size.allCases
        let weights = OUDSBody.Weight.allCases

        var cells: [SnapshotGridCell<AnyView>] = []
        for size in sizes {
            for weight in weights {
                cells.append(SnapshotGridCell(caption: "\(size.technicalDescription)\n\(weight.technicalDescription)") {
                    AnyView(
                        OUDSThemeableView(theme: theme) {
                            OUDSBody(text: "Body", size: size, weight: weight)
                        })
                })
            }
        }

        emit(theme: theme,
             interfaceStyle: interfaceStyle,
             snapshotName: "Body",
             columns: weights.count,
             cellSize: CGSize(width: 260, height: 80),
             cells: cells)
    }

    // MARK: - Label

    @MainActor func testAllLabels(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let sizes = OUDSLabel.Size.allCases
        let weights = OUDSLabel.Weight.allCases

        var cells: [SnapshotGridCell<AnyView>] = []
        for size in sizes {
            for weight in weights {
                cells.append(SnapshotGridCell(caption: "\(size.technicalDescription)\n\(weight.technicalDescription)") {
                    AnyView(
                        OUDSThemeableView(theme: theme) {
                            OUDSLabel(text: "Label", size: size, weight: weight)
                        })
                })
            }
        }

        emit(theme: theme,
             interfaceStyle: interfaceStyle,
             snapshotName: "Label",
             columns: weights.count,
             cellSize: CGSize(width: 260, height: 60),
             cells: cells)
    }

    // MARK: - Code

    @MainActor func testCode(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let cells: [SnapshotGridCell<AnyView>] = [
            SnapshotGridCell(caption: "code") {
                AnyView(
                    OUDSThemeableView(theme: theme) {
                        OUDSCode(text: "let x = 42")
                    })
            },
        ]

        emit(theme: theme,
             interfaceStyle: interfaceStyle,
             snapshotName: "Code",
             columns: 1,
             cellSize: CGSize(width: 320, height: 60),
             cells: cells)
    }

    // MARK: - Emit helper

    @MainActor private func emit(theme: OUDSTheme,
                                 interfaceStyle: UIUserInterfaceStyle,
                                 snapshotName: String,
                                 columns: Int,
                                 cellSize: CGSize,
                                 cells: [SnapshotGridCell<AnyView>])
    {
        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"

        let grid = SnapshotGrid(
            columns: columns,
            cellSize: cellSize,
            cells: cells,
            title: "\(testName).\(snapshotName)",
            cellSpacing: 24,
            rowSpacing: 24)

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

// swiftlint:enable required_deinit
