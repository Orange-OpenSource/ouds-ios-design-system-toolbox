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

import OUDSThemesContract
import OUDSTokensSemantic

extension NamedColor {

    enum Overlay: String, CaseIterable {
        case overlayDropDown
        case overlayDrag
        case overlayModal

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .overlayDropDown:
                theme.colors.overlayDropdown
            case .overlayDrag:
                theme.colors.overlayDrag
            case .overlayModal:
                theme.colors.overlayModal
            }
        }
    }
}
