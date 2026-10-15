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
// swiftlint:disable file_length

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSRadio` and `OUDSRadioItem` for each parameter.
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image).
///
/// Axes kept as separate files (= filename):
///   - `layoutScope` ∈ {IndicatorOnly, Item} (IndicatorOnly covers `OUDSRadio`; Item covers `OUDSRadioItem`
///     with both Default and Reversed families folded into the same grid).
///   - `mode` ∈ {Normal, Error, ErrorWithText, ReadOnly} (ErrorWithText skipped for IndicatorOnly).
///   - `contentVariant` for Item (10 variants covering label / extraLabel / helper / image / flipped image
///     combinations exercised in the legacy test case).
///   - `a11yContrast` ∈ {Normal, HighContrast} (forced to filename because the UITraitCollection is applied
///     to the whole illustration by `assertIllustration`).
///
/// Axes folded into each grid:
///   - Item grids: `family (Default|Reversed) × hasDivider × indicatorState × isDisabled`.
///   - IndicatorOnly grids: `indicatorState × isDisabled`.
///
/// Grid layout for Item files:
///   - 4 columns: `family × hasDivider` ∈ {Default/NoDivider, Default/Divider, Reversed/NoDivider, Reversed/Divider}.
///   - Rows: one per `indicatorState × isDisabled` (4 rows in Normal mode, 2 rows in Error/ErrorWithText/ReadOnly
///     where only `isDisabled = false` is exercised historically).
///
/// **/!\ It does not test the hover and pressed states.**
open class RadioButtonSnapshotsTestsTestCase: XCTestCase {

    /// Fixed size applied to each cell of a radio grid. Width accommodates label + extraLabel + helper
    /// + image + divider; height accommodates label + extraLabel + helper + optional error text + 2 caption lines.
    private static let cellSize = CGSize(width: 340, height: 110)

    // MARK: - Entry Point

    /// Tests all radio button configurations for the given theme and color scheme on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllRadioButtons(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for a11yContrast in [UIAccessibilityContrast.normal, .high] {
            // IndicatorOnly: modes {Normal, Error, ReadOnly}.
            for mode in RadioMode.indicatorOnlyModes {
                testIndicatorOnlyGrid(theme: theme,
                                      interfaceStyle: interfaceStyle,
                                      a11yContrast: a11yContrast,
                                      mode: mode)
            }

            // Item (Default + Reversed combined): modes × 10 contentVariants.
            for mode in RadioMode.itemModes {
                for contentVariant in RadioContentVariant.allCases {
                    testItemGrid(theme: theme,
                                 interfaceStyle: interfaceStyle,
                                 a11yContrast: a11yContrast,
                                 mode: mode,
                                 contentVariant: contentVariant)
                }
            }
        }
    }

    // MARK: - IndicatorOnly Grid

    @MainActor private func testIndicatorOnlyGrid(theme: OUDSTheme,
                                                  interfaceStyle: UIUserInterfaceStyle,
                                                  a11yContrast: UIAccessibilityContrast,
                                                  mode: RadioMode)
    {
        let disabledValues = mode.testsDisabled ? [false, true] : [false]
        var cells: [SnapshotGridCell<AnyView>] = []
        for indicatorState in [true, false] {
            for isDisabled in disabledValues {
                let layout = RadioTest.Layout.indicatorOnly(isError: mode.isError,
                                                            isReadOnly: mode.isReadOnly)
                cells.append(cell(theme: theme,
                                  layout: layout,
                                  indicatorState: indicatorState,
                                  isDisabled: isDisabled,
                                  caption: stateCaption(indicatorState: indicatorState, isDisabled: isDisabled)))
            }
        }

        let columns = disabledValues.count
        let name = "IndicatorOnly_\(mode.filenameToken)_\(contrastToken(a11yContrast))"
        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   a11yContrast: a11yContrast,
                   snapshotName: name,
                   columns: columns,
                   cells: cells)
    }

    // MARK: - Item Grid (Default + Reversed combined)

    @MainActor private func testItemGrid(theme: OUDSTheme,
                                         interfaceStyle: UIUserInterfaceStyle,
                                         a11yContrast: UIAccessibilityContrast,
                                         mode: RadioMode,
                                         contentVariant: RadioContentVariant)
    {
        let disabledValues = mode.testsDisabled ? [false, true] : [false]

        // One column per (family × hasDivider), one row per (indicatorState × isDisabled).
        let columnAxes: [(family: RadioLayoutFamily, hasDivider: Bool)] = [
            (.default, false), (.default, true), (.reversed, false), (.reversed, true),
        ]

        var cells: [SnapshotGridCell<AnyView>] = []
        for indicatorState in [true, false] {
            for isDisabled in disabledValues {
                for axis in columnAxes {
                    let variant = RadioItemVariant(family: axis.family,
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

        let name = "\(contentVariant.filenameToken)_\(mode.filenameToken)_\(contrastToken(a11yContrast))"
        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   a11yContrast: a11yContrast,
                   snapshotName: name,
                   columns: columnAxes.count,
                   cells: cells)
    }

    // MARK: - Layout Builders

    @MainActor private func makeItemLayout(variant: RadioItemVariant) -> RadioTest.Layout {
        let labelText = variant.contentVariant.labelText
        let extraLabelText = variant.contentVariant.extraLabelText
        let helperText = variant.contentVariant.helperText
        let image = variant.contentVariant.image
        let isError = variant.mode.isError
        let errorText = variant.mode.errorText
        let isReadOnly = variant.mode.isReadOnly
        let hasDivider = variant.hasDivider

        switch variant.family {
        case .default:
            return .default(labelText: labelText,
                            extraLabelText: extraLabelText,
                            helperText: helperText,
                            image: image,
                            isError: isError,
                            errorText: errorText,
                            hasDivider: hasDivider,
                            isReadOnly: isReadOnly)
        case .reversed:
            return .reversed(labelText: labelText,
                             extraLabelText: extraLabelText,
                             helperText: helperText,
                             image: image,
                             isError: isError,
                             errorText: errorText,
                             hasDivider: hasDivider,
                             isReadOnly: isReadOnly)
        }
    }

    // MARK: - Cell Builder

    @MainActor private func cell(theme: OUDSTheme,
                                 layout: RadioTest.Layout,
                                 indicatorState: Bool,
                                 isDisabled: Bool,
                                 caption: String) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    RadioTest(layout: layout,
                              indicatorState: indicatorState,
                              isDisabled: isDisabled)
                })
        }
    }

    // MARK: - Captions

    private func stateCaption(indicatorState: Bool, isDisabled: Bool) -> String {
        "\(indicatorState ? "on" : "off")\n\(isDisabled ? "disabled" : "enabled")"
    }

    private func itemCaption(family: RadioLayoutFamily,
                             hasDivider: Bool,
                             indicatorState: Bool,
                             isDisabled: Bool) -> String
    {
        let familyShort = family == .default ? "Def" : "Rev"
        let dividerShort = hasDivider ? "+div" : "-div"
        return "\(familyShort) \(dividerShort)\n\(indicatorState ? "on" : "off") · \(isDisabled ? "dis" : "ena")"
    }

    private func contrastToken(_ contrast: UIAccessibilityContrast) -> String {
        contrast == .high ? "HighContrast" : "NormalContrast"
    }

    // MARK: - Grid Assertion

    /// Composes the grid and captures a single snapshot assertion.
    @MainActor private func assertGrid(theme: OUDSTheme,
                                       interfaceStyle: UIUserInterfaceStyle,
                                       a11yContrast: UIAccessibilityContrast,
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
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           a11yContrast: a11yContrast,
                           named: snapshotName,
                           precision: 0.99, // Historical tolerance kept from the legacy test case.
                           testName: testName)
    }

    /// This function tests the `OUDSRadio` skeleton state (default configuration) for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testRadioButtonSkeleton(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSRadio(isOn: .constant(false),
                      accessibilityLabel: "Bazinga!",
                      isError: false,
                      isReadOnly: false)
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testRadioButton_skeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "RadioButtonSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit

// MARK: - Promoted Axes

/// Groups the axes that identify a single Default/Reversed item cell, to keep call-site signatures small.
struct RadioItemVariant {
    let family: RadioLayoutFamily
    let mode: RadioMode
    let contentVariant: RadioContentVariant
    let hasDivider: Bool
}

/// The radio layout family. Folded into the grid (one column per family × hasDivider).
enum RadioLayoutFamily {
    case `default`
    case reversed
}

/// The radio functional mode. Promoted to the snapshot filename.
///
/// Combines the legacy `isError / errorText / isReadOnly` flags into a single enum. Only valid combinations
/// from the original test case are represented.
enum RadioMode: CaseIterable {
    case normal
    case error
    case errorWithText
    case readOnly

    static let indicatorOnlyModes: [RadioMode] = [.normal, .error, .readOnly]
    static let itemModes: [RadioMode] = [.normal, .error, .errorWithText, .readOnly]

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

/// The content variant used by `.default` / `.reversed` layouts. Promoted to the snapshot filename.
///
/// Covers all ten combinations of (label, label+helper, label+extra, label+extra+helper) × (no image,
/// image, flipped image) exercised in the legacy test case so visual coverage is preserved.
///
/// Note: not all (label composition × image kind) combinations exist in the legacy tests.
enum RadioContentVariant: CaseIterable {
    case labelOnly
    case labelHelper
    case labelExtra
    case labelExtraHelper
    case labelImage
    case labelHelperImage
    case labelExtraHelperImage
    case labelImageFlipped
    case labelHelperImageFlipped
    case labelExtraHelperImageFlipped

    var filenameToken: String {
        switch self {
        case .labelOnly:
            "LabelOnly"
        case .labelHelper:
            "LabelHelper"
        case .labelExtra:
            "LabelExtra"
        case .labelExtraHelper:
            "LabelExtraHelper"
        case .labelImage:
            "LabelImage"
        case .labelHelperImage:
            "LabelHelperImage"
        case .labelExtraHelperImage:
            "LabelExtraHelperImage"
        case .labelImageFlipped:
            "LabelImageFlipped"
        case .labelHelperImageFlipped:
            "LabelHelperImageFlipped"
        case .labelExtraHelperImageFlipped:
            "LabelExtraHelperImageFlipped"
        }
    }

    var labelText: String {
        switch self {
        case .labelOnly:
            "Takoyaki"
        case .labelImage, .labelImageFlipped:
            "Kammthaar"
        default:
            "Patatas"
        }
    }

    var extraLabelText: String? {
        switch self {
        case .labelExtra, .labelExtraHelper, .labelExtraHelperImage, .labelExtraHelperImageFlipped:
            "Patatata-patatata-patatas"
        default:
            nil
        }
    }

    var helperText: String? {
        switch self {
        case .labelHelper,
             .labelExtraHelper,
             .labelHelperImage,
             .labelExtraHelperImage,
             .labelHelperImageFlipped,
             .labelExtraHelperImageFlipped:
            "Bravas"
        default:
            nil
        }
    }

    @MainActor var image: OUDSImage? {
        switch self {
        case .labelImage, .labelHelperImage, .labelExtraHelperImage:
            OUDSImage(asset: Image.defaultImage())
        case .labelImageFlipped, .labelHelperImageFlipped, .labelExtraHelperImageFlipped:
            OUDSImage(asset: Image.defaultImage(), flipped: true)
        default:
            nil
        }
    }
}

// MARK: - Radio Test

/// The test object which will define the `OUDSRadio` or `OUDSRadioItem` object to test
struct RadioTest: View {

    enum Layout { // ControlItemTextContainer.LayoutData is not accessible, need to fake it here
        case indicatorOnly(isError: Bool, isReadOnly: Bool)
        case `default`(labelText: String,
                       extraLabelText: String?,
                       helperText: String?,
                       image: OUDSImage?,
                       isError: Bool,
                       errorText: String? = nil,
                       hasDivider: Bool,
                       isReadOnly: Bool)
        case reversed(labelText: String,
                      extraLabelText: String?,
                      helperText: String?,
                      image: OUDSImage?,
                      isError: Bool,
                      errorText: String? = nil,
                      hasDivider: Bool,
                      isReadOnly: Bool)
    }

    let layout: Layout
    let indicatorState: Bool
    let isDisabled: Bool

    var body: some View {
        radioButton()
    }

    @ViewBuilder
    func radioButton() -> some View {
        switch layout {
        case let .indicatorOnly(isError, isReadOnly):
            OUDSRadio(isOn: .constant(indicatorState),
                      accessibilityLabel: "Bazinga!",
                      isError: isError,
                      isReadOnly: isReadOnly)
                .disabled(isDisabled)
        case let .default(labelText, extraLabelText, descriptionText, icon, isError, errorText, hasDivider, isReadOnly):
            OUDSRadioItem(labelText,
                          isOn: .constant(indicatorState),
                          extraLabel: extraLabelText,
                          description: descriptionText,
                          image: icon,
                          isReversed: false,
                          isError: isError,
                          errorText: errorText,
                          isReadOnly: isReadOnly,
                          hasDivider: hasDivider)
                .disabled(isDisabled)
        case let .reversed(labelText, extraLabelText, descriptionText, icon, isError, errorText, hasDivider, isReadOnly):
            OUDSRadioItem(labelText,
                          isOn: .constant(indicatorState),
                          extraLabel: extraLabelText,
                          description: descriptionText,
                          image: icon,
                          isReversed: true,
                          isError: isError,
                          errorText: errorText,
                          isReadOnly: isReadOnly,
                          hasDivider: hasDivider)
                .disabled(isDisabled)
        }
    }
}
