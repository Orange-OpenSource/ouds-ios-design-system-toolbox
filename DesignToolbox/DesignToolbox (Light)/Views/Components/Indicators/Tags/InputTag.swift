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

struct InputTagView: View {

    var body: some View {
        WatchAndTVLayoutsView(watchLayout: { WatchVerticalLayout { layout } },
                              tvLayout: { TVVerticalLayout { layout } })
    }

    @ViewBuilder
    private var layout: some View {
        Text("Enabled").font(.headline)
        OUDSInputTag(label: "Input") {}
        Text("Disabled").font(.headline)
        OUDSInputTag(label: "Input") {}.disabled(true)
    }
}
