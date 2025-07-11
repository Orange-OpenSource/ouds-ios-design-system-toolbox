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

/// Related to `OUDSCheckboxItem` (i.e. with 2 available values).
struct CheckboxItemElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_checkbox_checkboxItem_label".localized()
        illustration = AnyView(EmptyView())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: nil,
            description: "app_components_checkbox_controlItem_description_text",
            version: OUDSVersions.componentCheckboxVersion,
            demoScreen: AnyView(CheckboxItemPage())))
    }
}
