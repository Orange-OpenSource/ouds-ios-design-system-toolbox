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

struct CheckboxElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            CheckboxElement(),
            CheckboxItemElement(),
            CheckboxIndeterminateElement(),
            CheckboxItemIndeterminateElement(),
            CheckboxPickerElement(),
        ]

        name = "app_components_checkbox_label".localized()
        illustration = AnyView(CheckboxIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: AnyView(CheckboxIllustration()),
            description: "app_components_checkbox_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

private struct CheckboxIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.spaceFixedNone) {
            OUDSCheckbox(isOn: .constant(true), accessibilityLabel: "")
            OUDSCheckbox(isOn: .constant(false), accessibilityLabel: "")
        }
    }
}
