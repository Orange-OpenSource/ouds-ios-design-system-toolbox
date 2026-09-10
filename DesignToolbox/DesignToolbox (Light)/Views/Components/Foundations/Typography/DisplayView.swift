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

struct DisplayView: View {

    private static let allSizes: [OUDSDisplay.Size] = [.large, .medium, .small]

    var body: some View {
        WatchScrollLayoutView(title: "Display", layout: { watchLayout })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            ForEach(Self.allSizes, id: \.self) { size in
                Text("Size \(String(describing: size))").font(.subheadline)
                OUDSDisplay(text: "Aa", size: size)
            }
        }
    }
}
