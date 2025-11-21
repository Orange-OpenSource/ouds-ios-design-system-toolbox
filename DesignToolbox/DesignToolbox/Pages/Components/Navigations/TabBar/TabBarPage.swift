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

// MARK: Tab bar page

struct TabBarPage: View {

    @StateObject private var configurationModel: TabBarConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: TabBarConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            TabBarDemo(configurationModel: configurationModel)
        } configurationView: {
            TabBarConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Tab bar Demo

private struct TabBarDemo: View {

    @Environment(\.theme) private var theme
    @StateObject var configurationModel: TabBarConfigurationModel

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            Text("Tab bar")

            Spacer()
        }
        .padding(.all, theme.spaces.fixedMedium)
    }
}
