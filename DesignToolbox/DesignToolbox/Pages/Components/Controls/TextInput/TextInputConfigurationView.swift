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
import SwiftUI

// MARK: - TextInput Configuration Model

/// The model shared between `TextInputPageConfiguration` view and `TextInputPageComponent` view.
final class TextInputConfigurationModel: ComponentConfiguration {

    // MARK: Stored properties

    private let defaultLabel = String(localized: "app_components_common_label_label")
    private let defaultErrorText = String(localized: "app_components_common_errorMessage_tech")

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

    @Published var flipTrailingActionIcon: Bool {
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

    @Published var constrainedMaxWidth: Bool {
        didSet { updateCode() }
    }

    @Published var status: OUDSTextInput.Status {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        label = defaultLabel
        helperText = ""
        errorText = defaultErrorText
        placeholderText = ""
        prefixText = ""
        suffixText = ""
        leadingIcon = false
        flipLeadingIcon = false
        trailingAction = false
        flipTrailingActionIcon = false
        text = ""
        helperLinkText = ""
        isOutlined = false
        constrainedMaxWidth = false
        status = .enabled
        super.init()
    }

    deinit {}

    // MARK: Code illustration

    override func updateCode() {
        // swiftlint:disable line_length
        code =
            """
            OUDSTextInput(\(labelPattern)\(textPattern)\(placeholderPattern)\(prefixPattern)\(suffixPattern)\(leadingIconPattern)\(flipLeadingIconPattern)\(trailingActionPattern)\(helperTextPattern)\(helperLinkPattern)\(outlinedPattern)\(constrainedMaxWidthPattern)\(statusPattern))
            """
        // swiftlint:enable line_length
    }

    private var labelPattern: String {
        "label: \"\(label)\""
    }

    private var textPattern: String {
        ", text: $text"
    }

    private var prefixPattern: String {
        prefixText.isEmpty ? "" : ", prefix: \"\(prefixText)\""
    }

    private var suffixPattern: String {
        suffixText.isEmpty ? "" : ", suffix: \"\(suffixText)\""
    }

    private var placeholderPattern: String {
        placeholderText.isEmpty ? "" : ", placeholder: \"\(placeholderText)\""
    }

    private var leadingIconPattern: String {
        leadingIcon ? ", leadingIcon: \(Image.defaultImageSample())" : ""
    }

    private var flipLeadingIconPattern: String {
        flipLeadingIcon ? ", flipLeadingIcon: true" : ""
    }

    private var trailingActionPattern: String {
        let accessibilityLabel = "app_components_common_icon_a11y".localized()
        let flipIconPattern = flipTrailingActionIcon ? ", flipIcon: true" : ""
        return trailingAction ? ", trailingAction: .init(icon: \(Image.defaultImageSample())\(flipIconPattern), actionHint: \"\(accessibilityLabel)\") {}" : ""
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

    private var constrainedMaxWidthPattern: String {
        constrainedMaxWidth ? ", constrainedMaxWidth: true" : ""
    }

    private var statusPattern: String {
        status != .enabled ? ", status: \(status.technicalDescription)" : ""
    }
}

// MARK: - TextInput Configuration View

struct TextInputConfigurationView: View {

    @StateObject var configurationModel: TextInputConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_components_common_outlined_tech", isOn: $configurationModel.isOutlined)

                OUDSSwitchItem("app_components_common_constrainedMaxWidth_tech", isOn: $configurationModel.constrainedMaxWidth)

                OUDSSwitchItem("app_components_textInput_leadingIcon_tech", isOn: $configurationModel.leadingIcon)

                OUDSSwitchItem("app_components_textInput_flipLeadingIcon_tech", isOn: $configurationModel.flipLeadingIcon)
                    .disabled(!configurationModel.leadingIcon)

                OUDSSwitchItem("app_components_textInput_trailingAction_tech", isOn: $configurationModel.trailingAction)

                OUDSSwitchItem("app_components_textInput_flipTrailingActionIcon_tech", isOn: $configurationModel.flipTrailingActionIcon)
                    .disabled(!configurationModel.trailingAction)

                OUDSChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.status,
                               chips: OUDSTextInput.Status.chips)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_tech")

                    switch configurationModel.status {
                    case .error:
                        DesignToolboxTextField(text: $configurationModel.errorText, label: "app_components_textInput_errorDescription_label")
                    default:
                        DesignToolboxTextField(text: $configurationModel.helperText, label: "app_components_common_helperText_tech")
                    }

                    DesignToolboxTextField(text: $configurationModel.placeholderText, label: "app_components_common_placeholder_tech")
                    DesignToolboxTextField(text: $configurationModel.prefixText, label: "app_components_common_prefix_tech")
                    DesignToolboxTextField(text: $configurationModel.suffixText, label: "app_components_textInput_suffix_tech")
                    DesignToolboxTextField(text: $configurationModel.helperLinkText, label: "app_components_textInput_helperLink_tech")
                }
            }
        }
    }
}

extension OUDSTextInput.Status: @retroactive CaseIterable, @retroactive CustomStringConvertible, @retroactive Hashable {

    nonisolated(unsafe) public static var allCases: [OUDSTextInput.Status] =
        [.enabled, .error(message: "app_components_textInput_errorDescription_label".localized()), .loading, .readOnly, .disabled]

    public var description: String {
        switch self {
        case .enabled:
            String(localized: "app_common_enabled_tech")
        case .error:
            String(localized: "app_components_common_error_tech")
        case .loading:
            String(localized: "app_components_common_loader_tech")
        case .readOnly:
            String(localized: "app_components_common_readOnly_tech")
        case .disabled:
            String(localized: "app_common_disabled_tech")
        }
    }

    public var technicalDescription: String {
        if self == .readOnly {
            return ".readOnly"
        }
        if case let .error(message) = self {
            return ".error(message: \"\(message)\")"
        } else {
            return ".\(description.lowercased())"
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
