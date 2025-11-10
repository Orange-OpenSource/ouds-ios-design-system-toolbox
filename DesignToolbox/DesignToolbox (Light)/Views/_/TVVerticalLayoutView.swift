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

/// Displays content as vertical layout for tvOS dimensions
struct TVVerticalLayout<TVLayout: View>: View {

    private let tvLayout: TVLayout

    @Environment(\.theme) private var theme

    init(@ViewBuilder tvLayout: () -> TVLayout) {
        self.tvLayout = tvLayout()
    }

    var body: some View {
        VStack(spacing: theme.spaces.scaledMediumMobile) {
            tvLayout
        }
    }
}
