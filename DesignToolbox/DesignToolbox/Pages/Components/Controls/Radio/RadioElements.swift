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

struct RadioElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            RadioElement(),
            RadioItemElement(),
            RadioPickerElement(),
        ]

        name = "app_components_radioButton_label".localized()
        illustration = AnyView(RadioIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_radioButton_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

private struct RadioIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedNone) {
            // 🥜: dumb label, not vocalized, preventing warnings because of empty labels
            #if !os(visionOS)
            OUDSRadio(isOn: .constant(false), accessibilityLabel: "🥜")
            OUDSRadio(isOn: .constant(false), accessibilityLabel: "🥜")
            #else
            OUDSRadio(isOn: .constant(false), accessibilityLabel: "🥜")
            #endif
        }
    }
}
