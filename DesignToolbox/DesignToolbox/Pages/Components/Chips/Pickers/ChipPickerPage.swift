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

// MARK: Chip page

struct ChipPickerPage: View {

    @StateObject private var configurationModel: ChipPickerConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: ChipPickerConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            ChipPickerDemo(configurationModel: configurationModel)
        } configurationView: {
            ChipPickerConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - ChipPicker Demo

struct ChipPickerDemo: View {

    @StateObject var configurationModel: ChipPickerConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        OUDSChipPicker(title: "Select your drink",
                       selection: $configurationModel.selected,
                       chips: configurationModel.drinks())
            .disabled(!configurationModel.enabled)
    }
}
