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

// MARK: - Border Token Page View

struct BorderTokenPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                    DesignToolboxCode(code: "theme.borders.widthDefault", titleText: "app_tokens_common_viewCodeExample_label")
                }
            }

            BorderWidthSection()
            BorderRadiusSection()
            BorderStyleSection()
        }
        .gridMargin(.horizontal)
    }
}

// MARK: - Border Width Section View

private struct BorderWidthSection: View {

    @Environment(\.theme) private var theme

    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                ForEach(NamedBorderWidth.allCases, id: \.rawValue) { namedWidth in
                    IllustrationWidth(namedWidth: namedWidth)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } header: {
            OUDSHeading("app_tokens_border_width_tech", size: .large, hasMarker: true)
                .foregroundStyle(theme.colors.contentDefault)
        }
    }
}

// MARK: - Border Radius Section View

private struct BorderRadiusSection: View {

    @Environment(\.theme) private var theme

    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                ForEach(NamedBorderRadius.allCases, id: \.rawValue) { namedRadius in
                    IllustrationRadius(namedRadius: namedRadius)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } header: {
            OUDSHeading("app_tokens_border_radius_tech", size: .large, hasMarker: true)
                .foregroundStyle(theme.colors.contentDefault)
        }
    }
}

// MARK: - Border Style Section View

private struct BorderStyleSection: View {

    @Environment(\.theme) private var theme

    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                ForEach(NamedBorderStyle.allCases, id: \.rawValue) { namedStyle in
                    IllustrationStyle(namedStyle: namedStyle)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } header: {
            OUDSHeading("app_tokens_border_style_tech", size: .large, hasMarker: true)
                .foregroundStyle(theme.colors.contentDefault)
        }
    }
}

#if os(iOS)
// MARK: - Border Token Detail Page View

/// Owns its scrolling so the arrangement is never embedded in the demo's shared ScrollView.
/// Dedicated to iPhone Duo layouts
@available(iOS 27.1, *)
struct BorderTokenDetailPage: View {

    let illustration: AnyView

    @AccessibilityFocusState private var requestFocus: Bool
    @Environment(\.theme) private var theme
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        GeometryReader { geometry in
            if horizontalSizeClass == .regular, geometry.size.width > geometry.size.height {
                ArrangementView {
                    ScrollView {
                        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                            DesignToolboxElementIntroduction(illustration: illustration,
                                                             description: "app_tokens_border_description_text",
                                                             focus: $requestFocus)
                            VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                                DesignToolboxCode(code: "theme.borders.widthDefault", titleText: "app_tokens_common_viewCodeExample_label")
                                BorderWidthSection()
                            }
                            .gridMargin(.horizontal)
                        }
                    }
                } secondary: {
                    ScrollView {
                        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                            BorderRadiusSection()
                            BorderStyleSection()
                        }
                        .gridMargin(.horizontal)
                    }
                }
                .arrangementViewStyle(.split.axes(.horizontal))
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                        DesignToolboxElementIntroduction(illustration: illustration,
                                                         description: "app_tokens_border_description_text",
                                                         focus: $requestFocus)
                        BorderTokenPage()
                    }
                }
            }
        }
        .background(theme.colors.bgPrimary)
        .navigationBarMenus(title: "app_tokens_border_tech".localized())
        .requestAccessibleFocus(_requestFocus)
    }
}
#endif
