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

// MARK: Badge Icon Page

struct BadgeIconPage: View {

    @StateObject private var configurationModel = BadgeIconConfigurationModel()

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            BadgeIconDemo(configurationModel: configurationModel)
        } configurationView: {
            BadgeIconConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Badge Icon Demo

struct BadgeIconDemo: View {

    @ObservedObject var configurationModel: BadgeIconConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        OUDSBadgeIcon(
            status: configurationModel.statusWithIcon(from: theme),
            accessibilityLabel: "app_components_badge_hint_a11y".localized(),
            size: configurationModel.iconSize)
            .disabled(!configurationModel.enabled)
            .id(theme.name) // Hack to be sure the image of the badge is the good one depending to the thame
    }
}
