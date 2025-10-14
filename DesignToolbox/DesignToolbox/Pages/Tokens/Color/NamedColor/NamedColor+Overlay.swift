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

import OUDS
import OUDSTokensSemantic

extension NamedColor {

    enum Overlay: String, CaseIterable {
        case colorOverlayDropDown
        case colorOverlayDrag
        case colorOverlayModal

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .colorOverlayDropDown:
                theme.colors.colorOverlayDropdown
            case .colorOverlayDrag:
                theme.colors.colorOverlayDrag
            case .colorOverlayModal:
                theme.colors.colorOverlayModal
            }
        }
    }
}
