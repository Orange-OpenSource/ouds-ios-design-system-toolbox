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

struct SizesView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchAndTVLayoutsView(watchLayout: { WatchVerticalLayout { watchLayout } },
                              tvLayout: { TVVerticalLayout { tvLayout } })
    }

    // MARK: - watchOS

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            Text("Decorative").font(.headline)
            VStack(alignment: .center, spacing: theme.spaces.fixedNone) {
                ForEach(NamedSize.IconDecorative.allCases, id: \.rawValue) { namedSize in
                    SizeTokenPage.IllustrationIconDecorative(namedSize: namedSize)
                }
            }
            Text("Typography").font(.headline)
            VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                ForEach(NamedSize.iconSizeByTypographyCategories, id: \.namedFont) { category in
                    SizeTokenPage.IllustrationSizeIconByTypographyCategory(category: category)
                }
            }
        }
    }

    // MARK: - tvOS

    @ViewBuilder
    private var tvLayout: some View {
        HStack(alignment: .top, spacing: theme.spaces.paddingBlock4xlarge) {
            VStack(spacing: theme.spaces.fixedNone) {
                Text("Decorative").font(.headline)
                ForEach(NamedSize.IconDecorative.allCases, id: \.rawValue) { namedSize in
                    SizeTokenPage.IllustrationIconDecorative(namedSize: namedSize).focusable()
                }
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .padding()

            VStack(spacing: theme.spaces.fixedMedium) {
                Text("Typography").font(.headline)
                ForEach(NamedSize.iconSizeByTypographyCategories, id: \.namedFont) { category in
                    SizeTokenPage.IllustrationSizeIconByTypographyCategory(category: category).focusable()
                }
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .padding()
        }
        .padding()
    }
}
