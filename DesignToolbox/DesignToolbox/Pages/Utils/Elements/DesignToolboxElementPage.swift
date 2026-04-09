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
        #if os(iOS)
        elementPageBody
            .navigationBarMenus(title: name) // Otherwise does not appear
        #else // macOS, visionOS
        elementPageBody // Otherwise appears twice
        #endif
    }

    private var elementPageBody: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                if let illustration {
                    CardIllustration(illustration: illustration)
                        .accessibilityHidden(true)
                        .allowsTightening(true)
                }

                Text(LocalizedStringKey(description))
                    .bodyDefaultLarge(theme)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .accessibilityFocused($requestFocus)
                    .gridMargin(.horizontal)
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(Visibility.hidden)
            .background(theme.colors.bgPrimary)

            demoScreen
                .listRowInsets(EdgeInsets())
                .listRowSeparator(Visibility.hidden)
                .background(theme.colors.bgPrimary)

            if let version {
                HStack(alignment: .center, spacing: theme.spaces.fixedXsmall) {
                    Text("app_components_common_version_label")
                        .labelStrongLarge(theme)
                        .foregroundColor(theme.colors.contentDefault)

                    OUDSTag(label: version,
                            status: .info(leading: .none),
                            appearance: .muted,
                            shape: .rounded,
                            size: .small,
                            hasLoader: false)
                }
                .gridMargin(.horizontal)
                .padding(.bottom, theme.spaces.fixedMedium)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .listStyle(.plain)
        .padding(.top, theme.spaces.fixedNone)
        .background(theme.colors.bgPrimary)
        .requestAccessibleFocus(_requestFocus)
        #if !os(macOS)
            .oudsToolBarTop(name.localized())
        #endif
    }
}
