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
        #elseif os(macOS)
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(content, forType: .string)
        #endif
    }

    // MARK: - URL

    // swiftlint:disable force_unwrapping
    /// - Parameter asString: The URL to open
    @MainActor static func open(url asString: String) {
        open(url: URL(string: asString)!)
    }

    // swiftlint:enable force_unwrapping

    /// - Parameter asURL: The URL to open
    @MainActor static func open(url asURL: URL) {
        #if os(iOS)
        UIApplication.shared.open(asURL)
        #elseif os(macOS)
        NSWorkspace.shared.open(asURL)
        #endif
    }

    // MARK: - Locale

    static func languageCode() -> String? {
        #if os(iOS)
        Locale.current.languageCode
        #else
        Locale.current.language.languageCode?.identifier
        #endif
    }
}
