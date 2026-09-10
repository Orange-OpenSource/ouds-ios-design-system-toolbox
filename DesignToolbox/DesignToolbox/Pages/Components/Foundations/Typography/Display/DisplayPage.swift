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

// MARK: Display Page

struct DisplayPage: View {

    @StateObject private var configurationModel: DisplayConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: DisplayConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            DisplayDemo(configurationModel: configurationModel)
        } configurationView: {
            DisplayConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Display Demo

private struct DisplayDemo: View {

    @StateObject var configurationModel: DisplayConfigurationModel

    var body: some View {
        OUDSDisplay(text: configurationModel.text, size: configurationModel.size)
    }
}
