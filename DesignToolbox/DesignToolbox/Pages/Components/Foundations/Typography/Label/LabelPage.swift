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

// MARK: Label Page

struct LabelPage: View {

    @StateObject private var configurationModel: LabelConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: LabelConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            LabelDemo(configurationModel: configurationModel)
        } configurationView: {
            LabelConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Label Demo

private struct LabelDemo: View {

    @StateObject var configurationModel: LabelConfigurationModel

    var body: some View {
        OUDSLabel(text: configurationModel.text, size: configurationModel.size, weight: configurationModel.weight)
    }
}
