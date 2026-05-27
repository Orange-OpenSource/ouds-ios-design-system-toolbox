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

// MARK: Badge Standard Page

struct BadgeStandardPage: View {

    @StateObject private var configurationModel: BadgeStandardConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: BadgeStandardConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            BadgeStandardDemo(configurationModel: configurationModel)
        } configurationView: {
            BadgeStandardConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Badge Standard Demo

struct BadgeStandardDemo: View {

    @StateObject var configurationModel: BadgeStandardConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        OUDSBadgeStandard(accessibilityLabel: "app_components_badge_hint_a11y".localized(),
                          status: configurationModel.status,
                          size: configurationModel.standardSize)
            .disabled(!configurationModel.enabled)
    }
}
