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

    var body: some View {
        Group {
            switch configurationModel.layout {
            case .iconOnly:
                OUDSFilterChip(icon: iconImage,
                               accessibilityLabel: "app_components_common_icon_a11y".localized(),
                               selected: configurationModel.selected,
                               renderingMode: renderingMode)
                {
                    configurationModel.selected.toggle()
                }
            case .textOnly:
                OUDSFilterChip(text: configurationModel.text, selected: configurationModel.selected) {
                    configurationModel.selected.toggle()
                }
            case .textAndIcon:
                OUDSFilterChip(icon: iconImage, text: configurationModel.text, selected: configurationModel.selected, renderingMode: renderingMode) {
                    configurationModel.selected.toggle()
                }
            }
        }
        .disabled(!configurationModel.enabled)
    }

    private var iconImage: Image {
        configurationModel.iconType == .tintedIcon
            ? Image(decorative: "ic_heart")
            : Image.placeholderImage()
    }

    private var renderingMode: Image.TemplateRenderingMode {
        configurationModel.iconType == .tintedIcon ? .template : .original
    }
}
