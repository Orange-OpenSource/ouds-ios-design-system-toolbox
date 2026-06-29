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

// MARK: - Text Input Status

/// Describes the status available in the configuration panel, to map with `OUDSTextInput.Status`
enum TextInputStatus: DesignToolboxEnumLocalizedRepresentable {
    case enabled, error, richError, loading, readOnly, disabled

    var wordingKey: String {
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
}

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

    @Published var leadingIconType: DefinedStatusIcons {
        didSet { updateCode() }
    }

    @Published var flipLeadingIcon: Bool {
        didSet { updateCode() }
    }

    @Published var trailingAction: Bool {
        didSet { updateCode() }
    }

    @Published var trailingActionIconType: DefinedStatusIcons {
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
        didSet { updateCode() }
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

    @Published var status: TextInputStatus {
        didSet { updateCode() }
    }

    @Published var textMode: TextualContentMode {
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
        leadingIconType = .tintedIcon
        flipLeadingIcon = false
        trailingAction = false
        trailingActionIconType = .tintedIcon
        flipTrailingActionIcon = false
        text = ""
        helperLinkText = ""
        isOutlined = false
        constrainedMaxWidth = false
        status = .enabled
        textMode = .raw
        super.init()
    }

    deinit {}

    // MARK: Computed status

    var richHelperText: AttributedString {
        do {
            return try AttributedString(markdown: helperText)
        } catch {
            return AttributedString("Supposed to be valid Markdown")
        }
    }

    /// Returns the `OUDSTextInput.Status` value to pass to the component
    var computedStatus: OUDSTextInput.Status {
        switch status {
        case .enabled:
            .enabled
        case .error:
            .error(message: errorText)
        case .richError:
            .richError(message: richErrorText)
        case .loading:
            .loading
        case .readOnly:
            .readOnly
        case .disabled:
            .disabled
        }
    }

    var richErrorText: AttributedString {
        do {
            return try AttributedString(markdown: errorText)
        } catch {
            return AttributedString("Supposed to be valid Markdown")
        }
    }

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

    private var leadingIconAssetSample: String {
        leadingIconType == .tintedIcon ? Image.defaultImageSample() : "Image(decorative: \"il_placeholder\")"
    }

    private var leadingIconRenderingModeCode: String {
        leadingIconType == .image ? ", leadingIconRenderingMode: .original" : ""
    }

    private var leadingIconPattern: String {
        leadingIcon ? ", leadingIcon: \(leadingIconAssetSample)\(leadingIconRenderingModeCode)" : ""
    }

    private var flipLeadingIconPattern: String {
        flipLeadingIcon ? ", flipLeadingIcon: true" : ""
    }

    private var trailingActionAssetSample: String {
        trailingActionIconType == .tintedIcon ? Image.defaultImageSample() : "Image(decorative: \"il_placeholder\")"
    }

    private var trailingActionRenderingModeCode: String {
        trailingActionIconType == .image ? ", renderingMode: .original" : ""
    }

    private var trailingActionPattern: String {
        let accessibilityLabel = "app_components_common_icon_a11y".localized()
        let flipIconPattern = flipTrailingActionIcon ? ", flipIcon: true" : ""
        return trailingAction
            ? ", trailingAction: .init(icon: \(trailingActionAssetSample)\(flipIconPattern), actionHint: \"\(accessibilityLabel)\"\(trailingActionRenderingModeCode)) {}"
            : ""
    }

    private var helperTextPattern: String {
        if helperText.isEmpty {
            ""
        } else if textMode == .rich {
            ", helperText: yourAttributedString"
        } else {
            ", helperText: \"\(helperText)\""
        }
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
        switch status {
        case .enabled:
            ""
        case .error:
            ", status: .error(message: \"\(errorText)\")"
        case .richError:
            ", status: .richError(message: yourAttributedString)"
        case .loading:
            ", status: .loading"
        case .readOnly:
            ", status: .readOnly"
        case .disabled:
            ", status: .disabled"
        }
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

                if configurationModel.leadingIcon {
                    OUDSChipPicker(title: "app_components_textInput_leadingIcon_tech",
                                   selection: $configurationModel.leadingIconType,
                                   chips: DefinedStatusIcons.chips)
                }

                OUDSSwitchItem("app_components_textInput_flipLeadingIcon_tech", isOn: $configurationModel.flipLeadingIcon)
                    .disabled(!configurationModel.leadingIcon)

                OUDSSwitchItem("app_components_textInput_trailingAction_tech", isOn: $configurationModel.trailingAction)

                if configurationModel.trailingAction {
                    OUDSChipPicker(title: "app_components_textInput_trailingIcon_tech",
                                   selection: $configurationModel.trailingActionIconType,
                                   chips: DefinedStatusIcons.chips)
                }

                OUDSSwitchItem("app_components_textInput_flipTrailingActionIcon_tech", isOn: $configurationModel.flipTrailingActionIcon)
                    .disabled(!configurationModel.trailingAction)

                OUDSChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.status,
                               chips: TextInputStatus.chips)

                if configurationModel.status != .error, configurationModel.status != .richError {
                    OUDSChipPicker(title: "app_components_textMode_tech",
                                   selection: $configurationModel.textMode,
                                   chips: TextualContentMode.chips)
                }

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_tech")

                    switch configurationModel.status {
                    case .error, .richError:
                        DesignToolboxTextField(text: $configurationModel.errorText, label: "app_components_common_errorMessage_tech")
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
