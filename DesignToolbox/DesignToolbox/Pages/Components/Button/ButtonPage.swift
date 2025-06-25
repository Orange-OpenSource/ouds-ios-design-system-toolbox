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

            // It is not allowed to place a Negative button on colored surface
            if configurationModel.hierarchy == .negative, configurationModel.onColoredSurface {
                Text("app_components_button_negative_hierary_notAllowed_text")
            } else {
                switch configurationModel.layout {
                case .iconOnly:
                    OUDSButton(icon: Image(decorative: "ic_heart"),
                               accessibilityLabel: "app_components_button_icon_a11y".localized(),
                               hierarchy: configurationModel.hierarchy,
                               style: configurationModel.style) {}
                case .textOnly:
                    OUDSButton(text: configurationModel.text,
                               hierarchy: configurationModel.hierarchy,
                               style: configurationModel.style) {}
                case .iconAndText:
                    OUDSButton(icon: Image(decorative: "ic_heart"),
                               text: configurationModel.text,
                               hierarchy: configurationModel.hierarchy,
                               style: configurationModel.style) {}
                }
            }

            Spacer()
        }
        .disabled(!configurationModel.enabled)
        .padding(.all, theme.spaces.spaceFixedMedium)
    }
}
