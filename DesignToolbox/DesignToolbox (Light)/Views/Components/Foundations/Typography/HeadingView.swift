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

struct HeadingView: View {

    private static let allSizes: [OUDSHeading.Size] = [.xLarge, .large, .medium, .small]

    var body: some View {
        WatchScrollLayoutView(title: "Heading", layout: { watchLayout })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            ForEach(Self.allSizes, id: \.self) { size in
                Text("Size \(String(describing: size))").font(.subheadline)
                OUDSHeading(text: "Aa", size: size)
            }

            // The marker is only rendered by `OUDSHeading` when the theme supports it
            // (e.g. Orange, Orange Compact, Wireframe, but not Sosh).
            Text("Large with marker").font(.subheadline)
            OUDSHeading(text: "Aa", size: .large, hasMarker: true)

            // Only meaningful for `size == .large`; ignored (with a warning) by themes
            // that do not provide a valid `contentBrandSecondary` color (e.g. Orange, Orange Compact).
            Text("Colored substring").font(.subheadline)
            OUDSHeading(text: "Welcome to Sosh", coloredText: "Sosh")
        }
    }
}
