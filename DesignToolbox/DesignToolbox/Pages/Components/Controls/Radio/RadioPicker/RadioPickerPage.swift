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

// MARK: - Radio Picker Page

struct RadioPickerPage: View {

    @StateObject private var configurationModel: RadioPickerConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: RadioPickerConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            RadioPickerDemo(configurationModel: configurationModel)
        } configurationView: {
            RadioPickerConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Radio Picker Demo

private struct RadioPickerDemo: View {

    @State private var selection: String = "Choice_1" // cf configurationModel.populate()
    @ObservedObject var configurationModel: RadioPickerConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .center) {
            OUDSRadioPicker(selection: $selection,
                            radios: configurationModel.populate(),
                            placement: configurationModel.pickerPlacement,
                            isOutlined: configurationModel.isOutlined,
                            isReversed: configurationModel.isReversed,
                            isError: configurationModel.isError,
                            isReadOnly: configurationModel.isReadOnly,
                            hasDivider: configurationModel.hasDivider)
                .padding([.trailing, .leading], theme.spaces.paddingInlineSmall)
                .disabled(!configurationModel.isEnabled)
        }
    }
}
