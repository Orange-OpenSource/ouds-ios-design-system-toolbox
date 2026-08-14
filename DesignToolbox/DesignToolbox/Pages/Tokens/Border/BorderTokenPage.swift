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

struct BorderTokenPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                    DesignToolboxCode(code: "theme.borders.widthDefault", titleText: "app_tokens_common_viewCodeExample_label")
                }
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                    ForEach(NamedBorderWidth.allCases, id: \.rawValue) { namedWidth in
                        IllustrationWidth(namedWidth: namedWidth)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } header: {
                OUDSHeading("app_tokens_border_width_tech", size: .large, hasMarker: true)
                    .foregroundStyle(theme.colors.contentDefault)
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                    ForEach(NamedBorderRadius.allCases, id: \.rawValue) { namedRadius in
                        IllustrationRadius(namedRadius: namedRadius)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } header: {
                OUDSHeading("app_tokens_border_radius_tech", size: .large, hasMarker: true)
                    .foregroundStyle(theme.colors.contentDefault)
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                    ForEach(NamedBorderStyle.allCases, id: \.rawValue) { namedStyle in
                        IllustrationStyle(namedStyle: namedStyle)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } header: {
                OUDSHeading("app_tokens_border_style_tech", size: .large, hasMarker: true)
                    .foregroundStyle(theme.colors.contentDefault)
            }
        }
        .gridMargin(.horizontal)
    }
}
