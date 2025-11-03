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

import OUDSComponents
import OUDSThemesContract
import SwiftUI

// MARK: Chip page

struct FilterChipPage: View {

    @StateObject private var configurationModel: FilterChipConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: FilterChipConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            FilterChipDemo(configurationModel: configurationModel)
        } configurationView: {
            FilterChipConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - FilterChip Demo

struct FilterChipDemo: View {

    @StateObject var configurationModel: FilterChipConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            switch configurationModel.layout {
            case .iconOnly:
                OUDSFilterChip(icon: Image(decorative: "ic_heart"),
                               accessibilityLabel: "app_components_common_icon_a11y".localized(),
                               selected: configurationModel.selected)
                {
                    configurationModel.selected.toggle()
                }
            case .textOnly:
                OUDSFilterChip(text: configurationModel.text, selected: configurationModel.selected) {
                    configurationModel.selected.toggle()
                }
            case .textAndIcon:
                OUDSFilterChip(icon: Image(decorative: "ic_heart"), text: configurationModel.text, selected: configurationModel.selected) {
                    configurationModel.selected.toggle()
                }
            }

            Spacer()
        }
        .disabled(!configurationModel.enabled)
        .padding(.all, theme.spaces.fixedMedium)
    }
}
