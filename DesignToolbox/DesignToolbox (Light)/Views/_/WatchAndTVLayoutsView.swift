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

/// Displays depending to the OS in use the given layout
struct WatchAndTVLayoutsView<WatchLayout: View, TVLayout: View>: View {

    let title: String?
    let watchLayout: WatchLayout
    let tvLayout: TVLayout

    init(title: String? = nil,
         @ViewBuilder watchLayout: () -> WatchLayout,
         @ViewBuilder tvLayout: () -> TVLayout)
    {
        self.title = title
        self.watchLayout = watchLayout()
        self.tvLayout = tvLayout()
    }

    var body: some View {
        if let title {
            ScrollView {
                #if os(tvOS)
                tvLayout
                #else
                watchLayout
                #endif
            }
            .navigationTitle(title)
        } else {
            ScrollView {
                #if os(tvOS)
                tvLayout
                #else
                watchLayout
                #endif
            }
        }
    }
}
