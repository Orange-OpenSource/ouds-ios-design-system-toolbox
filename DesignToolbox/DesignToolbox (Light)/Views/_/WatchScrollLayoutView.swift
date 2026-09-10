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

/// Displays the given layout in a `ScrollView`
struct WatchScrollLayoutView<WatchLayout: View>: View {

    let title: String?
    let layout: WatchLayout

    init(title: String? = nil,
         @ViewBuilder layout: () -> WatchLayout)
    {
        self.title = title
        self.layout = layout()
    }

    var body: some View {
        if let title {
            ScrollView {
                layout
            }
            .navigationTitle(title)
        } else {
            ScrollView {
                layout
            }
        }
    }
}
