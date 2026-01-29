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

    @Published var leadingIcon: Bool {
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

    @Published var status: OUDSPasswordInput.Status {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        label = defaultLabel
        helperText = defaultHelperText
        errorText = defaultErrorText
        placeholderText = defaultPlaceholderText
        prefixText = ""
        leadingIcon = false
        text = ""
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
            OUDSPasswordInput(\(labelPattern)\(textPattern)\(placeholderPattern)\(prefixPattern)\(leadingIconPattern)\(helperTextPattern)\(outlinedPattern)\(constrainedMaxWidthPattern)\(statusPattern))
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

    private var placeholderPattern: String {
        placeholderText.isEmpty ? "" : ", placeholder: \"\(placeholderText)\""
    }

    private var leadingIconPattern: String {
        leadingIcon ? ", hasLeadingIcon: true" : ""
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
                OUDSSwitchItem("app_components_common_outlined_label", isOn: $configurationModel.isOutlined)

                OUDSSwitchItem("app_components_common_constrainedMaxWidth_label", isOn: $configurationModel.constrainedMaxWidth)

                OUDSSwitchItem("app_components_common_leadingIcon_label", isOn: $configurationModel.leadingIcon)

                OUDSChipPicker(title: "app_components_common_status_label",
                               selection: $configurationModel.status,
                               chips: OUDSPasswordInput.Status.chips)

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

extension OUDSPasswordInput.Status: @retroactive CaseIterable, @retroactive CustomStringConvertible, @retroactive Hashable {

    nonisolated(unsafe) public static var allCases: [OUDSPasswordInput.Status] =
        [.enabled, .error(message: "app_components_textInput_errorDescription_label".localized()), .loading, .readOnly, .disabled]

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
