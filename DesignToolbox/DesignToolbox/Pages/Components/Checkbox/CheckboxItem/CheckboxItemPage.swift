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

// MARK: - Checkbox Item Page

struct CheckboxItemPage: View {

    @StateObject private var configurationModel: CheckboxItemConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CheckboxItemConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CheckboxItemDemo(configurationModel: configurationModel)
        } configurationView: {
            CheckboxItemConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Checkbox Item Demo

private struct CheckboxItemDemo: View {

    @ObservedObject var configurationModel: CheckboxItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        OUDSCheckboxItem(isOn: $configurationModel.indicatorState,
                         label: configurationModel.labelText,
                         helper: configurationModel.helperText,
                         icon: icon,
                         flipIcon: configurationModel.flipIcon,
                         isReversed: configurationModel.isReversed,
                         isError: configurationModel.isError,
                         isReadOnly: configurationModel.isReadOnly,
                         hasDivider: configurationModel.divider)
            .disabled(!configurationModel.enabled)
            .padding(.all, theme.spaces.spaceFixedMedium)
    }

    // Need here that system name, a11y managed in component
    // swiftlint:disable accessibility_label_for_image
    private var icon: Image? {
        configurationModel.icon ? Image(systemName: "figure.handball") : nil
    }
    // swiftlint:enable accessibility_label_for_image
}
