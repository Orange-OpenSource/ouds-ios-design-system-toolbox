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

// MARK: - TextArea page

struct TextAreaPage: View {

    @StateObject private var configurationModel: TextAreaConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: TextAreaConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            TextAreaDemo(configurationModel: configurationModel)
        } configurationView: {
            TextAreaConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - TextArea Demo

struct TextAreaDemo: View {

    // MARK: - Stored properties

    @StateObject var configurationModel: TextAreaConfigurationModel
    @Environment(\.openURL) private var openUrl

    // MARK: - Body

    var body: some View {
        OUDSTextArea(label: configurationModel.label,
                     text: $configurationModel.text,
                     placeholder: configurationModel.placeholderText,
                     helperText: configurationModel.computedHelperText,
                     helperLink: helperLink,
                     isOutlined: configurationModel.isOutlined,
                     constrainedMaxWidth: configurationModel.constrainedMaxWidth,
                     status: configurationModel.computedStatus)
    }

    private var helperLink: OUDSTextArea.Helperlink? {
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
