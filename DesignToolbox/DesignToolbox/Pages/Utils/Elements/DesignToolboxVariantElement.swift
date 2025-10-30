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

struct DesignToolboxVariantElement: View {

    @Environment(\.theme) private var theme
    @Environment(\.layoutDirection) private var layoutDirection
    #if os(macOS)
    @EnvironmentObject private var windowManager: WindowManager
    @EnvironmentObject private var lowPowerModeObserver: OUDSLowPowerModeObserver

    @AppStorage("colorSchemeMode") private var mode: String = ColorSchemeMode.auto.rawValue
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

    // MARK: Stored properties

    let elements: [DesignToolboxElement]

    // MARK: Body

    var body: some View {
        ForEach(elements, id: \.id) { element in
            #if os(iOS)
            NavigationLink {
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

#if os(macOS)
import AppKit

@MainActor
class WindowManager: ObservableObject {
    private var windows: [String: WeakWindow] = [:]

    private class WeakWindow {
        weak var window: NSWindow?

        init(_ window: NSWindow) {
            self.window = window
        }
    }

    func openWindow(
        id: String,
        title: String,
        size: CGSize = CGSize(width: 800, height: 600),
        @ViewBuilder content: () -> some View)
    {
        // Fermer la fenêtre existante si elle existe
        closeWindow(id: id)

        let newWindow = NSWindow(
            contentRect: NSRect(origin: .zero, size: size),
            styleMask: [.titled, .closable, .resizable, .miniaturizable],
            backing: .buffered,
            defer: false)

        newWindow.title = title
        newWindow.center()
        newWindow.contentView = NSHostingView(rootView: content())

        // Empêcher la libération automatique
        newWindow.isReleasedWhenClosed = false

        windows[id] = WeakWindow(newWindow)
        newWindow.makeKeyAndOrderFront(nil)
    }

    func closeWindow(id: String) {
        guard let weakWindow = windows[id],
              let window = weakWindow.window
        else {
            windows.removeValue(forKey: id)
            return
        }

        window.close()
        windows.removeValue(forKey: id)
    }

    func cleanupClosedWindows() {
        windows = windows.compactMapValues { weakWindow in
            guard let window = weakWindow.window, window.isVisible else {
                return nil
            }
            return weakWindow
        }
    }
}
#endif
