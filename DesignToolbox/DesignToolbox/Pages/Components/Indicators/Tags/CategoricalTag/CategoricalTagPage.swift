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

// MARK: - Categorical Tag Page

struct CategoricalTagPage: View {

    @StateObject private var configurationModel: CategoricalTagConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CategoricalTagConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CategoricalTagDemo(configurationModel: configurationModel)
        } configurationView: {
            CategoricalTagConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Categorical Tag Demo

struct CategoricalTagDemo: View {

    @ObservedObject var configurationModel: CategoricalTagConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        tagView
            .disabled(!configurationModel.enabled && !configurationModel.isLoading)
    }

    @ViewBuilder
    private var tagView: some View {
        if configurationModel.isLoading {
            OUDSCategoricalTag(loadingLabel: configurationModel.label,
                               progress: configurationModel.progress,
                               category: configurationModel.category,
                               shape: configurationModel.shape,
                               size: configurationModel.size)
        } else {
            OUDSCategoricalTag(label: configurationModel.label,
                               category: configurationModel.category,
                               leading: configurationModel.leading(from: theme),
                               shape: configurationModel.shape,
                               size: configurationModel.size)
        }
    }
}
