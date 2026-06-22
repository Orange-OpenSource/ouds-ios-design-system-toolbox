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
        Group {
            // It is not allowed to place a Negative or Brand button on colored surface
            if configurationModel.onColoredSurface, configurationModel.appearance == .negative || configurationModel.appearance == .brand {
                Text("app_components_button_appearence_notAllowed_text")
            } else {
                switch configurationModel.layout {
                case .iconOnly:
                    OUDSButton(icon: image,
                               accessibilityLabel: "app_components_common_icon_a11y".localized(),
                               flipIcon: configurationModel.flipIcon,
                               renderingMode: imageMode,
                               appearance: configurationModel.appearance,
                               style: configurationModel.style,
                               isFullWidth: configurationModel.isFullWidth) {}
                case .textOnly:
                    OUDSButton(text: configurationModel.text,
                               appearance: configurationModel.appearance,
                               style: configurationModel.style,
                               isFullWidth: configurationModel.isFullWidth) {}
                case .textAndIcon:
                    OUDSButton(text: configurationModel.text,
                               icon: image,
                               flipIcon: configurationModel.flipIcon,
                               renderingMode: imageMode,
                               appearance: configurationModel.appearance,
                               style: configurationModel.style,
                               isFullWidth: configurationModel.isFullWidth) {}
                }
            }
        }
        .disabled(!configurationModel.enabled)
    }

    private var image: Image {
        if configurationModel.rawImage {
            Image.placeholderImage()
        } else {
            Image.defaultImage()
        }
    }

    private var imageMode: Image.TemplateRenderingMode {
        if configurationModel.rawImage {
            .original
        } else {
            .template
        }
    }
}
