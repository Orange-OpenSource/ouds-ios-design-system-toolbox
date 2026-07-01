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

// MARK: - Switch Item Page

struct SwitchItemPage: View {

    @StateObject private var configurationModel: BooleanControlItemConfigurationModel

    init() {
        let model = BooleanControlItemConfigurationModel(componentInitCode: "OUDSSwitchItem(", bindingInitCode: "isOn: $isOn")
        _configurationModel = StateObject(wrappedValue: model)
    }

    var body: some View {
        ControlItemElementPage(configurationModel: configurationModel) {
            SwitchItemDemo(configurationModel: configurationModel)
        }
    }
}

// MARK: - Switch Item Demo

private struct SwitchItemDemo: View {

    @ObservedObject var configurationModel: BooleanControlItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        // To keep things simple, assuming the rich/raw mode is for all parameters
        switch configurationModel.textMode {
        case .raw:
            OUDSSwitchItem(configurationModel.labelText,
                           isOn: $configurationModel.isOn,
                           description: configurationModel.descriptionText,
                           icon: icon,
                           isReversed: !configurationModel.isReversed,
                           isError: configurationModel.isError,
                           errorText: configurationModel.errorText,
                           isReadOnly: configurationModel.isReadOnly,
                           hasDivider: configurationModel.hasDivider,
                           constrainedMaxWidth: configurationModel.constrainedMaxWidth)
                .disabled(!configurationModel.enabled)
                .accessibilityIdentifier(A11YIdentifiers.componentSwitchItem)
        case .rich:
            OUDSSwitchItem(configurationModel.labelText,
                           isOn: $configurationModel.isOn,
                           description: configurationModel.descriptionText,
                           icon: icon,
                           isReversed: !configurationModel.isReversed,
                           isError: configurationModel.isError,
                           errorText: configurationModel.richErrorText,
                           isReadOnly: configurationModel.isReadOnly,
                           hasDivider: configurationModel.hasDivider,
                           constrainedMaxWidth: configurationModel.constrainedMaxWidth)
                .disabled(!configurationModel.enabled)
                .accessibilityIdentifier(A11YIdentifiers.componentSwitchItem)
        }
    }

    private var icon: OUDSImage? {
        guard configurationModel.icon else { return nil }
        let asset: Image = configurationModel.rawImage ? Image.placeholderImage() : Image.defaultImage(prefixedBy: theme.name)
        let renderingMode: Image.TemplateRenderingMode = configurationModel.rawImage ? .original : .template
        return OUDSImage(asset: asset, flipped: configurationModel.flipIcon, renderingMode: renderingMode)
    }
}
