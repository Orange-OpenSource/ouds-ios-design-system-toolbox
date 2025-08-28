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

struct ButtonElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_button_label".localized()
        illustration = AnyView(ButtonIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_button_description_text",
            version: OUDSVersions.componentButtonVersion,
            demoScreen: AnyView(ButtonPage())))
    }
}

private struct ButtonIllustration: View {

    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.spaceFixedSm) {
            // Dont translate default text for all
            OUDSButton(text: "Label", hierarchy: firstButtonHierarchy) {}
            OUDSButton(text: "Label", hierarchy: secondButtonHierarchy) {}
        }
    }

    private var firstButtonHierarchy: OUDSButton.Hierarchy {
        colorScheme == .light ? .strong : .default
    }

    private var secondButtonHierarchy: OUDSButton.Hierarchy {
        colorScheme == .light ? .default : .strong
    }
}
