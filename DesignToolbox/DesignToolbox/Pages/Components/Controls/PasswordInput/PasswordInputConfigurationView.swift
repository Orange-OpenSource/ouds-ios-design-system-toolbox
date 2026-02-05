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

// MARK: - PasswordInput Configuration Model

/// The model shared between `PasswordInputPageConfiguration` view and `PasswordInputPageComponent` view.
final class PasswordInputConfigurationModel: ComponentConfiguration {

    // MARK: Stored properties

    private let defaultLabel = String(localized: "app_components_common_label_label")
    private let defaultHelperText = String(localized: "app_components_common_helperText_label")
    private let defaultPlaceholderText = String(localized: "app_components_common_placeholder_label")
    private let defaultErrorText = String(localized: "app_components_common_errorMessage_label")

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
        didSet {
            status = .error(message: errorText)
            updateCode()
        }
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

    @Published var isHiddenPassword: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        label = defaultLabel
        helperText = defaultHelperText
        errorText = defaultErrorText
        placeholderText = defaultPlaceholderText
        prefixText = ""
        lockIcon = false
        text = ""
        isOutlined = false
        constrainedMaxWidth = false
        status = .enabled
        isHiddenPassword = true
        super.init()
    }

    deinit {}

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
        status != .enabled ? ", status: \(status.technicalDescription)" : ""
    }
}

// MARK: - PasswordInput Configuration View

struct PasswordInputConfigurationView: View {

    @StateObject var configurationModel: PasswordInputConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_components_passwordInput_hiddenPassword__label", isOn: $configurationModel.isHiddenPassword)

                OUDSSwitchItem("app_components_common_outlined_label", isOn: $configurationModel.isOutlined)

                OUDSSwitchItem("app_components_common_constrainedMaxWidth_label", isOn: $configurationModel.constrainedMaxWidth)

                OUDSSwitchItem("app_components_passwordInput_lockIcon_label", isOn: $configurationModel.lockIcon)

                OUDSChipPicker(title: "app_components_common_status_label",
                               selection: $configurationModel.status,
                               chips: OUDSTextInput.Status.chips)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_label")

                    switch configurationModel.status {
                    case .error:
                        DesignToolboxTextField(text: $configurationModel.errorText, label: "app_components_textInput_errorDescription_label")
                    default:
                        DesignToolboxTextField(text: $configurationModel.helperText, label: "app_components_common_helperText_label")
                    }

                    DesignToolboxTextField(text: $configurationModel.placeholderText, label: "app_components_common_placeholder_label")
                    DesignToolboxTextField(text: $configurationModel.prefixText, label: "app_components_common_prefix_label")
                }
            }
        }
    }
}
