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

// MARK: TextInput page

struct TextInputPage: View {

    @StateObject private var configurationModel: TextInputConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: TextInputConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            TextInputDemo(configurationModel: configurationModel)
        } configurationView: {
            TextInputConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - TextInput Demo

private struct TextInputDemo: View {

    @StateObject var configurationModel: TextInputConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            OUDSTextInput(label: configurationModel.label,
                          text: $configurationModel.text,
                          placeholderText: configurationModel.placeHolderText,
                          helperText: configurationModel.helperText)
                .environment(\.oudsRoundedTextInput, configurationModel.rounded)

            Spacer()
        }
        .disabled(!configurationModel.enabled)
        .padding(.all, theme.spaces.spaceFixedMd)
    }
}
