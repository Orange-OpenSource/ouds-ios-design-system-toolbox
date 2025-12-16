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

// MARK: TextInput page

struct TextInputPage: View {

    @StateObject private var configurationModel: TextInputConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: TextInputConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            TextInputDemo(configurationModel: configurationModel)
        } configurationView: {
            TextInputConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - TextInput Demo

struct TextInputDemo: View {

    // MARK: - Stored properties

    @StateObject var configurationModel: TextInputConfigurationModel
    @Environment(\.theme) private var theme
    @Environment(\.openURL) private var openUrl

    // MARK: - Body

    var body: some View {
        OUDSTextInput(label: configurationModel.label,
                      text: $configurationModel.text,
                      placeholder: configurationModel.placeholderText,
                      prefix: configurationModel.prefixText,
                      suffix: configurationModel.suffixText,
                      leadingIcon: leadingIcon,
                      flipLeadingIcon: configurationModel.flipLeadingIcon,
                      trailingAction: trailingAction,
                      helperText: configurationModel.helperText,
                      helperLink: helperLink,
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

    private var leadingIcon: Image? {
        configurationModel.leadingIcon ? Image.defaultImage(prefixedBy: theme.name) : nil
    }

    private var trailingAction: OUDSTextInput.TrailingAction? {
        guard configurationModel.trailingAction else {
            return nil
        }
        return .init(icon: Image.defaultImage(prefixedBy: theme.name),
                     actionHint: "app_components_common_icon_a11y".localized(),
                     flipIcon: configurationModel.flipTrailingActionIcon) {}
    }

    private var helperLink: OUDSTextInput.Helperlink? {
        guard !configurationModel.helperLinkText.isEmpty,
              let url = URL(string: "https://unified-design-system.orange.com/")
        else {
            return nil
        }

        return .init(text: configurationModel.helperLinkText) {
            openUrl.callAsFunction(url)
        }
    }
}
