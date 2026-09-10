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

// MARK: Code Page

struct CodePage: View {

    @StateObject private var configurationModel: CodeConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CodeConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CodeDemo(configurationModel: configurationModel)
        } configurationView: {
            CodeConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Code Demo

private struct CodeDemo: View {

    @StateObject var configurationModel: CodeConfigurationModel

    var body: some View {
        OUDSCode(text: configurationModel.text)
    }
}
