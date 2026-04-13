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

// MARK: - TextArea Helper Mode

/// Describes the three helper-text display modes available in the configuration panel.
enum TextAreaHelperMode: CaseIterable, CustomStringConvertible, Hashable {
    case none
    case plain
    case charactersMaxCount

    var description: String {
        switch self {
        case .none:
            String(localized: "app_components_common_none_tech")
        case .plain:
            String(localized: "app_components_common_helperText_tech")
        case .charactersMaxCount:
            String(localized: "app_components_textArea_charactersMaxCount_tech")
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
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

    @Published var status: OUDSTextArea.Status {
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
        isOutlined = false
        constrainedMaxWidth = false
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
        case .charactersMaxCount:
            .charactersMaxCount(UInt16(maxCharacters))
        }
    }

    // MARK: Code illustration

    override func updateCode() {
        code =
            """
            OUDSTextArea(\(labelPattern)\(textPattern)\(placeholderPattern)\(helperTextPattern)\(helperLinkPattern)\(outlinedPattern)\(constrainedMaxWidthPattern)\(statusPattern))
            """
    }

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

    private var statusPattern: String {
        status != .enabled ? ", status: \(status.technicalDescription)" : ""
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

                OUDSChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.status,
                               chips: OUDSTextArea.Status.chips)

                OUDSChipPicker(title: "app_components_common_helperText_tech",
                               selection: $configurationModel.helperMode,
                               chips: TextAreaHelperMode.chips)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_tech")

                    switch configurationModel.status {
                    case .error:
                        DesignToolboxTextField(text: $configurationModel.errorText, label: "app_components_textArea_errorDescription_label")
                    default:
                        switch configurationModel.helperMode {
                        case .plain:
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

// MARK: - OUDSTextArea.Status conformances

extension OUDSTextArea.Status: @retroactive CaseIterable, @retroactive CustomStringConvertible, @retroactive Hashable {

    public static let allCases: [OUDSTextArea.Status] =
        [.enabled, .error(message: "app_components_textArea_errorDescription_label".localized()), .loading, .readOnly, .disabled]

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
