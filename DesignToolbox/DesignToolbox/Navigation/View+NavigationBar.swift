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

// MARK: - View extensions for toolBars

extension View {

    func navigationBarMenus(title: String) -> some View {
        #if os(macOS) || os(tvOS)
        // macOS: OUDSToolBarItem/toolBarTop is not the idiomatic pattern.
        // tvOS: focus engine handles the top navigation bar natively; use SwiftUI `.toolbar`.
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
}
