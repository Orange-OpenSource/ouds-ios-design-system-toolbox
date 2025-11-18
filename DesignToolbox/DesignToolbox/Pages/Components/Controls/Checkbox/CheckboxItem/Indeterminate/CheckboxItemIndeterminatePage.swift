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

// MARK: - Checkbox Item Indeterminate Page

struct CheckboxItemIndeterminatePage: View {

    @StateObject private var configurationModel: IndicatorControlItemConfigurationModel

    init() {
        let model = IndicatorControlItemConfigurationModel(componentInitCode: "OUDSCheckboxItemIndeterminate(selection: $selection")
        _configurationModel = StateObject(wrappedValue: model)
    }

    var body: some View {
        ControlItemElementPage(configurationModel: configurationModel) {
            CheckboxItemIndeterminateDemo(configurationModel: configurationModel)
        }
    }
}

// MARK: - Checkbox Item Indeterminate Demo

private struct CheckboxItemIndeterminateDemo: View {

    @ObservedObject var configurationModel: IndicatorControlItemConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        OUDSCheckboxItemIndeterminate(selection: $configurationModel.selection,
                                      label: configurationModel.labelText,
                                      description: configurationModel.descriptionText,
                                      icon: icon,
                                      flipIcon: configurationModel.flipIcon,
                                      isReversed: configurationModel.isReversed,
                                      isError: configurationModel.isError,
                                      errorText: configurationModel.errorText,
                                      isReadOnly: configurationModel.isReadOnly,
                                      hasDivider: configurationModel.hasDivider)
            .disabled(!configurationModel.enabled)
            .padding(.all, theme.spaces.fixedMedium)
            .designToolboxColoredSurface(false)
            .accessibilityIdentifier(A11YIdentifiers.componentCheckboxItemIndeterminate)
    }

    private var icon: Image? {
        configurationModel.icon ? Image.defaultImage(prefixedBy: theme.name) : nil
    }
}
