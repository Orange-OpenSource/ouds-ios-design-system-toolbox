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

// MARK: - Radio Page

struct RadioPage: View {

    @StateObject private var configuration: RadioConfigurationModel

    init() {
        _configuration = StateObject(wrappedValue: RadioConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(
            configuration: configuration,
            componentView: componentView,
            configurationView: configurationView)
    }

    @ViewBuilder
    private func componentView(with configuration: ComponentConfiguration) -> some View {
        if let model = configuration as? RadioConfigurationModel {
            ComponentIllustration {
                RadioDemo(model: model)
            }
        }
    }

    @ViewBuilder
    private func configurationView(with configuration: ComponentConfiguration) -> some View {
        if let model = configuration as? RadioConfigurationModel {
            RadioConfiguration(model: model)
        }
    }
}

// MARK: - Radio Demo

private struct RadioDemo: View {

    @ObservedObject var model: RadioConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            OUDSRadio(isOn: $model.selection,
                      accessibilityLabel: "app_components_radioButton_hint_a11y".localized(), // No LocalizedStringKey type inference in the component
                      isError: model.isError)
                .disabled(!model.enabled)
            Spacer()
        }
        .padding(.all, theme.spaces.spaceFixedMedium)
        .designToolboxColoredSurface(false)
    }
}
