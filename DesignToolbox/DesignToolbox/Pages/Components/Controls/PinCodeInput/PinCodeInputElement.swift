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

#if !os(tvOS)

import OUDSSwiftUI
import SwiftUI

struct PinCodeInputElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_pinCodeInput_tech".localized()
        illustration = AnyView(PinCodeInputIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_pinCodeInput_description_text",
            version: OUDSVersions.componentPinCodeInputVersion,
            demoScreen: AnyView(PinCodeInputPage())))
    }
}

private struct PinCodeInputIllustration: View {

    @State private var pinCode: String = "123"

    var body: some View {
        OUDSPinCodeInput($pinCode, length: .six, helperText: String(localized: "app_components_pinCodeInputHelperText_label"))
    }
}

#endif
