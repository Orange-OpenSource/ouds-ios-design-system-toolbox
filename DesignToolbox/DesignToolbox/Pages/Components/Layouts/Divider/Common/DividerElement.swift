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
import SwiftUI

struct DividerElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init(orientation: DividerConfigurationModel.Orientation) {
        let keyPattern = orientation == .horizontal ? "horizontalDivider" : "verticalDivider"
        let keyForName = "app_components_divider_\(keyPattern)_label"
        let keyForDescription = "app_components_divider_\(keyPattern)_description_text"

        name = keyForName.localized()
        illustration = AnyView(EmptyView())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: keyForDescription.localized(),
            version: OUDSVersions.componentDividerVersion,
            demoScreen: AnyView(DividerPage(orientation: orientation))))
    }
}
