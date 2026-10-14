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

/// Tests the UI rendering of the `OUDSCheckboxIndeterminate` and `OUDSCheckboxItemIndeterminate` for each parameter.
/// `OUDSCheckbox` and `OUDSCheckboxItem` won't be tested as, until today, are based on the same layouts and look and feels, and the only difference
/// is in the management of the states.
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image). Each grid is laid out with one row
/// per `indicatorState × isDisabled` so a regression touching a particular state stays identifiable.
///
/// Axes kept as separate files (= filename):
///   - `layoutFamily` ∈ {IndicatorOnly, Default, Reversed}
///   - `mode` ∈ {Normal, Error, ErrorWithText, ReadOnly} (ErrorWithText skipped for IndicatorOnly)
///   - `contentVariant` for Default / Reversed (6 variants covering label / description / image / flipped image)
///   - `hasDivider` ∈ {false, true} (promoted to filename as requested)
///   - `a11yContrast` ∈ {Normal, HighContrast} (forced to filename because the UITraitCollection is applied
///     to the whole illustration by `assertIllustration`, so a single grid cannot host both contrasts).
///
/// Axes folded into each grid:
///   - `indicatorState × isDisabled` (= up to 6 cells).
///
/// **/!\ It does not test the hover and pressed states.**
open class CheckboxSnapshotsTestsTestCase: XCTestCase {

    /// Fixed size applied to each cell of a checkbox grid. Width accommodates label + description + image
    /// + (optional) divider; height accommodates label + description + optional error text + 2 caption lines.
    private static let cellSize = CGSize(width: 320, height: 90)

    // MARK: - Entry Point

    /// Tests all checkbox configurations for the given theme and color scheme on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllCheckboxes(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for a11yContrast in [UIAccessibilityContrast.normal, .high] {
            // IndicatorOnly: modes {Normal, Error, ReadOnly} (no ErrorWithText, no contentVariant, no divider).
            for mode in CheckboxMode.indicatorOnlyModes {
                testIndicatorOnlyGrid(theme: theme,
                                      interfaceStyle: interfaceStyle,
                                      a11yContrast: a11yContrast,
                                      mode: mode)
            }

            // Default & Reversed: modes {Normal, Error, ErrorWithText, ReadOnly} × 6 contentVariants × 2 dividers.
            for family in [CheckboxLayoutFamily.default, .reversed] {
                for mode in CheckboxMode.itemModes {
                    for contentVariant in CheckboxContentVariant.allCases {
                        for hasDivider in [false, true] {
                            let variant = CheckboxItemVariant(family: family,
                                                              mode: mode,
                                                              contentVariant: contentVariant,
                                                              hasDivider: hasDivider)
                            testItemGrid(theme: theme,
                                         interfaceStyle: interfaceStyle,
                                         a11yContrast: a11yContrast,
                                         variant: variant)
                        }
                    }
                }
            }
        }
    }

    // MARK: - IndicatorOnly Grid

    @MainActor private func testIndicatorOnlyGrid(theme: OUDSTheme,
                                                  interfaceStyle: UIUserInterfaceStyle,
                                                  a11yContrast: UIAccessibilityContrast,
                                                  mode: CheckboxMode)
    {
        let disabledValues = mode.testsDisabled ? [false, true] : [false]
        var cells: [SnapshotGridCell<AnyView>] = []
        for state in OUDSCheckboxIndicatorState.allCases {
            for isDisabled in disabledValues {
                let layout = CheckboxIndeterminateTest.Layout.indicatorOnly(isError: mode.isError,
                                                                            isReadOnly: mode.isReadOnly)
                cells.append(cell(theme: theme,
                                  layout: layout,
                                  indicatorState: state,
                                  isDisabled: isDisabled,
                                  caption: stateCaption(state: state, isDisabled: isDisabled)))
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

    // MARK: - Item Grid (Default / Reversed)

    @MainActor private func testItemGrid(theme: OUDSTheme,
                                         interfaceStyle: UIUserInterfaceStyle,
                                         a11yContrast: UIAccessibilityContrast,
                                         variant: CheckboxItemVariant)
    {
        let disabledValues = variant.mode.testsDisabled ? [false, true] : [false]
        var cells: [SnapshotGridCell<AnyView>] = []
        for state in OUDSCheckboxIndicatorState.allCases {
            for isDisabled in disabledValues {
                let layout = makeItemLayout(variant: variant)
                cells.append(cell(theme: theme,
                                  layout: layout,
                                  indicatorState: state,
                                  isDisabled: isDisabled,
                                  caption: stateCaption(state: state, isDisabled: isDisabled)))
            }
        }

        let columns = disabledValues.count
        let dividerToken = variant.hasDivider ? "Divider" : "NoDivider"
        let name = "\(variant.family.filenameToken)_\(variant.contentVariant.filenameToken)_\(variant.mode.filenameToken)_\(dividerToken)_\(contrastToken(a11yContrast))"
        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   a11yContrast: a11yContrast,
                   snapshotName: name,
                   columns: columns,
                   cells: cells)
    }

    // MARK: - Layout Builders

    @MainActor private func makeItemLayout(variant: CheckboxItemVariant) -> CheckboxIndeterminateTest.Layout {
        let labelText = variant.contentVariant.labelText
        let descriptionText = variant.contentVariant.descriptionText
        let image = variant.contentVariant.image
        let isError = variant.mode.isError
        let errorText = variant.mode.errorText
        let isReadOnly = variant.mode.isReadOnly
        let hasDivider = variant.hasDivider

        switch variant.family {
        case .default:
            return .default(labelText: labelText,
                            descriptionText: descriptionText,
                            image: image,
                            isError: isError,
                            errorText: errorText,
                            hasDivider: hasDivider,
                            isReadOnly: isReadOnly)
        case .reversed:
            return .reversed(labelText: labelText,
                             descriptionText: descriptionText,
                             image: image,
                             isError: isError,
                             errorText: errorText,
                             hasDivider: hasDivider,
                             isReadOnly: isReadOnly)
        }
    }

    // MARK: - Cell Builder

    @MainActor private func cell(theme: OUDSTheme,
                                 layout: CheckboxIndeterminateTest.Layout,
                                 indicatorState: OUDSCheckboxIndicatorState,
                                 isDisabled: Bool,
                                 caption: String) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    CheckboxIndeterminateTest(layout: layout,
                                              indicatorState: indicatorState,
                                              isDisabled: isDisabled)
                })
        }
    }

    // MARK: - Captions

    private func stateCaption(state: OUDSCheckboxIndicatorState, isDisabled: Bool) -> String {
        "\(state.name)\n\(isDisabled ? "disabled" : "enabled")"
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
                           precision: 0.92, // Historical tolerance kept from the legacy test case.
                           testName: testName)
    }
}

// swiftlint:enable required_deinit

// MARK: - Promoted Axes

/// Groups the axes that identify a single Default/Reversed item grid, to keep call-site signatures small.
struct CheckboxItemVariant {
    let family: CheckboxLayoutFamily
    let mode: CheckboxMode
    let contentVariant: CheckboxContentVariant
    let hasDivider: Bool
}

/// The checkbox layout family. Promoted to the snapshot filename.
enum CheckboxLayoutFamily {
    case `default`
    case reversed

    var filenameToken: String {
        switch self {
        case .default:
            "Default"
        case .reversed:
            "Reversed"
        }
    }
}

/// The checkbox functional mode. Promoted to the snapshot filename.
///
/// Combines the legacy `isError / errorText / isReadOnly` flags into a single enum. Only valid combinations
/// from the original test case are represented.
enum CheckboxMode: CaseIterable {
    case normal
    case error
    case errorWithText
    case readOnly

    static let indicatorOnlyModes: [CheckboxMode] = [.normal, .error, .readOnly]
    static let itemModes: [CheckboxMode] = [.normal, .error, .errorWithText, .readOnly]

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
/// Covers all six combinations of (label-only vs label+description) × (no image, image, flipped image)
/// exercised in the legacy test case so visual coverage is preserved.
enum CheckboxContentVariant: CaseIterable {
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

// MARK: - Checkbox Test

/// The test object which will define the `OUDSCheckboxIndeterminate` or `OUDSCheckboxItemIndeterminate` object to test.
struct CheckboxIndeterminateTest: View {

    enum Layout { // Checkbox.Layout is private, not accessible from here
        case indicatorOnly(isError: Bool, isReadOnly: Bool)
        case `default`(labelText: String,
                       descriptionText: String?,
                       image: OUDSImage?,
                       isError: Bool,
                       errorText: String? = nil,
                       hasDivider: Bool,
                       isReadOnly: Bool)
        case reversed(labelText: String,
                      descriptionText: String?,
                      image: OUDSImage?,
                      isError: Bool,
                      errorText: String? = nil,
                      hasDivider: Bool,
                      isReadOnly: Bool)
    }

    let layout: Layout
    let indicatorState: OUDSCheckboxIndicatorState
    let isDisabled: Bool

    var body: some View {
        checkbox()
    }

    @ViewBuilder
    func checkbox() -> some View {
        switch layout {
        case let .indicatorOnly(isError, isReadOnly):
            OUDSCheckboxIndeterminate(selection: .constant(indicatorState),
                                      accessibilityLabel: "Bazinga!",
                                      isError: isError,
                                      isReadOnly: isReadOnly)
                .disabled(isDisabled)
        case let .default(labelText, descriptionText, image, isError, errorText, hasDivider, isReadOnly):
            OUDSCheckboxItemIndeterminate(labelText,
                                          selection: .constant(indicatorState),
                                          description: descriptionText,
                                          image: image,
                                          isReversed: false,
                                          isError: isError,
                                          errorText: errorText,
                                          isReadOnly: isReadOnly,
                                          hasDivider: hasDivider)
                .disabled(isDisabled)
        case let .reversed(labelText, descriptionText, image, isError, errorText, hasDivider, isReadOnly):
            OUDSCheckboxItemIndeterminate(labelText,
                                          selection: .constant(indicatorState),
                                          description: descriptionText,
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

// MARK: - extension OUDSCheckboxIndicatorState

extension OUDSCheckboxIndicatorState {
    var name: String {
        switch self {
        case .selected:
            "Selected"
        case .unselected:
            "Unselected"
        case .indeterminate:
            "Indeterminate"
        }
    }
}
