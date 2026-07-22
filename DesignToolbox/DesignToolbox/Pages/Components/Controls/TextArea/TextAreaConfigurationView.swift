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

#if !os(tvOS)

import OUDSSwiftUI
import SwiftUI

// MARK: - TextArea Helper Mode

/// Describes the four helper-text display modes available in the configuration panel.
enum TextAreaHelperMode: DesignToolboxEnumLocalizedRepresentable {
    case none, plain, rich, charactersMaxCount

    var wordingKey: String {
        switch self {
        case .none:
            "app_components_common_none_tech"
        case .plain:
            "app_components_common_helperText_tech"
        case .rich:
            "app_components_common_helperRichText_tech"
        case .charactersMaxCount:
            "app_components_textArea_charactersMaxCount_tech"
        }
    }
}

// MARK: - Text Area Status

/// Describes the status available in the configuration panel, to map with `OUDSTextArea.Status`
enum TextAreaStatus: DesignToolboxEnumLocalizedRepresentable {
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

// MARK: - TextArea Configuration Model

/// The model shared between `TextAreaConfigurationView` and `TextAreaDemo`.
final class TextAreaConfigurationModel: ComponentConfiguration {

    // MARK: Stored properties

    private let defaultLabel = String(localized: "app_components_common_label_label")
    private let defaultErrorText = String(localized: "app_components_textArea_errorDescription_label")

    // MARK: Published properties

    @Published var label: String {
        didSet { updateCode() }
    }

    @Published var placeholderText: String {
        didSet { updateCode() }
    }

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var helperMode: TextAreaHelperMode {
        didSet { updateCode() }
    }

    @Published var helperText: String {
        didSet { updateCode() }
    }

    @Published var maxCharacters: Int {
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

    @Published var constrainedMaxHeight: Bool {
        didSet { updateCode() }
    }

    @Published var status: TextAreaStatus {
        didSet { updateCode() }
    }

    @Published var textMode: TextualContentMode {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        label = defaultLabel
        placeholderText = ""
        text = ""
        helperMode = .none
        helperText = ""
        maxCharacters = 180
        errorText = defaultErrorText
        helperLinkText = ""
        textMode = .raw
        isOutlined = false
        constrainedMaxWidth = false
        constrainedMaxHeight = false
        status = .enabled
        super.init()
    }

    deinit {}

    // MARK: Computed helper

    /// Returns the `OUDSTextArea.HelperText` value to pass to the component, derived from `helperMode`.
    var computedHelperText: OUDSTextArea.HelperText? {
        switch helperMode {
        case .none:
            nil
        case .plain:
            helperText.isEmpty ? nil : .plain(helperText)
        case .rich:
            helperText.isEmpty ? nil : .rich(richHelperText)
        case .charactersMaxCount:
            .charactersMaxCount(UInt16(maxCharacters))
        }
    }

    var richHelperText: AttributedString {
        do {
            return try AttributedString(markdown: helperText)
        } catch {
            return AttributedString("Supposed to be valid Markdown")
        }
    }

    // MARK: Computed status

    /// Returns the `OUDSTextArea.Status` value to pass to the component
    var computedStatus: OUDSTextArea.Status {
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

    // swiftlint:disable line_length
    override func updateCode() {
        code =
            """
            OUDSTextArea(\(labelPattern)\(textPattern)\(placeholderPattern)\(helperTextPattern)\(helperLinkPattern)\(outlinedPattern)\(constrainedMaxWidthPattern)\(constrainedMaxHeightPattern)\(statusPattern))
            """
    }

    // swiftlint:enable line_length

    private var labelPattern: String {
        "label: \"\(label)\""
    }

    private var textPattern: String {
        ", text: $text"
    }

    private var placeholderPattern: String {
        placeholderText.isEmpty ? "" : ", placeholder: \"\(placeholderText)\""
    }

    private var helperTextPattern: String {
        switch helperMode {
        case .none:
            ""
        case .plain:
            helperText.isEmpty ? "" : ", helperText: .plain(\"\(helperText)\")"
        case .rich:
            helperText.isEmpty ? "" : ", helperText: .rich(yourAttributedString)"
        case .charactersMaxCount:
            ", helperText: .charactersMaxCount(\(maxCharacters))"
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

    private var constrainedMaxHeightPattern: String {
        constrainedMaxHeight ? ", constrainedMaxHeight: true" : ""
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

// MARK: - TextArea Configuration View

struct TextAreaConfigurationView: View {

    @StateObject var configurationModel: TextAreaConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                OUDSSwitchItem("app_components_common_outlined_tech", isOn: $configurationModel.isOutlined)

                OUDSSwitchItem("app_components_common_constrainedMaxWidth_tech", isOn: $configurationModel.constrainedMaxWidth)

                OUDSSwitchItem("app_components_common_constrainedMaxHeight_tech", isOn: $configurationModel.constrainedMaxHeight)

                OUDSChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.status,
                               chips: TextAreaStatus.chips)

                OUDSChipPicker(title: "app_components_common_helperText_tech",
                               selection: $configurationModel.helperMode,
                               chips: TextAreaHelperMode.chips)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_tech")

                    switch configurationModel.status {
                    case .error, .richError:
                        DesignToolboxTextField(text: $configurationModel.errorText, label: "app_components_textArea_errorDescription_label")
                    default:
                        switch configurationModel.helperMode {
                        case .plain, .rich:
                            DesignToolboxTextField(text: $configurationModel.helperText, label: "app_components_common_helperText_tech")
                        case .charactersMaxCount:
                            Stepper(value: $configurationModel.maxCharacters, in: 10 ... 500, step: 10) {
                                HStack {
                                    Text(LocalizedStringKey("app_components_textArea_maxCharacters_tech"))
                                        .labelStrongMedium(theme)
                                        .foregroundColor(theme.colors.contentDefault)
                                    Spacer()
                                    Text(String(configurationModel.maxCharacters))
                                        .labelStrongMedium(theme)
                                        .foregroundColor(theme.colors.contentDefault)
                                }
                            }
                            .padding(.horizontal, theme.spaces.fixedMedium)
                        case .none:
                            EmptyView()
                        }
                    }

                    DesignToolboxTextField(text: $configurationModel.placeholderText, label: "app_components_common_placeholder_tech")
                    DesignToolboxTextField(text: $configurationModel.helperLinkText, label: "app_components_textArea_helperLink_tech")
                }
            }
        }
    }
}

#endif
