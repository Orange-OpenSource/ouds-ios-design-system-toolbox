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

// MARK: Button page

struct ButtonPage: View {

    @StateObject private var configurationModel: ButtonConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: ButtonConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            ButtonDemo(configurationModel: configurationModel)
        } configurationView: {
            ButtonConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Button Demo

private struct ButtonDemo: View {

    @StateObject var configurationModel: ButtonConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            // It is not allowed to place a Negative or Brand button on colored surface
            if configurationModel.onColoredSurface, configurationModel.appearance == .negative || configurationModel.appearance == .brand {
                Text("app_components_button_appearence_notAllowed_text")
            } else {
                switch configurationModel.layout {
                case .iconOnly:
                    OUDSButton(icon: Image.defaultImage(prefixedBy: theme.name),
                               accessibilityLabel: "app_components_common_icon_a11y".localized(),
                               flipIcon: configurationModel.flipIcon,
                               appearance: configurationModel.appearance,
                               style: configurationModel.style) {}
                case .textOnly:
                    OUDSButton(text: configurationModel.text,
                               appearance: configurationModel.appearance,
                               style: configurationModel.style) {}
                case .textAndIcon:
                    OUDSButton(text: configurationModel.text,
                               icon: Image.defaultImage(prefixedBy: theme.name),
                               flipIcon: configurationModel.flipIcon,
                               appearance: configurationModel.appearance,
                               style: configurationModel.style) {}
                }
            }

            Spacer()
        }
        .disabled(!configurationModel.enabled)
        .padding(.all, theme.spaces.fixedMedium)
    }
}
