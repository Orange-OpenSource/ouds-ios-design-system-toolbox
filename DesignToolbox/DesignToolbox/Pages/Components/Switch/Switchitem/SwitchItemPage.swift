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

// MARK: - Switch Item Page

struct SwitchItemPage: View {

    let model = ControlItemConfigurationModelBoolean(componentInitCode: "OUDSSwitchItem(isOn: $isOn")

    var body: some View {
        ControlItemElementPage(model: model) {
            SwitchItemDemo(model: model)
        }
    }
}

// MARK: - Switch Item Demo

private struct SwitchItemDemo: View {

    @ObservedObject var model: ControlItemConfigurationModelBoolean
    @Environment(\.theme) private var theme

    var body: some View {
        OUDSSwitchItem(model.labelText,
                       isOn: $model.isOn,
                       helper: model.helperText,
                       icon: icon,
                       flipIcon: model.flipIcon,
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
