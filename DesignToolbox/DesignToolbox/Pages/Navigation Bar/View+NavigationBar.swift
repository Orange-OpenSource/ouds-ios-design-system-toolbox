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
        self.oudsToolBarTop(title, trailingItems: {
            OUDSToolbarItem {
                ThemeSelectionButton()
            }
            OUDSToolbarItem {
                ColorSchemeSelectionButton()
            }
        })
    }

    func bottomToolbar() -> some View {
        self.oudsToolBarBottom {
            OUDSToolbarItem {
                ThemeSelectionButton()
            }
        } trailingItems: {
            OUDSToolbarItem {
                ColorSchemeSelectionButton()
            }
        }
    }
}
