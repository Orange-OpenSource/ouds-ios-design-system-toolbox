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

// MARK: Divider page

struct DividerPage: View {

    @StateObject private var configurationModel: DividerConfigurationModel

    init(orientation: DividerConfigurationModel.Orientation) {
        _configurationModel = StateObject(wrappedValue: DividerConfigurationModel(orientation: orientation))
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            DividerDemo(configurationModel: configurationModel)
        } configurationView: {
            DividerConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Button Demo

struct DividerDemo: View {

    @StateObject var configurationModel: DividerConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        Group {
            switch configurationModel.orientation {
            case .horizontal:
                VStack(alignment: .center) {
                    Spacer()
                    OUDSHorizontalDivider(color: configurationModel.selectedColor)
                    Spacer()
                }
            case .vertical:
                HStack(alignment: .center) {
                    Spacer()
                    OUDSVerticalDivider(color: configurationModel.selectedColor)
                    Spacer()
                }
            }
        }
        .frame(height: 44)
        .padding(.all, theme.spaces.spaceFixedMedium)
    }
}
