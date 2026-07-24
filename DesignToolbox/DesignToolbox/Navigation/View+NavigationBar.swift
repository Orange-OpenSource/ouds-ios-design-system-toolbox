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

import OUDSComponents
import OUDSSwiftUI
import SwiftUI
#if os(tvOS)
import UIKit
#endif

// MARK: - View extensions for toolBars

extension View {

    /// Adds theme and color-scheme controls to the current screen.
    ///
    /// - iOS / visionOS: rendered inside the OUDS `toolBarTop` navigation bar.
    /// - macOS: rendered via SwiftUI `.toolbar`.
    /// - tvOS: this is a no-op. The controls must be rendered explicitly by the
    ///   caller inside the page layout using `TVOSTopControlsBar`, because tvOS
    ///   has no navigation bar chrome where a `.toolbar` payload would appear.
    @ViewBuilder
    func navigationBarMenus(title: String) -> some View {
        #if os(tvOS)
        self
        #elseif os(macOS)
        toolbar {
            ThemeSelectionButton()
            ColorSchemeSelectionButton()
        }
        #else
        toolBarTop(title, trailingItems: {
            OUDSToolBarItem {
                ThemeSelectionButton()
            }
            OUDSToolBarItem {
                ColorSchemeSelectionButton()
            }
        })
        #endif
    }

    /// Sets the screen title.
    ///
    /// - Non-tvOS: forwards to `oudsNavigationTitle(_:)` so the OUDS navigation
    ///   stack renders it in its navigation bar and posts the accessibility
    ///   screen-changed notification.
    /// - tvOS: does not render any visible title (the top `TabView` bar already
    ///   labels the current section) but still posts the accessibility
    ///   screen-changed notification so VoiceOver announces the destination.
    @ViewBuilder
    func oudsScreenTitle(_ title: String) -> some View {
        #if os(tvOS)
        onAppear {
            UIAccessibility.post(notification: .screenChanged, argument: title.localized())
        }
        #else
        oudsNavigationTitle(title)
        #endif
    }
}

#if os(tvOS)

// MARK: - tvOS Top Controls Bar

/// Horizontal bar hosting the theme and color scheme selectors on tvOS.
///
/// Rendered in place of an OUDS `toolBarTop` (unavailable on tvOS).
/// It also declares itself as a focus section so the focus engine has a
/// clear target above the scroll content, which prevents focus from getting
/// stuck inside grids.
struct TVOSTopControlsBar: View {

    var body: some View {
        HStack(spacing: 24) {
            Spacer()
            ThemeSelectionButton()
            ColorSchemeSelectionButton()
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 12)
        .focusSection()
    }
}

#endif
