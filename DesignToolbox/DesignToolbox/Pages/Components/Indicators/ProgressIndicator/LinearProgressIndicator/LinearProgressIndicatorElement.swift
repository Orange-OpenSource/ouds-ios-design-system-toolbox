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

struct LinearProgressIndicatorElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_progressIndicator_linear_tech".localized()
        illustration = AnyView(LinearProgressIndicatorIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_progressIndicator_linear_description_text",
            version: OUDSVersions.componentProgressIndicatorVersion,
            demoScreen: AnyView(LinearProgressIndicatorPage())))
    }
}

private struct LinearProgressIndicatorIllustration: View {

    var body: some View {
        OUDSLinearProgressIndicator(progress: 0.75, animated: false)
            .frame(maxWidth: 120)
    }
}
