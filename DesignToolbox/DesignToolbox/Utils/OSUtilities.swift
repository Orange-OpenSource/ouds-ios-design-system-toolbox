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

import SwiftUI

/// An utility object to manage basic features depending to the OS
enum OSUtilities {

    // MARK: - Clipboard

    /// - Parameter content: The string to copy in the clipboard
    static func copy(content: String) {
        #if os(iOS)
        let pasteboard = UIPasteboard.general
        pasteboard.string = content
        #else // macOS
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(content, forType: .string)
        #endif
    }

    // MARK: - URL

    /// - Parameter url: The URL to open
    static func open(url asString: String) {
        open(url: URL(string: asString)!)
    }

    /// - Parameter url: The URL to open
    static func open(url asURL: URL) {
        #if os(iOS)
        UIApplication.shared.open(asURL)
        #else // macOS
        NSWorkspace.shared.open(asURL)
        #endif
    }
}
