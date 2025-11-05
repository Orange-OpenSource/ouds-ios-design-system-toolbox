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

// MARK: Input Tag page

struct InputTagPage: View {

    @StateObject private var configurationModel: InputTagConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: InputTagConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            InputTagDemo(configurationModel: configurationModel)
        } configurationView: {
            InputTagConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Input Tag Demo

struct InputTagDemo: View {

    @StateObject var configurationModel: InputTagConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            OUDSInputTag(label: configurationModel.label) {}
                .disabled(!configurationModel.enabled)

            Spacer()
        }
        .padding(.all, theme.spaces.fixedMedium)
    }
}
