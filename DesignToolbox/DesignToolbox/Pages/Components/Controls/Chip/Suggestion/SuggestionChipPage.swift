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

    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            switch configurationModel.layout {
            case .iconOnly:
                OUDSSuggestionChip(icon: Image(decorative: "ic_heart"),
                                   accessibilityLabel: "app_components_common_icon_a11y".localized()) {}
            case .textOnly:
                OUDSSuggestionChip(text: configurationModel.text) {}
            case .textAndIcon:
                OUDSSuggestionChip(icon: Image(decorative: "ic_heart"), text: configurationModel.text) {}
            }

            Spacer()
        }
        .disabled(!configurationModel.enabled)
        .padding(.all, theme.spaces.fixedMedium)
    }
}
