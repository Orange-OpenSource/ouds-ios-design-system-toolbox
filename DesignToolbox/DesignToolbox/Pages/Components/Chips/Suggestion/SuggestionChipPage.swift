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

<<<<<<< HEAD
struct SuggestionChipDemo: View {
=======
private struct SuggestionChipDemo: View {
>>>>>>> 2e42ea7 (feat: Add SuggestionChip demo)

    @StateObject var configurationModel: SuggestionChipConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            switch configurationModel.layout {
            case .iconOnly:
<<<<<<< HEAD
                OUDSSuggestionChip(icon: Image(decorative: "ic_heart"),
                                   accessibilityLabel: "app_components_button_icon_a11y".localized()) {}
            case .textOnly:
                OUDSSuggestionChip(text: configurationModel.text) {}
            case .textAndIcon:
                OUDSSuggestionChip(icon: Image(decorative: "ic_heart"), text: configurationModel.text) {}
=======
                OUDSChip(icon: Image(decorative: "ic_heart"),
                         accessibilityLabel: "app_components_button_icon_a11y".localized()) {}
            case .textOnly:
                OUDSChip(text: configurationModel.text) {}
            case .iconAndText:
                OUDSChip(icon: Image(decorative: "ic_heart"), text: configurationModel.text) {}
>>>>>>> 2e42ea7 (feat: Add SuggestionChip demo)
            }

            Spacer()
        }
        .disabled(!configurationModel.enabled)
<<<<<<< HEAD
        .padding(.all, theme.spaces.spaceFixedMd)
=======
        .padding(.all, theme.spaces.spaceFixedMedium)
>>>>>>> 2e42ea7 (feat: Add SuggestionChip demo)
    }
}
