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

// swiftlint:disable type_name

// MARK: - Checkbox Item Indeterminate Configuration Model

/// The model shared between `CheckboxItemIndeterminateConfiguration` view and `CheckboxItemIndeterminatePage` view.
/// Related to `OUDSCheckboxItemIndeterminate` (i.e. with 3 available values).
final class CheckboxItemIndeterminateConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var indicatorState: OUDSCheckboxIndicatorState {
        didSet { updateCode() }
    }

    @Published var icon: Bool {
        didSet { updateCode() }
    }

    @Published var flipIcon: Bool {
        didSet { updateCode() }
    }

    @Published var isError: Bool {
        didSet { updateCode() }
    }

    @Published var isReadOnly: Bool {
        didSet { updateCode() }
    }

    @Published var divider: Bool {
        didSet { updateCode() }
    }

    @Published var isReversed: Bool {
        didSet { updateCode() }
    }

    @Published var labelText: String {
        didSet { updateCode() }
    }

    @Published var helperText: String {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        indicatorState = .selected
        isError = false
        isReadOnly = false
        enabled = true
        icon = true
        flipIcon = false
        isReversed = false
        divider = false
        labelText = String(localized: "app_components_common_label_label")
        helperText = String(localized: "app_components_controlItem_helperText_label")
    }

    deinit {}

    // MARK: Component Configuration

    // swiftlint:disable line_length
    override func updateCode() {
        code =
            """
            OUDSCheckboxItemIndeterminate(selection: $selection, label: \"\(labelText)\"\(helperTextPattern)\(iconPattern)\(flipIconPattern)\(isReversedPattern)\(isErrorPattern)\(isReadOnlyPattern)\(dividerPattern))
            \(disableCode)
            """
    }

    // swiftlint:enable line_length

    private var disableCode: String {
        ".disabled(\(enabled ? "false" : "true"))"
    }

    private var helperTextPattern: String {
        helperText.isEmpty ? "" : ", helper: \"\(helperText)\""
    }

    private var iconPattern: String {
        icon ? ", icon: Image(systemName: \"figure.handball\")" : ""
    }

    private var flipIconPattern: String {
        flipIcon ? ", flipIcon: true" : ""
    }

    private var isReversedPattern: String {
        ", isReversed: \(isReversed)"
    }

    private var isErrorPattern: String {
        isError ? ", isError: true" : ""
    }

    private var isReadOnlyPattern: String {
        isReadOnly ? ", isReadOnly: true" : ""
    }

    private var dividerPattern: String {
        divider ? ", divider: true" : ""
    }
}

// MARK: - Checkbox Item Indeterminate Configuration View

struct CheckboxItemIndeterminateConfiguration: View {

    @ObservedObject var model: CheckboxItemIndeterminateConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMedium) {

            DesignToolboxChoicePicker(title: "app_components_checkbox_selection_label",
                                      selection: $model.indicatorState,
                                      style: .segmented)
            {
                ForEach(OUDSCheckboxIndicatorState.allCases, id: \.id) { state in
                    Text(LocalizedStringKey(state.description)).tag(state)
                }
            }

            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                OUDSSwitchItem("app_components_controlItem_icon_label", isOn: $model.icon)

                OUDSSwitchItem("app_components_controlItem_flipIcon_label", isOn: $model.flipIcon)
                    .disabled(!model.icon)

                OUDSSwitchItem("app_components_controlItem_divider_label", isOn: $model.divider)

                OUDSSwitchItem("app_components_controlItem_reversed_label", isOn: $model.isReversed)

                OUDSSwitchItem("app_common_enabled_label", isOn: $model.enabled)
                    .disabled(model.isError || model.isReadOnly)

                OUDSSwitchItem("app_components_controlItem_readOnly_label", isOn: $model.isReadOnly)
                    .disabled(!model.enabled || model.isError)

                OUDSSwitchItem("app_components_common_error_label", isOn: $model.isError)
                    .disabled(!model.enabled || model.isReadOnly)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $model.labelText)
                DesignToolboxTextField(text: $model.helperText)
            }
        }
    }
}

// swiftlint:enable type_name
