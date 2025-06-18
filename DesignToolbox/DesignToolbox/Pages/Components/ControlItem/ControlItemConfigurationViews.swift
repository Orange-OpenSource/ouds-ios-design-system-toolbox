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

    @StateObject private var model: ControlItemConfigurationModel
    @ViewBuilder private var demo: () -> Demo
    @Environment(\.colorScheme) private var colorScheme

    // MARK: Initializer

    init(model: ControlItemConfigurationModel, demo: @escaping () -> Demo) {
        _model = StateObject(wrappedValue: model)
        self.demo = demo
    }

    // MARK: Body

    var body: some View {
        ComponentConfigurationView(
            configuration: model,
            componentView: componentView,
            configurationView: configurationView)
    }

    @ViewBuilder
    private func componentView(with configuration: ComponentConfiguration) -> some View {
        VStack(alignment: .center) {
            // TODO: Build a modifier to inverse colorscheme or force to a colorscheme
            demo()
            demo().colorScheme(colorScheme == .dark ? .light : .dark)
        }
    }

    @ViewBuilder
    private func configurationView(with configuration: ComponentConfiguration) -> some View {
        ControlItemConfiguration(model: model)
    }
}

// MARK: - ControlItem Configuration View

private struct ControlItemConfiguration: View {

    // MARK: - Stored properties

    @ObservedObject var model: ControlItemConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMedium) {
            selection
                .disabled(model.isError || model.isReadOnly)

            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {

                OUDSSwitchItem("app_components_controlItem_icon_label", isOn: $model.icon)

                OUDSSwitchItem("app_components_controlItem_flipIcon_label", isOn: $model.flipIcon)
                    .disabled(!model.icon)

                if let outlinedConfiguration = model.outlinedConfiguration {
                    OUDSSwitchItem(outlinedConfiguration.outlinedConfigurationLabel, isOn: $model.outlined)
                }

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
                if model.additionalLabelConfiguration != nil {
                    DesignToolboxTextField(text: $model.additionalLabelText)
                }
                DesignToolboxTextField(text: $model.helperText)
            }
        }
    }

    @ViewBuilder
    var selection: some View {
        if let modelBoolean = model as? ControlItemConfigurationModelBoolean {
            BooleanSelection(model: modelBoolean)
        }

        if let modelMultiple = model as? ControlItemConfigurationModelMultiple {
            IndeterminateSelection(model: modelMultiple)
        }
    }
}

// MARK: ControlItem Configuration Selection (Boolean)

private struct BooleanSelection: View {

    @ObservedObject var model: ControlItemConfigurationModelBoolean

    var body: some View {
        OUDSSwitchItem("app_components_controlItem_selection_label", isOn: $model.isOn)
    }
}

// MARK: ControlItem Configuration Selection (Indicator State)

private struct IndeterminateSelection: View {
    @ObservedObject var model: ControlItemConfigurationModelMultiple

    var body: some View {
        DesignToolboxChoicePicker(title: "app_components_controlItem_selection_label",
                                  selection: $model.selection,
                                  style: .segmented)
        {
            ForEach(OUDSCheckboxIndicatorState.allCases, id: \.id) { state in
                Text(LocalizedStringKey(state.description)).tag(state)
            }
        }
    }
}
