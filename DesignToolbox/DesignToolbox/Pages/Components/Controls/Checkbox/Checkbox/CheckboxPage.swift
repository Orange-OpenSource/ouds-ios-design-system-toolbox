//
// Software Name: OUDSThemesContract iOS
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

// MARK: - Checkbox Page

/// Related to `OUDSCheckbox` (i.e. with 2 available values).
struct CheckboxPage: View {

    @StateObject private var configurationModel: CheckboxConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CheckboxConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CheckboxDemo(configurationModel: configurationModel)
        } configurationView: {
            CheckboxConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Checkbox Demo

private struct CheckboxDemo: View {

    @ObservedObject var configurationModel: CheckboxConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            OUDSCheckbox(isOn: $configurationModel.indicatorState,
                         accessibilityLabel: "app_components_checkbox_hint_a11y".localized(), // No LocalizedStringKey inference in the component
                         isError: configurationModel.isError)
                .disabled(!configurationModel.enabled)
                .accessibilityIdentifier(A11YIdentifiers.componentCheckbox)
            Spacer()
        }
        .padding(.all, theme.spaces.fixedMedium)
    }
}
