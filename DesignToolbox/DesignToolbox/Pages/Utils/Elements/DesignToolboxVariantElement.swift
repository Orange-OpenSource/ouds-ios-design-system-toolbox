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

struct DesignToolboxVariantElement: View {

    let elements: [DesignToolboxElement]

    @Environment(\.theme) private var theme
    @Environment(\.layoutDirection) private var layoutDirection

    #if os(macOS)
    @AppStorage("colorSchemeMode") private var mode: String = ColorSchemeMode.auto.rawValue
    @EnvironmentObject private var windowManager: WindowManager
    @EnvironmentObject private var lowPowerModeObserver: OUDSLowPowerModeObserver

    private var colorScheme: ColorScheme? {
        if mode == ColorSchemeMode.light.rawValue {
            return .light
        }
        if mode == ColorSchemeMode.dark.rawValue {
            return .dark
        }
        return nil
    }
    #endif

    // MARK: Body

    var body: some View {
        ForEach(elements, id: \.id) { element in
            #if os(iOS)
            OUDSNavigationLink(LocalizedStringKey(element.name), isBoldLabel: true, affordanceType: .next) {
                element.pageDescription
            }
            #elseif os(visionOS)
            NavigationLink {
                element.pageDescription
                    .navigationTitle(element.name)
                    .navigationBarTitleDisplayMode(.large)
            } label: {
                rowView(for: element)
            }
            #elseif os(tvOS)
            NavigationLink {
                // The destination is a `DesignToolboxElementPage`, whose `tvOSHeader`
                // already renders the title alongside the theme / color-scheme controls,
                // and `oudsScreenTitle` posts the accessibility screen-changed
                // notification. Setting `.navigationTitle` here would render a second
                // visible copy of the title (tvOS renders it as inline text, not chrome).
                element.pageDescription
            } label: {
                rowView(for: element)
            }
            #else // macOS
            Button {
                windowManager.openWindow(
                    id: "element-\(element.id)",
                    title: element.name)
                {
                    NavigationStack {
                        element.pageDescription
                            .navigationTitle(element.name)
                            .environment(\._theme, theme)
                            .preferredColorScheme(colorScheme)
                            .environmentObject(lowPowerModeObserver)
                    }
                }
            } label: {
                rowView(for: element)
            }
            .buttonStyle(.plain)
            #endif
        }
    }

    // MARK: - Helper

    private func rowView(for element: DesignToolboxElement) -> some View {
        HStack {
            Text(LocalizedStringKey(element.name))
                .headingMedium(theme)
                .multilineTextAlignment(.leading)
                .foregroundStyle(theme.colors.contentDefault)
                .padding(.vertical, theme.spaces.fixedXsmall)
                .gridMargin(.leading)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(theme.colors.contentDefault)
                .gridMargin(layoutDirection == .rightToLeft ? .leading : .trailing)
                .accessibilityHidden(true)
                .scaleEffect(layoutDirection == .rightToLeft ? -1 : 1, anchor: .center)
        }
    }
}
