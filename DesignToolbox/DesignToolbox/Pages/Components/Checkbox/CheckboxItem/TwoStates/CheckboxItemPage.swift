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

    let model = BooleanControlItemConfigurationModel(componentInitCode: "OUDSCheckboxItem(isOn: $isOn,")

    var body: some View {
        ControlItemElementPage(model: model) {
            CheckboxItemDemo(model: model)
        }
    }
}

// MARK: - Checkbox Item Demo

private struct CheckboxItemDemo: View {

    @ObservedObject var model: BooleanControlItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        OUDSCheckboxItem(isOn: $model.isOn,
                         label: model.labelText,
                         helper: model.helperText,
                         icon: icon,
                         flipIcon: model.flipIcon,
                         isReversed: model.isReversed,
                         isError: model.isError,
                         isReadOnly: model.isReadOnly,
                         hasDivider: model.divider)
            .disabled(!model.enabled)
            .padding(.all, theme.spaces.spaceFixedMd)
            .designToolboxColoredSurface(false)
    }

    // Need here that system name, a11y managed in component
    // swiftlint:disable accessibility_label_for_image
    private var icon: Image? {
        model.icon ? Image(systemName: "figure.handball") : nil
    }
    // swiftlint:enable accessibility_label_for_image
}
