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
        #elseif os(tvOS)
        // tvOS: no navigation bar chrome. Render a visible header with the page title
        // and the theme / color-scheme controls on top of the content, then post the
        // accessibility screen-changed notification via `oudsScreenTitle`.
        VStack(spacing: 0) {
            tvOSHeader
            elementPageBody
        }
        .background(theme.colors.bgPrimary)
        .oudsScreenTitle(name)
        #else // macOS, visionOS
        elementPageBody // Otherwise appears twice
        #endif
    }

    #if os(tvOS)
    private var tvOSHeader: some View {
        HStack(spacing: 24) {
            Text(LocalizedStringKey(name))
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(theme.colors.contentDefault)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            Spacer()
            ThemeSelectionButton()
            ColorSchemeSelectionButton()
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 12)
        .focusSection()
    }
    #endif

    /// Anchor id used by the tvOS `ScrollViewReader` to reset the scroll offset
    /// to the top of the page whenever it appears — otherwise tvOS may open the
    /// page already scrolled to whatever focusable item it chose as initial
    /// focus target (typically an element in the configuration panel).
    private static let tvOSTopAnchorID = "designToolboxElementPage.top"

    private var elementPageBody: some View {
        ScrollViewReader { proxy in
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
                .id(Self.tvOSTopAnchorID)
                .listRowInsets(EdgeInsets())
                #if !os(tvOS)
                .listRowSeparator(Visibility.hidden) // `listRowSeparator` unavailable on tvOS
                #endif
                .background(theme.colors.bgPrimary)

                demoScreen
                    .listRowInsets(EdgeInsets())
                    #if !os(tvOS)
                    .listRowSeparator(Visibility.hidden)
                    #endif
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
            #if os(tvOS)
            .onAppear {
                // Defer to the next runloop tick so the layout is settled before
                // we ask the ScrollView to reset its offset.
                DispatchQueue.main.async {
                    withAnimation(.none) {
                        proxy.scrollTo(Self.tvOSTopAnchorID, anchor: .top)
                    }
                }
            }
            #endif
            #if !os(macOS) && !os(tvOS)
                // OUDS `toolBarTop` modifier is not available on tvOS; on tvOS the top tab bar
                // is provided natively by SwiftUI's `TabView` and the navigation title is
                // handled by `.oudsNavigationTitle` further up the hierarchy.
                .toolBarTop(name.localized())
            #endif
        }
    }
}
