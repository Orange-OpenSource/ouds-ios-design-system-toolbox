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

// MARK: PasswordInput page

struct PasswordInputPage: View {

    @StateObject private var configurationModel: PasswordInputConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: PasswordInputConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            PasswordInputDemo(configurationModel: configurationModel)
        } configurationView: {
            PasswordInputConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - PasswordInput Demo

struct PasswordInputDemo: View {

    // MARK: - Stored properties

    @StateObject var configurationModel: PasswordInputConfigurationModel
    @Environment(\.theme) private var theme
    @Environment(\.openURL) private var openUrl

    // MARK: - Body

    var body: some View {
        OUDSPasswordInput(label: configurationModel.label,
                          text: $configurationModel.text,
                          placeholder: configurationModel.placeholderText,
                          prefix: configurationModel.prefixText,
                          hasLeadingIcon: configurationModel.leadingIcon,
                          helperText: configurationModel.helperText,
                          isOutlined: configurationModel.isOutlined,
                          constrainedMaxWidth: configurationModel.constrainedMaxWidth,
                          status: configurationModel.status)
            .autocorrectionDisabled()
            .textInputDisableAutocapitalization()
            .padding(.all, theme.spaces.fixedMedium)
            .onSubmit {
                if configurationModel.text == "error" {
                    configurationModel.status = .error(message: "Error text detecte")
                }
            }
    }
}
