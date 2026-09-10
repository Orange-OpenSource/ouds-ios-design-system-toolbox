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

// MARK: - Password Input Configuration Model

/// The model shared between `PasswordInputPageConfiguration` view and `PasswordInputPageComponent` view.
final class PasswordInputConfigurationModel: ComponentConfiguration {

    // MARK: Stored properties

    private static let defaultLabel = String(localized: "app_components_passwordInput_password_tech")
    private static let defaultHelperText = String(localized: "app_components_passwordInputHelperText_label")
    private static let defaultErrorText = String(localized: "app_components_common_errorMessage_tech")

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

    @Published var lockIcon: Bool {
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

    @Published var isOutlined: Bool {
        didSet { updateCode() }
    }

    @Published var constrainedMaxWidth: Bool {
        didSet { updateCode() }
    }

    @Published var status: TextInputStatus {
        didSet { updateCode() }
    }

    @Published var isHiddenPassword: Bool {
        didSet { updateCode() }
    }

    @Published var textMode: TextualContentMode {
        didSet { updateCode() }
    }

    @Published var progressVariant: CircularProgressIndicatorConfigurationModel.Variant {
        didSet { updateCode() }
    }

    @Published var progressValue: Double {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        label = Self.defaultLabel
        helperText = Self.defaultHelperText
        errorText = Self.defaultErrorText
        placeholderText = ""
        prefixText = ""
        lockIcon = false
        text = ""
        isOutlined = false
        constrainedMaxWidth = false
        status = .enabled
        isHiddenPassword = true
        textMode = .raw

        progressVariant = .indeterminate
        progressValue = 0.0

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
            .loading(progress: progressVariant == .indeterminate ? nil : progressValue)
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
            OUDSPasswordInput(\(labelPattern)\(passwordPattern)\(isHiddenPasswordPattern)\(placeholderPattern)\(prefixPattern)\(lockIconPattern)\(helperTextPattern)\(outlinedPattern)\(constrainedMaxWidthPattern)\(statusPattern))
            """
        // swiftlint:enable line_length
    }

    private var labelPattern: String {
        "label: \"\(label)\""
    }

    private var passwordPattern: String {
        ", password: $password"
    }

    private var isHiddenPasswordPattern: String {
        !isHiddenPassword ? ", isHiddenPassword: false" : ""
    }

    private var prefixPattern: String {
        prefixText.isEmpty ? "" : ", prefix: \"\(prefixText)\""
    }

    private var placeholderPattern: String {
        placeholderText.isEmpty ? "" : ", placeholder: \"\(placeholderText)\""
    }

    private var lockIconPattern: String {
        lockIcon ? ", lockIcon: true" : ""
    }

    private var helperTextPattern: String {
        helperText.isEmpty ? "" : ", helperText: \"\(helperText)\""
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
            if progressVariant == .indeterminate {
                ", status: .loading"
            } else {
                ", status: .loading(progress: \(String(format: "%.2f", progressValue)))"
            }
        case .readOnly:
            ", status: .readOnly"
        case .disabled:
            ", status: .disabled"
        }
    }
}

// MARK: - Password Input Configuration View

struct PasswordInputConfigurationView: View {

    @StateObject var configurationModel: PasswordInputConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_components_passwordInput_passwordHidden_tech", isOn: $configurationModel.isHiddenPassword)

                OUDSSwitchItem("app_components_common_outlined_tech", isOn: $configurationModel.isOutlined)

                OUDSSwitchItem("app_components_common_constrainedMaxWidth_tech", isOn: $configurationModel.constrainedMaxWidth)

                OUDSSwitchItem("app_components_passwordInput_lockIcon_tech", isOn: $configurationModel.lockIcon)

                OUDSChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.status,
                               chips: TextInputStatus.chips)

                if configurationModel.status == .loading {
                    OUDSChipPicker(title: "app_components_progressIndicator_variant_tech",
                                   selection: $configurationModel.progressVariant,
                                   chips: CircularProgressIndicatorConfigurationModel.Variant.chips)

                    if configurationModel.progressVariant == .determinate {
                        DesignToolboxProgressControl(progress: $configurationModel.progressValue)
                    }
                }

                if configurationModel.status != .error, configurationModel.status != .richError {
                    OUDSChipPicker(title: "app_components_textMode_tech",
                                   selection: $configurationModel.textMode,
                                   chips: TextualContentMode.chips)
                }

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_tech")

                    switch configurationModel.status {
                    case .error, .richError:
                        DesignToolboxTextField(text: $configurationModel.errorText, label: "app_components_textInput_errorDescription_label")
                    default:
                        DesignToolboxTextField(text: $configurationModel.helperText, label: "app_components_common_helperText_tech")
                    }

                    DesignToolboxTextField(text: $configurationModel.placeholderText, label: "app_components_common_placeholder_tech")
                    DesignToolboxTextField(text: $configurationModel.prefixText, label: "app_components_common_prefix_tech")
                }
            }
        }
    }
}

#endif
