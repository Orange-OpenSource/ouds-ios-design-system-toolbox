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

// MARK: Button page

struct LinkPage: View {

    @StateObject private var configurationModel: LinkConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: LinkConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            LinkDemo(configurationModel: configurationModel)
        } configurationView: {
            LinkConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Button Demo

private struct LinkDemo: View {

    @Environment(\.theme) private var theme
    @StateObject var configurationModel: LinkConfigurationModel

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            switch configurationModel.layout {
            case .textOnly:
                OUDSLink(text: configurationModel.text, size: configurationModel.size) {}
            case .textAndIcon:
                OUDSLink(text: configurationModel.text, icon: Image(decorative: "ic_heart"), size: configurationModel.size) {}
            case .indicatorBack:
                OUDSLink(text: configurationModel.text, indicator: .back, size: configurationModel.size) {}
            case .indicatorNext:
                OUDSLink(text: configurationModel.text, indicator: .next, size: configurationModel.size) {}
            }

            Spacer()
        }
        .disabled(!configurationModel.enabled)
        .padding(.all, theme.spaces.fixedMedium)
    }
}
