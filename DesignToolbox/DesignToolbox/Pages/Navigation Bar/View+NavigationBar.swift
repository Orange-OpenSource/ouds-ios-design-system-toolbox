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
import SwiftUI

// MARK: - View extensions for toolbars

extension View {

    func navigationBarMenus(title: String) -> some View {
        modifier(ToolbarTopModifier(title: title))
    }

    func bottomToolbar() -> some View {
        modifier(ToolbarBottomModifier())
    }
}

// MARK: - Toolbar Top Modifier

private struct ToolbarTopModifier: ViewModifier {

    let title: String

    func body(content: Content) -> some View {
        OUDSToolbarTop(title: title, trailingItems: {
            OUDSToolbarItem(icon: Image(decorative: "ic_heart"), accessibilityLabel: "Like") {}
            OUDSToolbarItem(icon: Image(decorative: "ic_heart"), accessibilityLabel: "Like") {}
            OUDSToolbarItem {
                ThemeSelectionButton()
            }
            OUDSToolbarItem {
                ColorSchemeSelectionButton()
            }
        }) {
            content
        }
    }
}

// MARK: - Toolbar Bottom Modifier

private struct ToolbarBottomModifier: ViewModifier {

    func body(content: Content) -> some View {
        OUDSToolbarBottom(leadingItems: {
            OUDSToolbarItem {
                ThemeSelectionButton()
            }
        }, trailingItems: {
            OUDSToolbarItem {
                ColorSchemeSelectionButton()
            }
        }) {
            content
        }
    }
}
