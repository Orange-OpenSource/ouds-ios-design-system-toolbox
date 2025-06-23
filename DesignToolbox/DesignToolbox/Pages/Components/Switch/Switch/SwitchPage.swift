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

// MARK: - Switch Page

struct SwitchPage: View {

    @StateObject private var configurationModel: SwitchConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: SwitchConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            SwitchDemo(configurationModel: configurationModel)
        } configurationView: {
            SwitchConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Switch Demo

private struct SwitchDemo: View {

    @ObservedObject var configurationModel: SwitchConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            OUDSSwitch(isOn: $configurationModel.selection,
                       accessibilityLabel: "app_components_switch_hint_a11y".localized()) // No LocalizedStringKey type inference in the component
                .disabled(!configurationModel.enabled)
            Spacer()
        }
        .padding(.all, theme.spaces.spaceFixedMedium)
        .designToolboxColoredSurface(false)
    }
}
