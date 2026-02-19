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

// MARK: AlertMessage page

struct AlertMessagePage: View {

    @StateObject private var configurationModel: AlertMessageConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: AlertMessageConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            AlertMessageDemo(configurationModel: configurationModel)
        } configurationView: {
            AlertMessageConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - AlertMessage Demo

struct AlertMessageDemo: View {

    @StateObject var configurationModel: AlertMessageConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            OUDSAlertMessage(label: configurationModel.text,
                             status: configurationModel.status(from: theme),
                             description: configurationModel.descriptionText,
                             bulletList: configurationModel.bulletList,
                             link: configurationModel.link,
                             onClose: configurationModel.onClose)
        }
        .padding(.all, theme.spaces.fixedMedium)
    }
}
