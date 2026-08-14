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

struct CodeView: View {

    var body: some View {
        WatchScrollLayoutView(title: "Code", layout: { watchLayout })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            OUDSCode(text: "let x = 42")
        }
    }
}
