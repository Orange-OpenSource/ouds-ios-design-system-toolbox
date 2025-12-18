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

// MARK: - Size Token Page

struct SizeTokenPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        Group {
            Section {
                DesignToolboxCode(code: "theme.iconWithHeadingXLargeSm.dimension(for: horizontalSizeClass ?? .regular)",
                                  titleText: "app_tokens_common_viewCodeExample_label")
            }

            Section {
                VStack(alignment: .center, spacing: theme.spaces.fixedNone) {
                    ForEach(NamedSize.IconDecorative.allCases, id: \.rawValue) { namedSize in
                        IllustrationIconDecorative(namedSize: namedSize)
                    }
                }
            } header: {
                sectionHeader("app_tokens_dimension_size_iconDecorative_label")
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                    ForEach(NamedSize.iconSizeByTypographyCategories, id: \.namedFont) { category in
                        IllustrationSizeIconByTypographyCategory(category: category)
                    }
                }
            } header: {
                sectionHeader("app_tokens_dimension_size_iconWith_label")
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                    ForEach(NamedSize.MaxWidth.allCases, id: \.rawValue) { namedSize in
                        IllustrationMaxWidth(namedSize: namedSize)
                    }
                }
            } header: {
                sectionHeader("app_tokens_dimension_size_maxWidth_label")
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                    ForEach(NamedSize.MinWidth.allCases, id: \.rawValue) { namedSize in
                        IllustrationMinWidth(namedSize: namedSize)
                    }
                }
            } header: {
                sectionHeader("app_tokens_dimension_size_minInteractiveArea_label")
            }
        }
        .padding(.horizontal, theme.spaces.fixedMedium)
    }

    private func sectionHeader(_ text: LocalizedStringKey) -> some View {
        Text(text).designToolboxSectionHeaderStyle()
    }
}
