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
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
                selection
                    .disabled(configurationModel.isError || configurationModel.isReadOnly)

                OUDSSwitchItem("app_components_controlItem_icon_label", isOn: $configurationModel.icon)

                OUDSSwitchItem("app_components_controlItem_flipIcon_label", isOn: $configurationModel.flipIcon)
                    .disabled(!configurationModel.icon)

                if let outlinedConfiguration = configurationModel.outlinedConfiguration {
                    OUDSSwitchItem(outlinedConfiguration.outlinedConfigurationLabel, isOn: $configurationModel.outlined)
                }

                OUDSSwitchItem("app_components_controlItem_divider_label", isOn: $configurationModel.divider)

                OUDSSwitchItem("app_components_controlItem_reversed_label", isOn: $configurationModel.isReversed)

                OUDSSwitchItem("app_common_enabled_label", isOn: $configurationModel.enabled)
                    .disabled(configurationModel.isError || configurationModel.isReadOnly)

                OUDSSwitchItem("app_components_common_readOnly_label", isOn: $configurationModel.isReadOnly)
                    .disabled(!configurationModel.enabled || configurationModel.isError)

                OUDSSwitchItem("app_components_common_error_label", isOn: $configurationModel.isError)
                    .disabled(!configurationModel.enabled || configurationModel.isReadOnly)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.labelText)
                if configurationModel.additionalLabelConfiguration != nil {
                    DesignToolboxTextField(text: $configurationModel.additionalLabelText)
                }
                DesignToolboxTextField(text: $configurationModel.helperText)
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
        OUDSSwitchItem("app_components_common_selection_label", isOn: $model.isOn)
            .accessibilityIdentifier(A11YIdentifiers.configurationSwitchSelection)
    }
}

// MARK: - Indeterminate Selection

private struct IndeterminateSelectionView: View {

    @ObservedObject var model: IndicatorControlItemConfigurationModel

    var body: some View {
        OUDSChipPicker(title: "app_components_common_selection_label",
                       selection: $model.selection,
                       chips: OUDSCheckboxIndicatorState.chips)
    }
}
