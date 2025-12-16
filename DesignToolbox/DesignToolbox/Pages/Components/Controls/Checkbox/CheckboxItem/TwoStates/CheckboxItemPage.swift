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

// MARK: - Checkbox Item Page

struct CheckboxItemPage: View {

    @StateObject private var configurationModel: BooleanControlItemConfigurationModel

    init() {
        let model = BooleanControlItemConfigurationModel(componentInitCode: "OUDSCheckboxItem(isOn: $isOn")
        _configurationModel = StateObject(wrappedValue: model)
    }

    var body: some View {
        ControlItemElementPage(configurationModel: configurationModel) {
            CheckboxItemDemo(configurationModel: configurationModel)
        }
    }
}

// MARK: - Checkbox Item Demo

private struct CheckboxItemDemo: View {

    @ObservedObject var configurationModel: BooleanControlItemConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            OUDSCheckboxItem(isOn: $configurationModel.isOn,
                             label: configurationModel.labelText,
                             description: configurationModel.descriptionText,
                             icon: icon,
                             flipIcon: configurationModel.flipIcon,
                             isReversed: configurationModel.isReversed,
                             isError: configurationModel.isError,
                             errorText: configurationModel.errorText,
                             isReadOnly: configurationModel.isReadOnly,
                             hasDivider: configurationModel.hasDivider,
                             constrainedMaxWidth: configurationModel.constrainedMaxWidth)
            .disabled(!configurationModel.enabled)
            .padding(.all, theme.spaces.fixedMedium)
            .designToolboxColoredSurface(false)
            .accessibilityIdentifier(A11YIdentifiers.componentCheckboxItem)

            Spacer()
        }
    }

    private var icon: Image? {
        configurationModel.icon ? Image.defaultImage(prefixedBy: theme.name) : nil
    }
}
