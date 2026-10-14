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

// MARK: - Test Cases

// swiftlint:disable required_deinit

/// Tests the UI rendering of the `OUDSTextInput` for each parameter.
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image).
///
/// Two test types with different axis structure:
///
/// 1. **styleAndStatus** — the inner `VStack` renders eight text inputs that depend on the leading/trailing
///    icons, so all image-related axes are meaningful.
///    - Axes kept as separate files (= filename):
///      `status × outlined × leadingImageType × trailingImageType × flipLeadingImage`
///      (= 5 × 2 × 2 × 2 × 2 = 160 files).
///    - Axes folded into each grid:
///      `flipTrailingActionIcon` (= 2 cells, grid 2×1 horizontal: 2 columns × 1 row).
///
/// 2. **helpers** — the inner `VStack` renders three text inputs without leading image / trailing action, so
///    `flipLeadingImage`, `flipTrailingActionIcon`, `leadingImageType` and `trailingImageType` do not change
///    the rendering. These axes are dropped to avoid the 16× duplicated reference images produced before.
///    - Axes kept as separate files (= filename):
///      `status × outlined` (= 5 × 2 = 10 files).
///    - Single-cell grid.
///
/// Total: 160 + 10 = 170 files per theme-scheme instead of 320.
///
/// **Note on the Loading status**: `OUDSTextInput.loading(progress:)` renders an
/// `OUDSCircularProgressIndicator(animated: true)` that animates from 0 to the target value. The
/// `TestTextInputView` applies the "Solution F" (`.transaction { $0.animation = nil }`) so the arc is
/// captured at its target value instead of appearing empty at t=0.
///
/// **/!\ It does not test the hover and pressed states.**
open class TextInputSnapshotsTestsTestCase: XCTestCase {

    // MARK: - Entry Point

    /// Tests all text input configurations for the given theme and color scheme on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllTextInputs(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        // styleAndStatus: full combinatorics on image-related axes + flipLeading promoted,
        // only flipTrailing folded into a 1×2 vertical grid (1 column × 2 rows).
        for outlined in [false, true] {
            for leadingImageType in DefinedStatusIcons.allCases {
                for trailingImageType in DefinedStatusIcons.allCases {
                    for flipLeading in [false, true] {
                        for status in OUDSTextInput.Status.allCases {
                            testStyleAndStatusGrid(theme: theme,
                                                   interfaceStyle: interfaceStyle,
                                                   outlined: outlined,
                                                   leadingImageType: leadingImageType,
                                                   trailingImageType: trailingImageType,
                                                   flipLeading: flipLeading,
                                                   status: status)
                        }
                    }
                }
            }
        }

        // helpers: no leading/trailing image used inside the VStack, so the image-related axes are dropped.
        for outlined in [false, true] {
            for status in OUDSTextInput.Status.allCases {
                testHelpersSingle(theme: theme,
                                  interfaceStyle: interfaceStyle,
                                  outlined: outlined,
                                  status: status)
            }
        }
    }

    // MARK: - styleAndStatus Grid Builder

    // swiftlint:disable function_parameter_count
    @MainActor private func testStyleAndStatusGrid(theme: OUDSTheme,
                                                   interfaceStyle: UIUserInterfaceStyle,
                                                   outlined: Bool,
                                                   leadingImageType: DefinedStatusIcons,
                                                   trailingImageType: DefinedStatusIcons,
                                                   flipLeading: Bool,
                                                   status: OUDSTextInput.Status)
    {
        // Grid 2×1 horizontal: 2 columns per flipTrailingActionIcon, 1 row.
        let columnAxes: [Bool] = [false, true] // flipTrailingActionIcon

        var cells: [SnapshotGridCell<AnyView>] = []
        for flipTrailing in columnAxes {
            cells.append(cell(theme: theme,
                              testType: .styleAndStatus,
                              flipleadingImage: flipLeading,
                              flipTrailingActionIcon: flipTrailing,
                              leadingImageType: leadingImageType,
                              trailingImageType: trailingImageType,
                              status: status,
                              outlined: outlined,
                              caption: caption(flipLeading: flipLeading, flipTrailing: flipTrailing)))
        }

        let testName = "test-styleAndStatus_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let snapshotName = snapshotName(outlined: outlined,
                                        leadingImageType: leadingImageType,
                                        trailingImageType: trailingImageType,
                                        flipLeading: flipLeading,
                                        status: status)

        let grid = SnapshotGrid(
            columns: 2,
            cellSize: TestTextInputView.TestType.styleAndStatus.cellSize,
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

    // swiftlint:enable function_parameter_count

    // MARK: - helpers Single-Cell Builder

    @MainActor private func testHelpersSingle(theme: OUDSTheme,
                                              interfaceStyle: UIUserInterfaceStyle,
                                              outlined: Bool,
                                              status: OUDSTextInput.Status)
    {
        // helpers variant does not react to flip/leading/trailing image axes.
        // Use fixed placeholder values to keep the API stable.
        let singleCell = cell(theme: theme,
                              testType: .helpers,
                              flipleadingImage: false,
                              flipTrailingActionIcon: false,
                              leadingImageType: .tintedIcon,
                              trailingImageType: .tintedIcon,
                              status: status,
                              outlined: outlined,
                              caption: "helpers")

        let testName = "test-helpers_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let outlinedPattern = outlined ? "_Outlined" : ""
        let statusPattern = status.technicalDescription.contains("error") ? "error" : status.technicalDescription
        let snapshotName = "\(outlinedPattern)\(statusPattern)"

        let grid = SnapshotGrid(
            columns: 1,
            cellSize: TestTextInputView.TestType.helpers.cellSize,
            cells: [singleCell],
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

    // MARK: - Cell Builder

    // swiftlint:disable function_parameter_count
    @MainActor private func cell(theme: OUDSTheme,
                                 testType: TestTextInputView.TestType,
                                 flipleadingImage: Bool,
                                 flipTrailingActionIcon: Bool,
                                 leadingImageType: DefinedStatusIcons,
                                 trailingImageType: DefinedStatusIcons,
                                 status: OUDSTextInput.Status,
                                 outlined: Bool,
                                 caption: String) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: caption) {
            AnyView(
                OUDSThemeableView(theme: theme) {
                    TestTextInputView(type: testType,
                                      flipleadingImage: flipleadingImage,
                                      flipTrailingActionIcon: flipTrailingActionIcon,
                                      leadingImageType: leadingImageType,
                                      trailingImageType: trailingImageType,
                                      status: status,
                                      outlined: outlined)
                })
        }
    }

    // swiftlint:enable function_parameter_count

    // MARK: - Captions / Names

    private func caption(flipLeading: Bool, flipTrailing: Bool) -> String {
        let leading = flipLeading ? "flipL" : "stdL"
        let trailing = flipTrailing ? "flipT" : "stdT"
        return "\(leading) · \(trailing)"
    }

    private func snapshotName(outlined: Bool,
                              leadingImageType: DefinedStatusIcons,
                              trailingImageType: DefinedStatusIcons,
                              flipLeading: Bool,
                              status: OUDSTextInput.Status) -> String
    {
        let leadingImageModePattern = leadingImageType == .image ? "_LeadingOriginalImage" : "_LeadingTemplateImage"
        let trailingImageModePattern = trailingImageType == .image ? "_TrailingOriginalImage" : "_TrailingTemplateImage"
        let flipLeadingPattern = flipLeading ? "_LeadingFlipped" : ""
        let outlinedPattern = outlined ? "_Outlined" : ""
        let statusPattern = status.technicalDescription.contains("error") ? "error" : status.technicalDescription
        return "\(flipLeadingPattern)\(leadingImageModePattern)\(trailingImageModePattern)\(outlinedPattern)\(statusPattern)"
    }
}

// swiftlint:enable required_deinit

// MARK: - Test Text Input View

struct TestTextInputView: View {

    /// Two types of test
    enum TestType: String {
        /// Used to test status and style on subset available layouts (eight text inputs stacked).
        case styleAndStatus
        /// Used to test helpers (three text inputs stacked).
        case helpers

        /// Fixed cell size used by the enclosing ``SnapshotGrid``. Heights account for the 24pt
        /// inter-text-input spacing applied in `TestTextInputView`.
        var cellSize: CGSize {
            switch self {
            case .styleAndStatus:
                CGSize(width: 400, height: 1_000)
            case .helpers:
                CGSize(width: 400, height: 400)
            }
        }
    }

    // MARK: - Stored properties

    let type: TestType
    let flipleadingImage: Bool
    let flipTrailingActionIcon: Bool
    let leadingImageType: DefinedStatusIcons
    let trailingImageType: DefinedStatusIcons
    let status: OUDSTextInput.Status
    let outlined: Bool

    @State private var text = ""

    private var leadingImage: OUDSImage {
        let asset: Image = leadingImageType == .tintedIcon ? Image(decorative: "ic_heart") : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = leadingImageType == .tintedIcon ? .template : .original
        return OUDSImage(asset: asset, flipped: flipleadingImage, renderingMode: renderingMode)
    }

    private var trailingImage: OUDSImage {
        let asset: Image = trailingImageType == .tintedIcon ? Image(decorative: "ic_heart") : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = trailingImageType == .tintedIcon ? .template : .original
        return OUDSImage(asset: asset, flipped: flipTrailingActionIcon, renderingMode: renderingMode)
    }

    // MARK: - Body

    var body: some View {
        content
            // Solution F: force the circular progress indicator used by `.loading` to appear at its target
            // value instead of animating from 0 (which would otherwise capture an empty arc).
            .transaction { transaction in
                if isLoadingStatus {
                    transaction.animation = nil
                }
            }
    }

    @ViewBuilder
    private var content: some View {
        switch type {
        case .styleAndStatus:
            textInputWithStatus
        case .helpers:
            textinputWithHelper
        }
    }

    private var isLoadingStatus: Bool {
        if case .loading = status { return true }
        return false
    }

    // MARK: - Layout for tests

    // swiftlint:disable closure_body_length
    /// View to test all layouts in once
    private var textInputWithStatus: some View {
        VStack(alignment: .leading, spacing: 24) {
            // Simplest text case
            OUDSTextInput(label: "Label",
                          text: $text,
                          isOutlined: outlined,
                          status: status)

            // With leading icon
            OUDSTextInput(label: "Label",
                          text: $text,
                          leadingImage: leadingImage,
                          isOutlined: outlined,
                          status: status)

            // With trailing action
            OUDSTextInput(label: "Label",
                          text: $text,
                          trailingAction: trailingAction,
                          isOutlined: outlined,
                          status: status)

            // With leading icon and trailing action
            OUDSTextInput(label: "Label",
                          text: $text,
                          leadingImage: leadingImage,
                          trailingAction: trailingAction,
                          isOutlined: outlined,
                          status: status)

            // More complex with placeholder
            OUDSTextInput(label: "Label",
                          text: $text,
                          placeholder: "Placeholder",
                          prefix: "£",
                          suffix: "$",
                          isOutlined: outlined,
                          status: status)

            // With placeholder and leading icon
            OUDSTextInput(label: "Label",
                          text: $text,
                          placeholder: "Placeholder",
                          prefix: "£",
                          suffix: "$",
                          leadingImage: leadingImage,
                          isOutlined: outlined,
                          status: status)

            // With placeholder and trailing action
            OUDSTextInput(label: "Label",
                          text: $text,
                          placeholder: "Placeholder",
                          prefix: "£",
                          suffix: "$",
                          trailingAction: trailingAction,
                          isOutlined: outlined,
                          status: status)

            // Full options
            OUDSTextInput(label: "Label",
                          text: $text,
                          placeholder: "Placeholder",
                          prefix: "£",
                          suffix: "$",
                          leadingImage: leadingImage,
                          trailingAction: trailingAction,
                          isOutlined: outlined,
                          status: status)
        }
        .padding(.horizontal, 12)
    }

    // swiftlint:enable closure_body_length

    /// View to test helpers (Helper Text, Helper Link)
    private var textinputWithHelper: some View {
        VStack(alignment: .leading, spacing: 24) {
            OUDSTextInput(label: "Label",
                          text: $text,
                          helperText: "Helper text",
                          isOutlined: outlined,
                          status: status)

            OUDSTextInput(label: "Label",
                          text: $text,
                          helperLink: helperLink,
                          isOutlined: outlined,
                          status: status)

            OUDSTextInput(label: "Label",
                          text: $text,
                          helperText: "Helper text",
                          helperLink: helperLink,
                          isOutlined: outlined,
                          status: status)
        }
        .padding(.horizontal, 12)
    }

    // MARK: - Helpers

    private var trailingAction: OUDSTextInput.TrailingAction {
        .init(image: trailingImage, actionHint: "", action: {})
    }

    private var helperLink: OUDSTextInput.Helperlink {
        .init(text: "HelperLink") {}
    }
}

// MARK: - Extension of OUDS Text Input Status

extension OUDSTextInput.Status: DesignToolboxEnumLocalizedRepresentable, @retroactive CaseIterable, @retroactive Hashable {

    nonisolated(unsafe) public static var allCases: [OUDSTextInput.Status] =
        [.enabled, .error(message: "app_components_textInput_errorDescription_label".localized()), .loading(progress: 0.75), .readOnly, .disabled]

    public var wordingKey: String {
        switch self {
        case .enabled:
            "app_common_enabled_tech"
        case .error:
            "app_components_common_error_tech"
        case .richError:
            "app_components_common_richError_tech"
        case .loading:
            "app_components_common_loader_tech"
        case .readOnly:
            "app_components_common_readOnly_tech"
        case .disabled:
            "app_common_disabled_tech"
        }
    }

    public var technicalDescription: String {
        if self == .readOnly {
            return ".readOnly"
        }
        if case let .error(message) = self {
            return ".error(message: \"\(message)\")"
        } else {
            return ".\(wordingKey.localized().lowercased())"
        }
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(wordingKey)
    }
}
