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

// NOTE: Several items below are seen as unused but are used
// This is a false positive in Periphy
// See https://github.com/peripheryapp/periphery/issues/908

#if os(macOS)
import AppKit
import SwiftUI

@MainActor
final class WindowManager: ObservableObject {

    private var windows: [String: WeakWindow] = [:]

    deinit {}

    private class WeakWindow {
        weak var window: NSWindow?

        init(_ window: NSWindow) {
            self.window = window
        }

        deinit {}
    }

    func openWindow(id: String, title: String, size: CGSize = CGSize(width: 800, height: 600), @ViewBuilder content: () -> some View) {
        closeWindow(id: id)

        let newWindow = NSWindow(
            contentRect: NSRect(origin: .zero, size: size),
            styleMask: [.titled, .closable, .resizable, .miniaturizable],
            backing: .buffered,
            defer: false)

        newWindow.title = title
        newWindow.center()
        newWindow.contentView = NSHostingView(rootView: content())
        newWindow.isReleasedWhenClosed = false

        windows[id] = WeakWindow(newWindow)
        newWindow.makeKeyAndOrderFront(nil)
    }

    func closeWindow(id: String) {
        guard let weakWindow = windows[id], let window = weakWindow.window else {
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
