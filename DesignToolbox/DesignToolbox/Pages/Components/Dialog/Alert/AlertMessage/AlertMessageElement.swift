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

struct AlertMessageElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_alert_alertMessage_label".localized()
        illustration = AnyView(AlertMessageIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_alert_alertMessage_description_text",
            version: OUDSVersions.componentAlertMessageVersion,
            demoScreen: AnyView(AlertMessagePage())))
    }
}

private struct AlertMessageIllustration: View {

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(spacing: theme.spaces.fixedSmall) {
            #if !os(visionOS)
            OUDSAlertMessage(label: "Label", status: .negative(showIcon: false))
            #endif
        }
    }
}
