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

#if !os(tvOS)

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
        .oudsHideKeyboardOnTap()
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
        // To keep things simple, assuming the rich/raw mode is for all parameters
        switch configurationModel.textMode {
        case .raw:
            OUDSTextInput(label: configurationModel.label,
                          text: $configurationModel.text,
                          placeholder: configurationModel.placeholderText,
                          prefix: configurationModel.prefixText,
                          suffix: configurationModel.suffixText,
                          leadingImage: leadingImage,
                          trailingAction: trailingAction,
                          helperText: configurationModel.helperText,
                          helperLink: helperLink,
                          isOutlined: configurationModel.isOutlined,
                          constrainedMaxWidth: configurationModel.constrainedMaxWidth,
                          status: configurationModel.computedStatus)
                .autocorrectionDisabled()
                .textInputDisableAutocapitalization()
        case .rich:
            OUDSTextInput(label: configurationModel.label,
                          text: $configurationModel.text,
                          placeholder: configurationModel.placeholderText,
                          prefix: configurationModel.prefixText,
                          suffix: configurationModel.suffixText,
                          leadingImage: leadingImage,
                          trailingAction: trailingAction,
                          helperText: configurationModel.richHelperText,
                          helperLink: helperLink,
                          isOutlined: configurationModel.isOutlined,
                          constrainedMaxWidth: configurationModel.constrainedMaxWidth,
                          status: configurationModel.computedStatus)
                .autocorrectionDisabled()
                .textInputDisableAutocapitalization()
        }
    }

    private var leadingImage: OUDSImage? {
        guard configurationModel.leadingIcon else { return nil }
        let asset: Image = configurationModel.leadingIconType == .tintedIcon
            ? Image.defaultImage(prefixedBy: theme.name)
            : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = configurationModel.leadingIconType == .tintedIcon ? .template : .original
        return OUDSImage(asset: asset, flipped: configurationModel.flipLeadingIcon, renderingMode: renderingMode)
    }

    private var trailingAction: OUDSTextInput.TrailingAction? {
        guard configurationModel.trailingAction else {
            return nil
        }
        let asset: Image = configurationModel.trailingActionIconType == .tintedIcon
            ? Image.defaultImage(prefixedBy: theme.name)
            : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = configurationModel.trailingActionIconType == .tintedIcon ? .template : .original
        return .init(image: OUDSImage(asset: asset,
                                      flipped: configurationModel.flipTrailingActionIcon,
                                      renderingMode: renderingMode),
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

#endif
