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

/// Using Swift files from DesignToolbox folder, displays simply the sizes tokens
struct SizesView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(layout: { WatchVerticalLayout { watchLayout } })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            Text("Decorative").font(.headline)
            VStack(alignment: .center, spacing: theme.spaces.fixedNone) {
                ForEach(NamedSize.IconDecorative.allCases, id: \.rawValue) { namedSize in
                    IllustrationIconDecorative(namedSize: namedSize)
                }
            }
            Text("Typography").font(.headline)
            VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                ForEach(NamedSize.iconSizeByTypographyCategories, id: \.namedFont) { category in
                    IllustrationSizeIconByTypographyCategory(category: category)
                }
            }
        }
    }
}
