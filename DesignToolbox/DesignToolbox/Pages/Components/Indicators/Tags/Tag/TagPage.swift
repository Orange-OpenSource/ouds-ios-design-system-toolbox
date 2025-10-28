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
                status: configurationModel.status,
                appearance: configurationModel.appearance,
                shape: configurationModel.shape,
                size: configurationModel.size,
                hasLoader: configurationModel.loader)
                .disabled(!configurationModel.enabled)

            Spacer()
        }
        .padding(.all, theme.spaces.fixedMedium)
    }
}
