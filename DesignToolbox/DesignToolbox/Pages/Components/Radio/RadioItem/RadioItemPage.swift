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

// MARK: - Radio Item Page

struct RadioItemPage: View {

    private let model: BooleanControlItemConfigurationModel

    init() {
        model = BooleanControlItemConfigurationModel(componentInitCode: "OUDSRadioItem(isOn: $isOn",
                                                     outlinedConfiguration: (value: false,
                                                                             outlinedConfigurationLabel: "app_components_radioButton_radioButtonItem_outlined_label"),
                                                     additionalLabelConfiguration: "app_components_radioButton_radioButtonItem_additionalLabel_label".localized())
    }

    var body: some View {
        ControlItemElementPage(model: model) {
            RadioItemDemo(model: model)
        }
    }
}

// MARK: - Radio Item Demo

private struct RadioItemDemo: View {

    @ObservedObject var model: BooleanControlItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        OUDSRadioItem(isOn: $model.isOn,
                      label: model.labelText,
                      additionalLabel: model.additionalLabelText,
                      helper: model.helperText,
                      icon: icon,
                      flipIcon: model.flipIcon,
                      isOutlined: model.outlined,
                      isReversed: model.isReversed,
                      isError: model.isError,
                      isReadOnly: model.isReadOnly,
                      hasDivider: model.divider)
            .disabled(!model.enabled)
            .padding(.all, theme.spaces.spaceFixedMedium)
            .designToolboxColoredSurface(false)
    }

    // Need here that system name, a11y managed in component
    // swiftlint:disable accessibility_label_for_image
    private var icon: Image? {
        model.icon ? Image(systemName: "figure.handball") : nil
    }
    // swiftlint:enable accessibility_label_for_image
}
