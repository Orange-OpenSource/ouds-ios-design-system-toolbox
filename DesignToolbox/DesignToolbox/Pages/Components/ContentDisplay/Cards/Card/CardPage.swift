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

// MARK: Card page

struct CardPage: View {

    @StateObject private var configurationModel: CardConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CardConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CardDemo(configurationModel: configurationModel)
        } configurationView: {
            CardConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Card Demo

struct CardDemo: View {

    @StateObject var configurationModel: CardConfigurationModel
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        OUDSCard(style: configurationModel.cardStyle) {
            CardContent(configurationModel: configurationModel, isInActionCard: false)
        }
        .disabled(!configurationModel.enabled)
        .showSkeleton(isVisible: configurationModel.showSkeleton)
    }
}
