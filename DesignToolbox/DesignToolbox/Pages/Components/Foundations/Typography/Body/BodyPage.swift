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

// MARK: Body Page

struct BodyPage: View {

    @StateObject private var configurationModel: BodyConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: BodyConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            BodyDemo(configurationModel: configurationModel)
        } configurationView: {
            BodyConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Body Demo

private struct BodyDemo: View {

    @StateObject var configurationModel: BodyConfigurationModel

    var body: some View {
        OUDSBody(text: configurationModel.text, size: configurationModel.size, weight: configurationModel.weight)
    }
}
