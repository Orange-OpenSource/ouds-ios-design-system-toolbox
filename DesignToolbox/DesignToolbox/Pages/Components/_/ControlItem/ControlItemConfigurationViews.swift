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

// MARK: - ControlItem Element Page

struct ControlItemElementPage<Demo>: View where Demo: View {

    // MARK: Stored properties

    @StateObject private var configurationModel: ControlItemConfigurationModel
    @ViewBuilder private var demo: () -> Demo

    // MARK: Initializer

    init(configurationModel: ControlItemConfigurationModel, demo: @escaping () -> Demo) {
        _configurationModel = StateObject(wrappedValue: configurationModel)
        self.demo = demo
    }

    // MARK: Body

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel, componentView: demo) {
            ControlItemConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - ControlItem Configuration View

private struct ControlItemConfiguration: View {

    // MARK: Stored properties

    @ObservedObject var configurationModel: ControlItemConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                selection
                    .disabled(configurationModel.isError || configurationModel.isReadOnly)

                OUDSSwitchItem("app_components_controlItem_icon_tech", isOn: $configurationModel.icon)

                OUDSSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                    .disabled(!configurationModel.icon || configurationModel.isError)

                if let outlinedConfiguration = configurationModel.outlinedConfiguration {
                    OUDSSwitchItem(outlinedConfiguration.outlinedConfigurationLabel, isOn: $configurationModel.outlined)
                }

                OUDSSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)

                OUDSSwitchItem("app_components_common_constrainedMaxWidth_tech", isOn: $configurationModel.constrainedMaxWidth)

                OUDSSwitchItem("app_components_controlItem_reversed_tech", isOn: $configurationModel.isReversed)

                OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)
                    .disabled(configurationModel.isError || configurationModel.isReadOnly)

                OUDSSwitchItem("app_components_common_readOnly_tech", isOn: $configurationModel.isReadOnly)
                    .disabled(!configurationModel.enabled || configurationModel.isError)

                OUDSSwitchItem("app_components_common_error_tech", isOn: $configurationModel.isError)
                    .disabled(!configurationModel.enabled || configurationModel.isReadOnly)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.labelText, label: "app_components_common_label_tech")

                if configurationModel.extraLabelConfiguration != nil {
                    DesignToolboxTextField(text: $configurationModel.extraLabelText, label: "app_components_radioButton_radioButtonItem_extraLabel_tech")
                }

                DesignToolboxTextField(text: $configurationModel.descriptionText, label: "app_components_common_description_tech")

                if configurationModel.isError {
                    DesignToolboxTextField(text: $configurationModel.errorText, label: "app_components_common_errorMessage_tech")
                }
            }
        }
    }

    @ViewBuilder
    private var selection: some View {
        if let booleanModel = configurationModel as? BooleanControlItemConfigurationModel {
            BooleanSelectionView(model: booleanModel)
        }

        if let indeterminateModel = configurationModel as? IndicatorControlItemConfigurationModel {
            IndeterminateSelectionView(model: indeterminateModel)
        }
    }
}

// MARK: - Boolean Selection

private struct BooleanSelectionView: View {

    @ObservedObject var model: BooleanControlItemConfigurationModel

    var body: some View {
        OUDSSwitchItem("app_components_common_selection_tech", isOn: $model.isOn)
            .accessibilityIdentifier(A11YIdentifiers.configurationSwitchSelection)
    }
}

// MARK: - Indeterminate Selection

private struct IndeterminateSelectionView: View {

    @ObservedObject var model: IndicatorControlItemConfigurationModel

    var body: some View {
        OUDSChipPicker(title: "app_components_common_selection_tech",
                       selection: $model.selection,
                       chips: OUDSCheckboxIndicatorState.chips)
    }
}
