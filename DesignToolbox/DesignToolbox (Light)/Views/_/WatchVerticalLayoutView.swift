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

struct WatchVerticalLayout<WatchLayout: View>: View {

    private let watchLayout: WatchLayout

    @Environment(\.theme) private var theme

    init(@ViewBuilder watchLayout: () -> WatchLayout) {
        self.watchLayout = watchLayout()
    }

    var body: some View {
        VStack(spacing: theme.spaces.scaledXsmallMobile) {
            watchLayout
        }
    }
}
