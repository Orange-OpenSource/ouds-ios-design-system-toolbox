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

import OUDS
import OUDSTokensSemantic
import SwiftUI

/// Used to present the element in same layout with:
/// - a text for the description
/// - an optional image to illustrate the element
/// - a name as title of the page
/// - illustration to present all aspects of the element
struct DesignToolboxElementPage: View {

    @AccessibilityFocusState private var requestFocus: Bool
    @Environment(\.theme) private var theme

    // MARK: Stored Properties

    let name: String
    let illustration: AnyView?
    let description: String
    let version: String?
    let demoScreen: AnyView

    // swiftlint:disable function_default_parameter_at_end
    init(name: String, illustration: AnyView? = nil, description: String, version: String? = nil, demoScreen: AnyView) {
        self.name = name
        self.illustration = illustration
        self.description = description
        self.version = version
        self.demoScreen = demoScreen
    }

    // swiftlint:enable function_default_parameter_at_end

    // MARK: Body

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
                if let illustration {
                    CardIllustration(illustration: illustration)
                        .accessibilityHidden(true)
                        .allowsTightening(true)
                }

                Text(LocalizedStringKey(description))
                    .typeBodyDefaultLarge(theme)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .accessibilityFocused($requestFocus)
                    .padding(.horizontal, theme.spaces.spaceFixedMd)
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(Visibility.hidden)
            .padding(.horizontal, theme.spaces.spaceFixedNone)
            .padding(.bottom, theme.spaces.spaceFixedMd)
            .oudsBackground(theme.colors.colorBgPrimary)

            demoScreen
                .listRowInsets(EdgeInsets())
                .listRowSeparator(Visibility.hidden)
                .padding(.bottom, theme.spaces.spaceFixedMd)
                .oudsBackground(theme.colors.colorBgPrimary)

            if let version {
                HStack {
                    Spacer()
                    Text("app_common_design_version" <- version)
                        .typeLabelDefaultSmall(theme)
                    Spacer()
                }
                .padding(.bottom, theme.spaces.spaceFixedMd)
            }
        }
        .listStyle(.plain)
        .padding(.top, theme.spaces.spaceFixedNone)
        .padding(.horizontal, theme.spaces.spaceFixedNone)
        .oudsBackground(theme.colors.colorBgPrimary)
        .navigationTitle(name.localized())
        .navigationbarMenuForThemeSelection()
        .oudsRequestAccessibleFocus(_requestFocus)
    }
}
