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

struct LinkPage: View {

    private let configurationModel = LinkConfigurationModel()

    var body: some View {
        ComponentConfigurationView(
            configuration: configurationModel,
            componentView: componentView,
            configurationView: configurationView)
    }

    @ViewBuilder
    private func componentView() -> some View {
        ComponentIllustration {
            LinkDemo(configurationModel: configurationModel)
        }
    }

    @ViewBuilder
    private func configurationView() -> some View {
        LinkConfiguration(configurationModel: configurationModel)
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
            case .iconAndText:
                OUDSLink(text: configurationModel.text, icon: Image(decorative: "ic_heart"), size: configurationModel.size) {}
            case .indicatorBack:
                OUDSLink(text: configurationModel.text, indicator: .back, size: configurationModel.size) {}
            case .indicatorNext:
                OUDSLink(text: configurationModel.text, indicator: .next, size: configurationModel.size) {}
            }

            Spacer()
        }
        .disabled(!configurationModel.enabled)
        .padding(.all, theme.spaces.spaceFixedMedium)
        .modifier(DesignToolboxColoredSurfaceModifier(coloredSurface: configurationModel.onColoredSurface))
    }
}
