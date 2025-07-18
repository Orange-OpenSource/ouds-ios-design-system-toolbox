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

struct SuggestionChipElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_chip_suggestionChip_label".localized()
        illustration = AnyView(EmptyView())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_chip_suggestionChip_description_text",
            version: OUDSVersions.componentChipVersion,
            demoScreen: AnyView(SuggestionChipPage()))
        )
    }
}
