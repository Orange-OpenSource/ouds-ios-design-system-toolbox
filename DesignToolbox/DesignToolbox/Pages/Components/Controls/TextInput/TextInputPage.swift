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

import OUDS
import OUDSComponents
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

    // Need here that system name, a11y managed in component
    // swiftlint:disable accessibility_label_for_image
    private var leadingIcon: Image? {
        configurationModel.leadingIcon ? Image(systemName: "figure.handball") : nil
    }

    // swiftlint:enable accessibility_label_for_image

    private var trailingAction: OUDSTextInput.TrailingAction? {
        guard configurationModel.trailingAction else {
            return nil
        }

        return .init(icon: Image(decorative: "ic_heart"),
                     actionHint: "app_components_common_icon_a11y".localized()) {}
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
