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

#if canImport(UIKit)
import UIKit
#endif

/// Central registry for all `DesignToolboxElement` instances.
/// Use these helpers instead of re-declaring the lists in each page.
enum AllElements {

    // MARK: - Tokens

    /// All design-token elements. Requires the current theme name because
    /// `ColorTokenElement` and `GridTokenElement` are theme-aware.
    @MainActor static func tokenElements(themeName: String) -> [DesignToolboxElement] {
        [
            BorderTokenElement(),
            ColorTokenElement(themeName: themeName),
            DimensionTokenElement(),
            ElevationTokenElement(),
            GridTokenElement(themeName: themeName),
            OpacityTokenElement(),
            FontTokenElement(),
        ]
    }

    // MARK: - Components

    /// All component elements, filtered for the current platform / device.
    /// - `PinCodeInputElement`, `ToolBarBottomElement`, `ToolBarTopElement` are iOS/non-visionOS only.
    /// - `TabBarElement` is removed on macOS and iPad (navigation conflicts).
    @MainActor static func componentElements() -> [DesignToolboxElement] {
        #if !os(macOS) && !os(visionOS)
        var elements: [DesignToolboxElement] = [
            AlertElements(),
            BadgeElements(),
            BulletListElement(),
            ButtonElement(),
            CheckboxElements(),
            ChipElements(),
            ColoredSurfaceElement(),
            DividerElements(),
            LinkElement(),
            PasswordInputElement(),
            PinCodeInputElement(),
            RadioElements(),
            SwitchElements(),
            TabBarElement(),
            TagElements(),
            TextAreaElement(),
            TextInputElement(),
            ToolBarBottomElement(),
            ToolBarTopElement(),
        ]
        #else
        var elements: [DesignToolboxElement] = [
            AlertElements(),
            BadgeElements(),
            BulletListElement(),
            ButtonElement(),
            CheckboxElements(),
            ChipElements(),
            ColoredSurfaceElement(),
            DividerElements(),
            LinkElement(),
            PasswordInputElement(),
            RadioElements(),
            SwitchElements(),
            TabBarElement(),
            TagElements(),
            TextAreaElement(),
            TextInputElement(),
        ]
        #endif

        // Tab bar element demo designed for iOS / iPhones.
        // Demo is broken for other platforms (navigation troubles with this tab view integrated elsewhere).
        #if os(macOS)
        elements.removeAll(where: { $0 is TabBarElement })
        #elseif canImport(UIKit)
        if UIDevice.current.userInterfaceIdiom == .pad {
            elements.removeAll(where: { $0 is TabBarElement })
        }
        #endif

        return elements
    }
}
