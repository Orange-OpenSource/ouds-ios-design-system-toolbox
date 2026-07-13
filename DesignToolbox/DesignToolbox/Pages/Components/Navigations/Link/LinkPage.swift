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

// MARK: Link page

struct LinkPage: View {

    @StateObject private var configurationModel: LinkConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: LinkConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            LinkDemo(configurationModel: configurationModel)
        } configurationView: {
            LinkConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Link Demo

private struct LinkDemo: View {

    @StateObject var configurationModel: LinkConfigurationModel

    var body: some View {
        link
            .disabled(!configurationModel.enabled)
    }

    @ViewBuilder private var link: some View {
        switch configurationModel.layout {
        case .textOnly:
            OUDSLink(text: configurationModel.text, size: configurationModel.size) {}
        case .textAndIcon:
            OUDSLink(text: configurationModel.text, image: image, size: configurationModel.size) {}
        case .indicatorBack:
            OUDSLink(text: configurationModel.text, indicator: .back, size: configurationModel.size, isFullWidth: configurationModel.isFullWidth) {}
        case .indicatorNext:
            OUDSLink(text: configurationModel.text, indicator: .next, size: configurationModel.size, isFullWidth: configurationModel.isFullWidth) {}
        }
    }

    private var image: OUDSImage {
        let asset: Image = configurationModel.iconType == .tintedIcon
            ? Image(decorative: "ic_heart")
            : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = configurationModel.iconType == .tintedIcon ? .template : .original
        return OUDSImage(asset: asset, renderingMode: renderingMode)
    }
}
