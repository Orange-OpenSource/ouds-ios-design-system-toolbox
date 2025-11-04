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

import OUDSSwiftUI
import SwiftUI

struct SwitchElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            SwitchElement(),
            SwitchItemElement(),
        ]

        name = "app_components_switch_label".localized()
        illustration = AnyView(SwitchIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_switch_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

private struct SwitchIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedSmall) {
            #if !os(visionOS)
            // 🥜: dumb label, not vocalized, preventing warnings because of empty labels
            OUDSSwitch(isOn: .constant(true), accessibilityLabel: "🥜")
            OUDSSwitch(isOn: .constant(false), accessibilityLabel: "🥜")
            #else
            OUDSSwitch(isOn: .constant(true), accessibilityLabel: "🥜")
            #endif
        }
    }
}
