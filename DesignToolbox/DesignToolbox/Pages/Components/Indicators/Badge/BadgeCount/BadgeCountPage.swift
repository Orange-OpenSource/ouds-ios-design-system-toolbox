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

// MARK: Badge Count Page

struct BadgeCountPage: View {

    @StateObject private var configurationModel: BadgeCountConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: BadgeCountConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            BadgeCountDemo(configurationModel: configurationModel)
        } configurationView: {
            BadgeCountConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Badge Count Demo

struct BadgeCountDemo: View {

    @StateObject var configurationModel: BadgeCountConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        OUDSBadgeCount(configurationModel.count,
                       accessibilityLabel: "app_components_badge_hint_a11y".localized(),
                       status: configurationModel.status,
                       size: configurationModel.countSize)
            .disabled(!configurationModel.enabled)
    }
}
