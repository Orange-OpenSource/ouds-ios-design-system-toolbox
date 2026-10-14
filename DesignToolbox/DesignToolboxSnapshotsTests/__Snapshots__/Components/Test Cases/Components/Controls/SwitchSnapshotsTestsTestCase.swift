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

/// Tests the UI rendering of the `OUDSSwitch` and `OUDSSwitchItem` for each parameter.
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image).
///
/// Axes kept as separate files (= filename):
///   - `layoutScope` ∈ {IndicatorOnly, Item} (IndicatorOnly covers `OUDSSwitch`; Item covers `OUDSSwitchItem`
///     with both Default and Inverse families folded into the same grid).
///   - `mode` ∈ {Normal, Error, ErrorWithText, ReadOnly} for Item; {Normal, ReadOnly} for IndicatorOnly
///     (because `OUDSSwitch` has no `isError` parameter).
///   - `contentVariant` for Item (6 variants covering label / description / image / flipped image combinations).
///
/// Axes folded into each grid:
///   - Item grids: `family (Default|Inverse) × hasDivider × indicatorState × isDisabled`.
///   - IndicatorOnly grids: `indicatorState × isDisabled`.
///
/// Grid layout for Item files:
///   - 4 columns: `family × hasDivider` ∈ {Default/NoDivider, Default/Divider, Inverse/NoDivider, Inverse/Divider}.
///   - Rows: one per `indicatorState × isDisabled` (4 rows in Normal mode, 2 rows in Error/ErrorWithText/ReadOnly
///     where only `isDisabled = false` is exercised historically).
///
/// **/!\ It does not test the hover and pressed states.**
open class SwitchSnapshotsTestsTestCase: XCTestCase {

    /// Fixed size applied to each cell of a switch grid. Width accommodates label + description + image
    /// + divider; height accommodates label + description + optional error text + 2 caption lines.
    private static let cellSize = CGSize(width: 340, height: 90)

    // MARK: - Entry Point

    /// Tests all switch configurations for the given theme and color scheme on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllSwitches(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // IndicatorOnly: modes {Normal, ReadOnly} (OUDSSwitch has no isError parameter).
        for mode in SwitchMode.indicatorOnlyModes {
            testIndicatorOnlyGrid(theme: theme,
                                  interfaceStyle: interfaceStyle,
                                  mode: mode)
        }

        // Item (Default + Inverse combined): modes × 6 contentVariants.
        for mode in SwitchMode.itemModes {
            for contentVariant in SwitchContentVariant.allCases {
                testItemGrid(theme: theme,
                             interfaceStyle: interfaceStyle,
                             mode: mode,
                             contentVariant: contentVariant)
            }
        }
    }

    // MARK: - IndicatorOnly Grid

    @MainActor private func testIndicatorOnlyGrid(theme: OUDSTheme,
                                                  interfaceStyle: UIUserInterfaceStyle,
                                                  mode: SwitchMode)
    {
        let disabledValues = mode.testsDisabled ? [false, true] : [false]
        var cells: [SnapshotGridCell<AnyView>] = []
        for indicatorState in [true, false] {
            for isDisabled in disabledValues {
                let layout = SwitchTest.Layout.indicatorOnly(isReadOnly: mode.isReadOnly)
                cells.append(cell(theme: theme,
                                  layout: layout,
                                  indicatorState: indicatorState,
                                  isDisabled: isDisabled,
                                  caption: stateCaption(indicatorState: indicatorState, isDisabled: isDisabled)))
            }
        }

        let columns = disabledValues.count
        let name = "IndicatorOnly_\(mode.filenameToken)"
        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   snapshotName: name,
                   columns: columns,
                   cells: cells)
    }

    // MARK: - Item Grid (Default + Inverse combined)

    @MainActor private func testItemGrid(theme: OUDSTheme,
                                         interfaceStyle: UIUserInterfaceStyle,
                                         mode: SwitchMode,
                                         contentVariant: SwitchContentVariant)
    {
        let disabledValues = mode.testsDisabled ? [false, true] : [false]

        // One column per (family × hasDivider), one row per (indicatorState × isDisabled).
        let columnAxes: [(family: SwitchLayoutFamily, hasDivider: Bool)] = [
            (.default, false), (.default, true), (.inverse, false), (.inverse, true),
        ]

        var cells: [SnapshotGridCell<AnyView>] = []
        for indicatorState in [true, false] {
            for isDisabled in disabledValues {
                for axis in columnAxes {
                    let variant = SwitchItemVariant(family: axis.family,
                                                    mode: mode,
                                                    contentVariant: contentVariant,
                                                    hasDivider: axis.hasDivider)
                    let layout = makeItemLayout(variant: variant)
                    cells.append(cell(theme: theme,
                                      layout: layout,
                                      indicatorState: indicatorState,
                                      isDisabled: isDisabled,
                                      caption: itemCaption(family: axis.family,
                                                           hasDivider: axis.hasDivider,
                                                           indicatorState: indicatorState,
                                                           isDisabled: isDisabled)))
                }
            }
        }

        let name = "\(contentVariant.filenameToken)_\(mode.filenameToken)"
        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   snapshotName: name,
                   columns: columnAxes.count,
                   cells: cells)
    }

    // MARK: - Layout Builders

    @MainActor private func makeItemLayout(variant: SwitchItemVariant) -> SwitchTest.Layout {
        let label = variant.contentVariant.labelText
        let description = variant.contentVariant.descriptionText
        let image = variant.contentVariant.image
        let isError = variant.mode.isError
        let errorText = variant.mode.errorText
        let isReadOnly = variant.mode.isReadOnly
        let hasDivider = variant.hasDivider

        switch variant.family {
        case .default:
            return .default(label: label,
                            description: description,
                            image: image,
                            isError: isError,
                            errorText: errorText,
                            hasDivider: hasDivider,
                            isReadOnly: isReadOnly)
        case .inverse:
            return .inverse(label: label,
                            description: description,
                            image: image,
                            isError: isError,
                            errorText: errorText,
                            hasDivider: hasDivider,
                            isReadOnly: isReadOnly)
        }
    }

    // MARK: - Cell Builder

    @MainActor private func cell(theme: OUDSTheme,
                                 layout: SwitchTest.Layout,
                                 indicatorState: Bool,
                                 isDisabled: Bool,
                                 caption: String) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    SwitchTest(layout: layout,
                               indicatorState: indicatorState,
                               isDisabled: isDisabled)
                })
        }
    }

    // MARK: - Captions

    private func stateCaption(indicatorState: Bool, isDisabled: Bool) -> String {
        "\(indicatorState ? "on" : "off")\n\(isDisabled ? "disabled" : "enabled")"
    }

    private func itemCaption(family: SwitchLayoutFamily,
                             hasDivider: Bool,
                             indicatorState: Bool,
                             isDisabled: Bool) -> String
    {
        let familyShort = family == .default ? "Def" : "Inv"
        let dividerShort = hasDivider ? "+div" : "-div"
        return "\(familyShort) \(dividerShort)\n\(indicatorState ? "on" : "off") · \(isDisabled ? "dis" : "ena")"
    }

    // MARK: - Grid Assertion

    /// Composes the grid and captures a single snapshot assertion.
    @MainActor private func assertGrid(theme: OUDSTheme,
                                       interfaceStyle: UIUserInterfaceStyle,
                                       snapshotName: String,
                                       columns: Int,
                                       cells: [SnapshotGridCell<AnyView>])
    {
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"

        let grid = SnapshotGrid(
            columns: columns,
            cellSize: Self.cellSize,
            cells: cells,
            title: "\(testName).\(snapshotName)")

        let illustration = OUDSThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle.colorScheme))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: snapshotName,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit

// MARK: - Promoted Axes

/// Groups the axes that identify a single Default/Inverse item cell, to keep call-site signatures small.
struct SwitchItemVariant {
    let family: SwitchLayoutFamily
    let mode: SwitchMode
    let contentVariant: SwitchContentVariant
    let hasDivider: Bool
}

/// The switch layout family. Folded into the grid (one column per family × hasDivider).
///
/// Note: the "inverse" naming is kept to match the legacy test case and the `SwitchTest.Layout` enum.
enum SwitchLayoutFamily {
    case `default`
    case inverse
}

/// The switch functional mode. Promoted to the snapshot filename.
///
/// Combines the legacy `isError / errorText / isReadOnly` flags into a single enum. Only valid combinations
/// from the original test case are represented.
enum SwitchMode: CaseIterable {
    case normal
    case error
    case errorWithText
    case readOnly

    /// `OUDSSwitch` (indicator-only) has no `isError` parameter in the legacy tests.
    static let indicatorOnlyModes: [SwitchMode] = [.normal, .readOnly]
    static let itemModes: [SwitchMode] = [.normal, .error, .errorWithText, .readOnly]

    var filenameToken: String {
        switch self {
        case .normal:
            "Normal"
        case .error:
            "Error"
        case .errorWithText:
            "ErrorWithText"
        case .readOnly:
            "ReadOnly"
        }
    }

    var isError: Bool {
        self == .error || self == .errorWithText
    }

    var isReadOnly: Bool {
        self == .readOnly
    }

    var errorText: String? {
        self == .errorWithText ? "Error text" : nil
    }

    /// Only the `normal` mode exercises the disabled flag in the legacy tests. Keep that behavior.
    var testsDisabled: Bool {
        self == .normal
    }
}

/// The content variant used by `.default` / `.inverse` layouts. Promoted to the snapshot filename.
///
/// Covers all six combinations of (label-only vs label+description) × (no image, image, flipped image)
/// exercised in the legacy test case so visual coverage is preserved.
enum SwitchContentVariant: CaseIterable {
    case labelOnly
    case labelDescription
    case labelImage
    case labelDescriptionImage
    case labelImageFlipped
    case labelDescriptionImageFlipped

    var filenameToken: String {
        switch self {
        case .labelOnly:
            "LabelOnly"
        case .labelDescription:
            "LabelDescription"
        case .labelImage:
            "LabelImage"
        case .labelDescriptionImage:
            "LabelDescImage"
        case .labelImageFlipped:
            "LabelImageFlipped"
        case .labelDescriptionImageFlipped:
            "LabelDescImageFlipped"
        }
    }

    var labelText: String {
        hasDescription ? "Patatas" : (hasImage ? "Kammthaar" : "Takoyaki")
    }

    var descriptionText: String? {
        hasDescription ? "Bravas" : nil
    }

    @MainActor var image: OUDSImage? {
        switch self {
        case .labelOnly, .labelDescription:
            nil
        case .labelImage, .labelDescriptionImage:
            OUDSImage(asset: Image.defaultImage())
        case .labelImageFlipped, .labelDescriptionImageFlipped:
            OUDSImage(asset: Image.defaultImage(), flipped: true)
        }
    }

    private var hasDescription: Bool {
        switch self {
        case .labelDescription, .labelDescriptionImage, .labelDescriptionImageFlipped:
            true
        default:
            false
        }
    }

    private var hasImage: Bool {
        switch self {
        case .labelImage, .labelDescriptionImage, .labelImageFlipped, .labelDescriptionImageFlipped:
            true
        default:
            false
        }
    }
}

// MARK: - Switch Test

/// The test object which will define the `OUDSSwitch` or `OUDSSwitchItem` object to test
struct SwitchTest: View {

    enum Layout { // ControlItemTextContainer.LayoutData is not accessible, need to fake it here
        case indicatorOnly(isReadOnly: Bool)
        case `default`(label: String,
                       description: String?,
                       image: OUDSImage?,
                       isError: Bool,
                       errorText: String? = nil,
                       hasDivider: Bool,
                       isReadOnly: Bool)
        case inverse(label: String,
                     description: String?,
                     image: OUDSImage?,
                     isError: Bool,
                     errorText: String? = nil,
                     hasDivider: Bool,
                     isReadOnly: Bool)
    }

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    let layout: Layout
    let indicatorState: Bool
    let isDisabled: Bool

    var body: some View {
        switch layout {
        case let .indicatorOnly(isReadOnly):
            OUDSSwitch(isOn: .constant(indicatorState), accessibilityLabel: "Bazinga!", isReadOnly: isReadOnly)
                .disabled(isDisabled)
        case let .default(label, description, image, isError, errorText, hasDivider, isReadOnly):
            OUDSSwitchItem(label,
                           isOn: .constant(indicatorState),
                           description: description,
                           image: image,
                           isReversed: false,
                           isError: isError,
                           errorText: errorText,
                           isReadOnly: isReadOnly,
                           hasDivider: hasDivider)
                .disabled(isDisabled)
        case let .inverse(label, description, image, isError, errorText, hasDivider, isReadOnly):
            OUDSSwitchItem(label,
                           isOn: .constant(indicatorState),
                           description: description,
                           image: image,
                           isReversed: true,
                           isError: isError,
                           errorText: errorText,
                           isReadOnly: isReadOnly,
                           hasDivider: hasDivider)
                .disabled(isDisabled)
        }
    }
}
