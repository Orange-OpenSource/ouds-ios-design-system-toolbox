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

// MARK: - Switch Item Page

struct SwitchItemPage: View {

    @StateObject private var configurationModel: BooleanControlItemConfigurationModel

    init() {
        let model = BooleanControlItemConfigurationModel(componentInitCode: "OUDSSwitchItem(isOn: $isOn")
        _configurationModel = StateObject(wrappedValue: model)
    }

    var body: some View {
        ControlItemElementPage(configurationModel: configurationModel) {
            SwitchItemDemo(configurationModel: configurationModel)
        }
    }
}

// MARK: - Switch Item Demo

private struct SwitchItemDemo: View {

    @ObservedObject var configurationModel: BooleanControlItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        OUDSSwitchItem(configurationModel.labelText,
                       isOn: $configurationModel.isOn,
                       helper: configurationModel.helperText,
                       icon: icon,
                       flipIcon: configurationModel.flipIcon,
                       isReversed: !configurationModel.isReversed,
                       isError: configurationModel.isError,
                       errorText: configurationModel.errorText,
                       isReadOnly: configurationModel.isReadOnly,
                       hasDivider: configurationModel.hasDivider)
            .disabled(!configurationModel.enabled)
            .padding(.all, theme.spaces.fixedMedium)
            .accessibilityIdentifier(A11YIdentifiers.componentSwitchItem)
    }

    private var icon: Image? {
        configurationModel.icon ? Image.defaultImage(prefixedBy: theme.name) : nil
    }
}
