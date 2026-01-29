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

struct PasswordInputElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_passwordInput_label".localized()
        illustration = AnyView(PasswordInputIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_passwordInput_description_text",
            version: OUDSVersions.componentPasswordInputVersion,
            demoScreen: AnyView(PasswordInputPage())))
    }
}

private struct PasswordInputIllustration: View {

    @State private var text: String = ""

    var body: some View {
        OUDSPasswordInput(label: "Label",
                      text: $text,
                      helperText: String(localized: "app_components_passwordInputHelperText_label"))
    }
}
