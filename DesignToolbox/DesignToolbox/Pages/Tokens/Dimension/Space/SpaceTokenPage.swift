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

// MARK: - Space Token Page

struct SpaceTokenPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        Group {
            #if !os(tvOS) && !os(watchOS)
            // SizeTokenPage.swift file imported in watchOS and tvOS targets
            // But for the Design Toolbox Light app no code section
            Section {
                DesignToolboxCode(code: "theme.scaledMd.dimension(for: horizontalSizeClass ?? .regular)", titleText: "app_tokens_common_viewCodeExample_label")
            }
            #endif
            // Basic Space Tokens
            Section { ScaledSpaceProperty() } header: {
                header("app_tokens_dimension_space_scaled_label")
            }
            Section { FixedSpaceProperty() } header: {
                header("app_tokens_dimension_space_fixed_label")
            }
            // Padding Sapce Tokens
            Section { PaddingInlineProperty() } header: {
                header("app_tokens_dimension_space_paddingInline_label")
            }
            Section { PaddingInsetProperty() } header: {
                header("app_tokens_dimension_space_paddingInset_label")
            }
            Section { PaddingBlockProperty() } header: {
                header("app_tokens_dimension_space_paddingBlock_label")
            }
            // Gap Space Tokens
            Section { ColumnGapProperty() } header: {
                header("app_tokens_dimension_space_columnGap_label")
            }
            Section { RowGapProperty() } header: {
                header("app_tokens_dimension_space_rowGap_label")
            }
        }
        .padding(.horizontal, theme.spaces.fixedMedium)
    }

    // MARK: Common helpers

    private func header(_ text: LocalizedStringKey) -> some View {
        Text(text).designToolboxSectionHeaderStyle()
    }
}
