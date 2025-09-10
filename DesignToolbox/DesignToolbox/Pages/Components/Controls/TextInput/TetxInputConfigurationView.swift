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
import SwiftUI

// MARK: - TextInput Configuration Model

/// The model shared between `TextInputPageConfiguration` view and `TextInputPageComponent` view.
final class TextInputConfigurationModel: ComponentConfiguration {

    // MARK: Stored properties
    let defaultLabel = String(localized: "app_components_common_label_label")
    let defaultHelperText = String(localized: "app_components_common_helperText_label")
    let defaultPlaceholderText = String(localized: "app_components_textInput_placeholder_label")
    let defaultPrefix = "$"
    let defaultSuffix = "€"
    let defaultHelperLinkText = String(localized: "app_components_textInput_helperLink_label")

    // MARK: Published properties

    @Published var layout: OUDSTextInput.Layout {
        didSet { updateCode() }
    }

    @Published var label: String {
        didSet { updateCode() }
    }

    @Published var placeholderText: String {
        didSet { updateCode() }
    }

    @Published var prefixText: String {
        didSet { updateCode() }
    }

    @Published var suffixText: String {
        didSet { updateCode() }
    }

    @Published var leadingIcon: Bool {
        didSet { updateCode() }
    }

    @Published var trailingAction: Bool {
        didSet { updateCode() }
    }

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var helperText: String {
        didSet { updateCode() }
    }

    @Published var helperLinkText: String {
        didSet { updateCode() }
    }

    @Published var rounded: Bool {
        didSet { updateCode() }
    }

    @Published var style: OUDSTextInput.Style {
        didSet { updateCode() }
    }

    @Published var status: OUDSTextInput.Status {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        label = defaultLabel
        helperText = defaultHelperText
        placeholderText = defaultPlaceholderText
        prefixText = ""
        suffixText = ""
        leadingIcon = false
        trailingAction = false
        text = ""
        helperLinkText = ""
        rounded = false
        layout = .label
        style = .default
        status = .default
    }

    deinit {}

    // MARK: Component Configuration

    var placeholder: OUDSTextInput.Placeholder? {
        if placeholderText.isEmpty, prefixText.isEmpty, suffixText.isEmpty {
            return nil
        }

        return .init(text: placeholderText, prefix: prefixText, suffix: suffixText)
    }

    // MARK: Code illustration
    override func updateCode() {
        // swiftlint:disable line_length
        code =
            """
            OUDSTextInput(\(layoutPattern)\(labelPattern)\(textPattern)\(placeholderPattern)\(leadingIconPattern)\(trailingActionPattern)\(heleprTextPattern)\(helperLinkPattern)\(stylePattern)\(statusPattern))
            \(roundedCodePattern)
            """
        // swiftlint:enable line_length
    }

    private var layoutPattern: String {
        "layout: \(layout.technicalDescription)"
    }

    private var labelPattern: String {
        label.isEmpty ? "" : ", label: \"\(label)\""
    }

    private var textPattern: String {
        ", text: $text"
    }

    private var placeholderPattern: String {
        guard let placeholder else {
            return ""
        }
        return ", placeholder: \(placeholder.technicalDescription)"
    }

    private var leadingIconPattern: String {
        leadingIcon ? ", leadingIcon: Image(decorative: \"ic_heart\")" : ""
    }

    private var trailingActionPattern: String {
        let accessibilityLabel = "app_components_button_icon_a11y".localized()
        return trailingAction ? ", trailingAction: .init(icon: Image(decorative: \"ic_heart\"), accessibilityLabel: \"\(accessibilityLabel)\") {}" : ""
    }

    private var heleprTextPattern: String {
        helperText.isEmpty ? "" : ", helperText: \"\(helperText)\""
    }

    private var helperLinkPattern: String {
        helperLinkText.isEmpty ? "" : ", helperLink: .init(text: \"\(helperLinkText)\") {}"
    }

    private var stylePattern: String {
        ", style: \(style.technicalDescription)"
    }

    private var statusPattern: String {
        ", status: \(status.technicalDescription)"
    }

    private var roundedCodePattern: String {
        rounded ? ".environment(\\.oudsRoundedTextInput, true)" : ""
    }
}

extension OUDSTextInput.Placeholder {
    private var prefixPattern: String {
        guard let prefix else {
            return ""
        }
        return ", prefix: \"\(prefix)\""
    }

    private var suffixPattern: String {
        guard let suffix else {
            return ""
        }
        return ", suffix: \"\(suffix)\""
    }

    var technicalDescription: String {
        ".init(text: \"\(text)\"\(prefixPattern)\(suffixPattern))"
    }
}

// MARK: - TextInput Configuration View

struct TextInputConfigurationView: View {

    @StateObject var configurationModel: TextInputConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                OUDSSwitchItem("app_components_common_rounded_label", isOn: $configurationModel.rounded)

                OUDSSwitchItem("app_components_textInput_leadingIcon_label", isOn: $configurationModel.leadingIcon)

                OUDSSwitchItem("app_components_textInput_trailingIcon_label", isOn: $configurationModel.trailingAction)

                OUDSChipPicker(title: "app_components_common_layout_label",
                               selection: $configurationModel.layout,
                               chips: OUDSTextInput.Layout.chips)

                OUDSChipPicker(title: "app_components_common_style_label",
                               selection: $configurationModel.style,
                               chips: OUDSTextInput.Style.chips)

                OUDSChipPicker(title: "app_components_common_status_label",
                               selection: $configurationModel.status,
                               chips: OUDSTextInput.Status.chips)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label, prompt: "app_components_common_label_label")
                    DesignToolboxTextField(text: $configurationModel.helperText, prompt: "app_components_common_helperText_label")
                    DesignToolboxTextField(text: $configurationModel.placeholderText, prompt: "app_components_textInput_placeholder_label")
                    if !configurationModel.placeholderText.isEmpty {
                        DesignToolboxTextField(text: $configurationModel.prefixText, prompt: "app_components_textInput_prefix_label")
                        DesignToolboxTextField(text: $configurationModel.suffixText, prompt: "app_components_textInput_suffix_label")
                    }

                    DesignToolboxTextField(text: $configurationModel.helperLinkText, prompt: "app_components_textInput_helperLink_label")
                }
            }
        }
    }
}

extension OUDSTextInput.Style: @retroactive CaseIterable, @retroactive CustomStringConvertible {
    public nonisolated(unsafe) static var allCases: [OUDSTextInput.Style] = [.default, .alternative]

    public var description: String {
        switch self {
        case .default:
            String(localized: "app_components_textInput_style_default_label")
        case .alternative:
            String(localized: "app_components_textInput_style_alternative_label")
        }
    }

    public var technicalDescription: String {
        ".\(description.lowercased())"
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

extension OUDSTextInput.Layout: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public nonisolated(unsafe) static let allCases: [OUDSTextInput.Layout] = [.label, .placeholder]

    public var description: String {
        switch self {
        case .label:
            String(localized: "app_components_common_label_label")
        case .placeholder:
            String(localized: "app_components_textInput_placeholder_label")
        }
    }

    public var technicalDescription: String {
        ".\(description.lowercased())"
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

extension OUDSTextInput.Status: @retroactive CaseIterable, @retroactive CustomStringConvertible {
    public nonisolated(unsafe) static var allCases: [OUDSTextInput.Status] = [.default, .error, .loading, .readOnly, .disbaled]

    public var description: String {
        switch self {
        case .default:
            String(localized: "app_common_enabled_label")
        case .error:
            String(localized: "app_components_common_error_label")
        case .loading:
            String(localized: "app_components_common_loader_label")
        case .readOnly:
            String(localized: "app_components_common_readOnly_label")
        case .disbaled:
            String(localized: "app_common_disabled_label")
        }
    }

    public var technicalDescription: String {
        ".\(description.lowercased())"
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
