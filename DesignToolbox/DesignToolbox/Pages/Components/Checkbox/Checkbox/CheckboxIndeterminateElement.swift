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

import SwiftUI

/// Related to `OUDSCheckboxIndeterminate` (i.e. with 3 available values).
struct CheckboxIndeterminateElement: DesignToolboxElement {
    let name: String
    let image: Image
    let pageDescription: AnyView

    init() {
        name = "app_components_checkbox_indeterminateCheckbox_label".localized()
        image = Image(decorative: "il_component_checkbox").renderingMode(.original)
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            image: nil,
            description: "app_components_checkbox_indeterminateCheckbox_description_text",
            illustration: AnyView(CheckboxIndeterminatePage())))
    }
}
