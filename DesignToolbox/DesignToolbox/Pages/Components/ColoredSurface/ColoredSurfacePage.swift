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

// MARK: Colored Surface Page

struct ColoredSurfacePage: View {

    @StateObject private var configurationModel: ColoredSurfaceConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: ColoredSurfaceConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            ColoredSurfaceDemo(configurationModel: configurationModel)
        } configurationView: {
            ColoredSurfaceConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Colored Surface Demo

private struct ColoredSurfaceDemo: View {

    @ObservedObject var configurationModel: ColoredSurfaceConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center, spacing: theme.spaces.spaceFixedMedium) {
            OUDSColoredSurface(color: configurationModel.selectedColor.toSurfaceColor(from: theme)) {
                VStack(alignment: .center, spacing: theme.spaces.spaceFixedMedium) {
                    Text(configurationModel.selectedColor.formattedName)
                        .oudsForegroundColor(theme.colors.colorContentDefault)

                    OUDSButton(text: "app_components_button_label".localized(),
                               hierarchy: .default,
                               style: .default) {}

                    OUDSLink(text: "app_components_link_label".localized(), indicator: .next) {}
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.all, theme.spaces.spaceFixedMedium)
            }
        }
        .padding(.all, theme.spaces.spaceFixedMedium)
    }
}
