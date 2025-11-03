//
// Software Name: OUDSThemesContract iOS
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

import OUDSThemesContract
import OUDSTokensSemantic
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
            NavigationLink {
                element.pageDescription
            } label: {
                rowView(for: element)
            }

            #elseif os(visionOS)
            NavigationLink {
                element.pageDescription
                    .navigationTitle(element.name)
                    .navigationBarTitleDisplayMode(.large)
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
                .oudsForegroundStyle(theme.colors.contentDefault)
                .padding(.vertical, theme.spaces.fixedXsmall)
                .padding(.leading, theme.spaces.fixedMedium)
            Spacer()
            Image(systemName: "chevron.right")
                .oudsForegroundColor(theme.colors.contentDefault)
                .padding(layoutDirection == .rightToLeft ? .leading : .trailing, theme.spaces.fixedMedium)
                .accessibilityHidden(true)
                .scaleEffect(layoutDirection == .rightToLeft ? -1 : 1, anchor: .center)
        }
    }
}
