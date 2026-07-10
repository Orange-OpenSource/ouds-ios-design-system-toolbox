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
/// Tests the UI rendering of the `OUDSTextInput` for each parameter
open class TextInputSnapshotsTestsTestCase: XCTestCase {

    /// This function tests some Text input configuration for the given theme and color schemes on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// It iterates through all combinations of configuration:
    /// - the rounded layout
    /// - the style of the text input (default, alternative)
    /// - status of the text input (the loader is dropped still the progress indicator is done)
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllTextInputs(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for outlined in [true, false] {
            for flipleadingImage in [true, false] {
                for flipTrailingActionIcon in [true, false] {
                    for leadingImageType in DefinedStatusIcons.allCases {
                        for trailingImageType in DefinedStatusIcons.allCases {
                            // Drop the loading status still the progress indicator is done
                            for status in OUDSTextInput.Status.allCases where status != .loading {
                                testTextInput(theme: theme,
                                              interfaceStyle: interfaceStyle,
                                              testType: .styleAndStatus,
                                              flipleadingImage: flipleadingImage,
                                              flipTrailingActionIcon: flipTrailingActionIcon,
                                              leadingImageType: leadingImageType,
                                              trailingImageType: trailingImageType,
                                              status: status,
                                              outlined: outlined)
                                testTextInput(theme: theme,
                                              interfaceStyle: interfaceStyle,
                                              testType: .helpers,
                                              flipleadingImage: flipleadingImage,
                                              flipTrailingActionIcon: flipTrailingActionIcon,
                                              leadingImageType: leadingImageType,
                                              trailingImageType: trailingImageType,
                                              status: status,
                                              outlined: outlined)
                            }
                        }
                    }
                }
            }
        }
    }

    // swiftlint:disable function_parameter_count
    /// This function tests some Text input configuration for the given theme and color schemes on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// It iterates through all combinations of configuration:
    /// - the rounded layout
    /// - the style of the text input (default, alternative)
    /// - status of the text input (the loader is dropped still the progress indicator is done)
    ///
    /// According to the `testStyle`, the right view for illustraiton is created and the right name of test is geneated.
    /// To reduce the number of snapshots, some configuration are set in a single illustration.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - testStyle: the type of test expected
    ///   - flipleadingImage: to flip the leading icon
    ///   - flipTrailingActionIcon: to flip the trailing action icon
    ///   - leadingImageType: the icon type for the leading icon (tinted or image)
    ///   - trailingImageType: the icon type for the trailing action icon (tinted or image)
    ///   - status: the status of the text input
    ///   - outlined: flag to know if outlined
    @MainActor private func testTextInput(theme: OUDSTheme,
                                          interfaceStyle: UIUserInterfaceStyle,
                                          testType: TestTextInputView.TestType,
                                          flipleadingImage: Bool,
                                          flipTrailingActionIcon: Bool,
                                          leadingImageType: DefinedStatusIcons,
                                          trailingImageType: DefinedStatusIcons,
                                          status: OUDSTextInput.Status,
                                          outlined: Bool)
    {
        // Generate the illustration for configuration elements
        let illustration = OUDSThemeableView(theme: theme) {
            TestTextInputView(type: testType,
                              flipleadingImage: flipleadingImage,
                              flipTrailingActionIcon: flipTrailingActionIcon,
                              leadingImageType: leadingImageType,
                              trailingImageType: trailingImageType,
                              status: status,
                              outlined: outlined)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test<testType>_<themeName>_<colorScheme>.<roundedPattern><stylePattern><statusPattern>
        let testName = "test-\(testType)_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let flipleadingImagePattern = flipleadingImage ? "_LeadingFlipped" : ""
        let flipTrailingActionIconPattern = flipTrailingActionIcon ? "_TrailingActionFlipped" : ""
        let leadingImageModePattern = leadingImageType == .image ? "_LeadingOriginalImage" : "_LeadingTemplateImage"
        let trailingImageModePattern = trailingImageType == .image ? "_TrailingOriginalImage" : "_TrailingTemplateImage"
        let outlinedPattern = outlined ? "_Outlined" : ""
        let statusPattern = status.technicalDescription.contains("error") ? "error" : status.technicalDescription

        let named = "\(flipleadingImagePattern)\(flipTrailingActionIconPattern)\(leadingImageModePattern)\(trailingImageModePattern)\(outlinedPattern)\(statusPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: named,
                           testName: testName)
    }
    // swiftlint:enable function_parameter_count
}

// swiftlint:enable required_deinit

struct TestTextInputView: View {

    /// Two types of test
    enum TestType: String {
        /// Used to test status and style on subset available layouts
        case styleAndStatus
        /// Used to test helpers
        case helpers
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
        switch type {
        case .styleAndStatus:
            textInputWithStatus
        case .helpers:
            textinputWithHelper
        }
    }

    // MARK: - Layout for tests

    // swiftlint:disable closure_body_length
    /// View to test all layouts in once
    private var textInputWithStatus: some View {
        VStack(alignment: .leading, spacing: 1) {
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
    }

    // swiftlint:enable closure_body_length

    /// View to test helpers (Helper Text, Helper Link)
    private var textinputWithHelper: some View {
        VStack(alignment: .leading, spacing: 1) {
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
        [.enabled, .error(message: "app_components_textInput_errorDescription_label".localized()), .loading, .readOnly, .disabled]

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
