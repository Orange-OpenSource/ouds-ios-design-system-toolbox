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

// MARK: AlertBanner page

struct AlertBannerPage: View {

    @StateObject private var configurationModel: AlertBannerConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: AlertBannerConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            AlertBannerDemo(configurationModel: configurationModel)
        } configurationView: {
            AlertBannerConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - AlertBanner Demo

struct AlertBannerDemo: View {

    @StateObject var configurationModel: AlertBannerConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        Group {
            // To keep things simple, assuming the rich/raw mode is for all parameters
            switch configurationModel.textMode {
            case .raw:
                OUDSAlertBanner(label: configurationModel.text,
                                status: configurationModel.status(from: theme),
                                description: .raw(configurationModel.descriptionText),
                                link: configurationModel.link,
                                onClose: configurationModel.onClose)
            case .rich:
                OUDSAlertBanner(label: configurationModel.text,
                                status: configurationModel.status(from: theme),
                                description: .attributed(configurationModel.richDescriptionText),
                                link: configurationModel.link,
                                onClose: configurationModel.onClose)
            }
        }
        .showSkeleton(isVisible: configurationModel.showSkeleton)
    }
}
