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

// MARK: - Checkbox Indeterminate Page

/// Related to `OUDSCheckboxIndeterminate` (i.e. with 3 available values).
struct CheckboxIndeterminatePage: View {

    @StateObject private var configurationModel: CheckboxIndeterminateConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CheckboxIndeterminateConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(
            configuration: configurationModel,
            componentView: componentView,
            configurationView: configurationView)
    }

    @ViewBuilder
    private func componentView() -> some View {
        CheckboxIndeterminateDemo(configurationModel: configurationModel)
    }

    @ViewBuilder
    private func configurationView() -> some View {
        CheckboxIndeterminateConfiguration(configurationModel: configurationModel)
    }
}

// MARK: - Checkbox Indeterminate Demo

private struct CheckboxIndeterminateDemo: View {

    @ObservedObject var configurationModel: CheckboxIndeterminateConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            OUDSCheckboxIndeterminate(selection: $configurationModel.indicatorState,
                                      accessibilityLabel: "app_components_checkbox_hint_a11y".localized(), // No LocalizedStringKey inference in the component
                                      isError: configurationModel.isError)
                .disabled(!configurationModel.enabled)
            Spacer()
        }
        .padding(.all, theme.spaces.spaceFixedMedium)
        .designToolboxColoredSurface(false)
    }
}
