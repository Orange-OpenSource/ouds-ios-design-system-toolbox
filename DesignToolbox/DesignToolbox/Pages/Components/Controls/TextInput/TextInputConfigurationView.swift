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

    private let defaultLabel = String(localized: "app_components_common_label_label")
    private let defaultHelperText = String(localized: "app_components_common_helperText_label")
    private let defaultPlaceholderText = String(localized: "app_components_textInput_placeholder_label")
    private let defaultPrefix = "$"
    private let defaultSuffix = "€"
    private let defaultHelperLinkText = String(localized: "app_components_textInput_helperLink_label")
    private let defaultErrorText = String(localized: "app_components_common_errorText_label")

    // MARK: Published properties

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

    @Published var flipLeadingIcon: Bool {
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
    
    @Published var errorText: String {
        didSet {
            status = .error(message: errorText)
            updateCode()
        }
    }

    @Published var helperLinkText: String {
        didSet { updateCode() }
    }

    @Published var isOutlined: Bool {
        didSet { updateCode() }
    }

    @Published var status: OUDSTextInput.Status {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        label = defaultLabel
        helperText = defaultHelperText
        errorText = defaultErrorText
        placeholderText = defaultPlaceholderText
        prefixText = ""
        suffixText = ""
        leadingIcon = false
        flipLeadingIcon = false
        trailingAction = false
        text = ""
        helperLinkText = ""
        isOutlined = false
        status = .enabled
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
            OUDSTextInput(\(labelPattern)\(textPattern)\(placeholderPattern)\(leadingIconPattern)\(flipLeadingIconPattern)\(trailingActionPattern)\(helperTextPattern)\(helperLinkPattern)\(outlinedPattern)\(statusPattern))
            """
        // swiftlint:enable line_length
    }

    private var labelPattern: String {
        "label: \"\(label)\""
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
        leadingIcon ? ", leadingIcon: Image(systemName: \"figure.handball\")" : ""
    }

    private var flipLeadingIconPattern: String {
        flipLeadingIcon ? ", flipLeadingIcon: true" : ""
    }

    private var trailingActionPattern: String {
        let accessibilityLabel = "app_components_common_icon_a11y".localized()
        return trailingAction ? ", trailingAction: .init(icon: Image(decorative: \"ic_heart\"), actionHint: \"\(accessibilityLabel)\") {}" : ""
    }

    private var helperTextPattern: String {
        helperText.isEmpty ? "" : ", helperText: \"\(helperText)\""
    }

    private var helperLinkPattern: String {
        helperLinkText.isEmpty ? "" : ", helperLink: .init(text: \"\(helperLinkText)\") {}"
    }

    private var outlinedPattern: String {
        isOutlined ? ", isOutlined: true" : ""
    }

    private var statusPattern: String {
        status != .enabled ? ", status: \(status.technicalDescription)" : ""
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
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                OUDSSwitchItem("app_components_common_outlined_label", isOn: $configurationModel.isOutlined)

                OUDSSwitchItem("app_components_textInput_leadingIcon_label", isOn: $configurationModel.leadingIcon)

                OUDSSwitchItem("app_components_textInput_flipLeadingIcon_label", isOn: $configurationModel.flipLeadingIcon)
                    .disabled(!configurationModel.leadingIcon)

                OUDSSwitchItem("app_components_textInput_trailingIcon_label", isOn: $configurationModel.trailingAction)

                OUDSChipPicker(title: "app_components_common_status_label",
                               selection: $configurationModel.status,
                               chips: OUDSTextInput.Status.chips)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label, prompt: "app_components_common_label_label")
                    
                    switch configurationModel.status {
                    case .error:
                        DesignToolboxTextField(text: $configurationModel.errorText, prompt: "app_components_textInput_errorDescription_label")
                    default:
                        DesignToolboxTextField(text: $configurationModel.helperText, prompt: "app_components_common_helperText_label")
                    }
                    
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

extension OUDSTextInput.Status: @retroactive CaseIterable, @retroactive CustomStringConvertible, @retroactive Hashable {
    
    public nonisolated(unsafe) static var allCases: [OUDSTextInput.Status] = [.enabled, .error(message: "app_components_textInput_errorDescription_label".localized()), .loading, .readOnly, .disabled]

    public var description: String {
        switch self {
        case .enabled:
            String(localized: "app_common_enabled_label")
        case .error:
            String(localized: "app_components_common_error_label")
        case .loading:
            String(localized: "app_components_common_loader_label")
        case .readOnly:
            String(localized: "app_components_common_readOnly_label")
        case .disabled:
            String(localized: "app_common_disabled_label")
        }
    }

    public var technicalDescription: String {
        if self == .readOnly {
            ".readOnly"
        } else {
            ".\(description.lowercased())"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
}
