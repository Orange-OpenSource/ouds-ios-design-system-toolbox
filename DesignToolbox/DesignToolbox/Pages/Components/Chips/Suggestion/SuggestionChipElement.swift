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

<<<<<<< HEAD
import OUDS
=======
>>>>>>> 2e42ea7 (feat: Add SuggestionChip demo)
import SwiftUI

struct SuggestionChipElement: DesignToolboxElement {
    let name: String
    let image: Image
    let pageDescription: AnyView

    init() {
        name = "app_components_chip_suggestionChip_label".localized()
        image = Image(decorative: "il_component_chip").renderingMode(.original)
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            image: nil,
            description: "",
<<<<<<< HEAD
            version: OUDSVersions.componentChipVersion,
=======
>>>>>>> 2e42ea7 (feat: Add SuggestionChip demo)
            illustration: AnyView(SuggestionChipPage()))
        )
    }
}
