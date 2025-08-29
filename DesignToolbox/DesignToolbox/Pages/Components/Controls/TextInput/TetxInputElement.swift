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

struct TextInputElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_textInput_label".localized()
        illustration = AnyView(TextInputIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_textInput_description_text",
            version: OUDSVersions.componentTextInputVersion,
            demoScreen: AnyView(TextInputPage()))
        )
    }
}

private struct TextInputIllustration: View {

    @State private var text: String = ""

    var body: some View {
        OUDSTextInput(label: "Label", text: $text)
    }
}
