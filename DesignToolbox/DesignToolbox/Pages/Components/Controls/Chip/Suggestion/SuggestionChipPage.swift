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

struct SuggestionChipPage: View {

    @StateObject private var configurationModel: SuggestionChipConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: SuggestionChipConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            SuggestionChipDemo(configurationModel: configurationModel)
        } configurationView: {
            SuggestionChipConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - SuggestionChip Demo

struct SuggestionChipDemo: View {

    @StateObject var configurationModel: SuggestionChipConfigurationModel

    var body: some View {
        Group {
            switch configurationModel.layout {
            case .iconOnly:
                OUDSSuggestionChip(icon: oudsIcon,
                                   accessibilityLabel: "app_components_common_icon_a11y".localized()) {}
            case .textOnly:
                OUDSSuggestionChip(text: configurationModel.text) {}
            case .textAndIcon:
                OUDSSuggestionChip(icon: oudsIcon, text: configurationModel.text) {}
            }
        }
        .disabled(!configurationModel.enabled)
    }

    private var oudsIcon: OUDSImage {
        let asset: Image = configurationModel.iconType == .tintedIcon
            ? Image(decorative: "ic_heart")
            : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = configurationModel.iconType == .tintedIcon ? .template : .original
        return OUDSImage(asset: asset, renderingMode: renderingMode)
    }
}
