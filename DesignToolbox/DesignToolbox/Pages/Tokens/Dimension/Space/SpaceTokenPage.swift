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
                header("app_tokens_dimension_space_scaled_tech")
            }
            Section { FixedSpaceProperty() } header: {
                header("app_tokens_dimension_space_fixed_tech")
            }
            Section { InsetSpaceProperty() } header: {
                header("app_tokens_dimension_space_inset_tech")
            }
            // Padding Space Tokens
            Section { PaddingInlineProperty() } header: {
                header("app_tokens_dimension_space_paddingInline_tech")
            }
            Section { PaddingBlockProperty() } header: {
                header("app_tokens_dimension_space_paddingBlock_tech")
            }
            // Gap Space Tokens
            Section { ColumnGapProperty() } header: {
                header("app_tokens_dimension_space_columnGap_tech")
            }
            Section { RowGapProperty() } header: {
                header("app_tokens_dimension_space_rowGap_tech")
            }
        }
        .gridMargin(.horizontal)
    }

    // MARK: Common helpers

    private func header(_ text: LocalizedStringKey) -> some View {
        OUDSHeading(text, size: .large, hasMarker: true)
    }
}
