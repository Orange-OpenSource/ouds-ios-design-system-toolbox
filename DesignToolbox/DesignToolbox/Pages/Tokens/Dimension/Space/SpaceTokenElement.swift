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

struct SpaceTokenElement: DesignToolboxElement {
    let name: String
    let image: Image
    let pageDescription: AnyView

    init() {
        name = "app_tokens_dimension_space_label".localized()
        image = Image(decorative: "ic_dimension").renderingMode(.template)
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            image: Image(decorative: "ic_dimension").renderingMode(.template),
            description: "app_tokens_dimension_space_description_text",
            illustration: AnyView(SpaceTokenPage())))
    }
}
