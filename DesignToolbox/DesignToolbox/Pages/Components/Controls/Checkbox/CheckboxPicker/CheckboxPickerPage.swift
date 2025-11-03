//
// Software Name: OUDSThemesContract iOS
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

import OUDSComponents
import OUDSThemesContract
import SwiftUI

// MARK: - Checkbox Picker Page

struct CheckboxPickerPage: View {

    @StateObject private var configurationModel: CheckboxPickerConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CheckboxPickerConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CheckboxPickerDemo(configurationModel: configurationModel)
        } configurationView: {
            CheckboxPickerConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Checkbox Picker Demo

private struct CheckboxPickerDemo: View {

    @State private var selections: [String] = []
    @ObservedObject var configurationModel: CheckboxPickerConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .center) {
            OUDSCheckboxPicker(selections: $selections,
                               checkboxes: configurationModel.populate(),
                               placement: configurationModel.pickerPlacement,
                               isReversed: configurationModel.isReversed,
                               isError: configurationModel.isError,
                               isReadOnly: configurationModel.isReadOnly,
                               hasDivider: configurationModel.hasDivider)
                .padding([.trailing, .leading], theme.spaces.paddingInlineSmall)
                .disabled(!configurationModel.isEnabled)
        }
    }
}
