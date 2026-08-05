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

struct AssistantCircularIndicatorView: View {

    var body: some View {
        WatchScrollLayoutView(title: "Assistant Circular Indicator",
                              layout: { WatchVerticalLayout { watchOSLayout } })
    }

    @ViewBuilder
    private var watchOSLayout: some View {
        OUDSAssistantCircularProgressIndicator()
    }
}
