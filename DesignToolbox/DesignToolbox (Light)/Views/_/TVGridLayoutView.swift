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

struct TVGridLayout<TVLayout: View>: View {

    private let count: Int
    private let tvLayout: TVLayout

    @Environment(\.theme) private var theme

    init(count: Int, @ViewBuilder tvLayout: () -> TVLayout) {
        self.count = count
        self.tvLayout = tvLayout()
    }

    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: count), spacing: theme.spaces.paddingBlock4xlarge) {
            tvLayout
        }
    }
}
