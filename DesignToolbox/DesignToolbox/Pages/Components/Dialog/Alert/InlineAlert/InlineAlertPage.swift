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

// MARK: InlineAlert page

struct InlineAlertPage: View {

    @StateObject private var configurationModel: InlineAlertConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: InlineAlertConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            InlineAlertDemo(configurationModel: configurationModel)
        } configurationView: {
            InlineAlertConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - InlineAlert Demo

struct InlineAlertDemo: View {

    @StateObject var configurationModel: InlineAlertConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            OUDSInlineAlert(label: configurationModel.text, status: configurationModel.status(from: theme))
        }
        .padding(.all, theme.spaces.fixedMedium)
    }
}
