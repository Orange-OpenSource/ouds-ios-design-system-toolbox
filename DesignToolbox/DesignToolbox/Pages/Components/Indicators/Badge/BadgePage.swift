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

// MARK: Badge page

struct BadgePage: View {

    @StateObject private var configurationModel: BadgeConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: BadgeConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            BadgeDemo(configurationModel: configurationModel)
        } configurationView: {
            BadgeConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Badge Demo

struct BadgeDemo: View {

    @StateObject var configurationModel: BadgeConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            switch configurationModel.badgeType {
            case .standard:
                OUDSBadge(status: configurationModel.status,
                          size: configurationModel.standardSize)
            case .count:
                OUDSBadge(count: configurationModel.count,
                          status: configurationModel.status,
                          size: configurationModel.illustrationSize)
            case .icon:
                OUDSBadge(icon: Image(decorative: "ic_heart"),
                          accessibilityLabel: "app_components_badge_hint_a11y".localized(),
                          status: configurationModel.status,
                          size: configurationModel.illustrationSize)
            }

            Spacer()
        }
        .padding(.all, theme.spaces.spaceFixedMedium)
    }
}
