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

// MARK: Tag page

struct TagPage: View {

    @StateObject private var configurationModel: TagConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: TagConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            TagDemo(configurationModel: configurationModel)
        } configurationView: {
            TagConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Tag Demo

struct TagDemo: View {

    @StateObject var configurationModel: TagConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            OUDSTag(
                label: configurationModel.label,
                icon: icon,
                hierarchy: configurationModel.hierarchy,
                status: configurationModel.status,
                shape: configurationModel.shape,
                size: configurationModel.size,
                hasLoader: configurationModel.loader)

            Spacer()
        }
        .padding(.all, theme.spaces.spaceFixedMd)
    }

    private var icon: OUDSTag.Icon? {
        switch configurationModel.layout {
        case .textOnly:
            nil
        case .textAndBullet:
            .bullet
        case .textAndIcon:
            .asset(Image(decorative: "ic_heart"))
        }
    }
}
