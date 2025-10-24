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

import OUDS
import OUDSComponents
import SwiftUI

// MARK: - Radio Item Page

struct RadioItemPage: View {
    @StateObject private var configurationModel: BooleanControlItemConfigurationModel

    init() {
        let model = BooleanControlItemConfigurationModel(componentInitCode: "OUDSRadioItem(isOn: $isOn",
                                                         outlinedConfiguration: (value: false,
                                                                                 outlinedConfigurationLabel: "app_components_common_outlined_label"),
                                                         additionalLabelConfiguration: "app_components_radioButton_radioButtonItem_additionalLabel_label".localized())
        _configurationModel = StateObject(wrappedValue: model)
    }

    var body: some View {
        ControlItemElementPage(configurationModel: configurationModel) {
            RadioItemDemo(configurationModel: configurationModel)
        }
    }
}

// MARK: - Radio Item Demo

private struct RadioItemDemo: View {

    @ObservedObject var configurationModel: BooleanControlItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        OUDSRadioItem(isOn: $configurationModel.isOn,
                      label: configurationModel.labelText,
                      additionalLabel: configurationModel.additionalLabelText,
                      helper: configurationModel.helperText,
                      icon: icon,
                      flipIcon: configurationModel.flipIcon,
                      isOutlined: configurationModel.outlined,
                      isReversed: configurationModel.isReversed,
                      isError: configurationModel.isError,
                      errorText: configurationModel.errorText,
                      isReadOnly: configurationModel.isReadOnly,
                      hasDivider: configurationModel.divider)
            .disabled(!configurationModel.enabled)
            .padding(.all, theme.spaces.spaceFixedMedium)
            .accessibilityIdentifier(A11YIdentifiers.componentRadioItem)
    }

    // Need here that system name, a11y managed in component
    // swiftlint:disable accessibility_label_for_image
    private var icon: Image? {
        configurationModel.icon ? Image(systemName: "figure.handball") : nil
    }
    // swiftlint:enable accessibility_label_for_image
}
