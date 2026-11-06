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

// MARK: - Radio Item Page

struct RadioItemPage: View {
    @StateObject private var configurationModel: BooleanControlItemConfigurationModel

    init() {
        let model = BooleanControlItemConfigurationModel(componentInitCode: "OUDSRadioItem(",
                                                         bindingInitCode: "isOn: $isOn",
                                                         outlinedConfiguration: (value: false,
                                                                                 outlinedConfigurationLabel: "app_components_common_outlined_tech"),
                                                         extraLabelConfiguration: "app_components_common_extraLabel_tech".localized())
        _configurationModel = StateObject(wrappedValue: model)
    }

    var body: some View {
        ControlItemElementPage(configurationModel: configurationModel) {
            RadioItemDemo(configurationModel: configurationModel)
        }
    }
}

// MARK: - Radio Item Demo

private struct RadioItemDemo: View {

    @ObservedObject var configurationModel: BooleanControlItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        OUDSRadioItem(configurationModel.labelText,
                      isOn: $configurationModel.isOn,
                      extraLabel: configurationModel.extraLabelText,
                      description: configurationModel.descriptionText,
                      image: image,
                      isOutlined: configurationModel.outlined,
                      isReversed: configurationModel.isReversed,
                      isError: configurationModel.isError,
                      errorText: errorContent,
                      isReadOnly: configurationModel.isReadOnly,
                      hasDivider: configurationModel.hasDivider,
                      constrainedMaxWidth: configurationModel.constrainedMaxWidth)
        .disabled(!configurationModel.enabled)
        .accessibilityIdentifier(A11YIdentifiers.componentRadioItem)
        .oudsUseEdgeToEdge(configurationModel.isEdgeToEdgeComponent)
        .showSkeleton(isVisible: configurationModel.showSkeleton)
    }

    private var isEdgeToEdge: Bool {
        !configurationModel.outlined && configurationModel.isEdgeToEdgeComponent
    }

    private var errorContent: OUDSTextualContent {
        switch configurationModel.textMode {
        case .rich:
            .rich(configurationModel.richErrorText)
        case .raw:
            .raw(configurationModel.errorText)
        }
    }

    private var image: OUDSImage? {
        guard configurationModel.icon else { return nil }
        let asset: Image = configurationModel.rawImage ? Image.placeholderImage() : Image.defaultImage(prefixedBy: theme.name)
        let renderingMode: Image.TemplateRenderingMode = configurationModel.rawImage ? .original : .template
        return OUDSImage(asset: asset, flipped: configurationModel.flipIcon, renderingMode: renderingMode)
    }
}
