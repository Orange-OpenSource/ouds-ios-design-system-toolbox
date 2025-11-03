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

import SwiftUI

extension View {

    /// To add a `ThemeSelectionButton` in the toolbar and also a `ColorSchemeSelectionButton`
    func navigationBarMenus() -> some View {
        #if os(iOS) || os(visionOS)
        toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                ThemeSelectionButton()
                ColorSchemeSelectionButton()
            }
        }
        #else // macOS
        toolbar {
            ToolbarItemGroup(placement: .automatic) {
                ThemeSelectionButton()
                ColorSchemeSelectionButton()
            }
        }
        #endif
    }
}
