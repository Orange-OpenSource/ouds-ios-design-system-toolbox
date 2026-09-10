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

import OUDSSwiftUI

extension NamedColor {

    enum Overlay: String, CaseIterable {
        case overlayDropdown
        case overlayTooltip
        case overlayDrag
        case overlayModalSheet
        case overlayBackdrop
        case overlayFloating

        func token(from theme: OUDSTheme) -> MultipleColorSemanticToken {
            switch self {
            case .overlayDropdown:
                theme.colors.overlayDropdown
            case .overlayTooltip:
                theme.colors.overlayTooltip
            case .overlayDrag:
                theme.colors.overlayDrag
            case .overlayModalSheet:
                theme.colors.overlayModalSheet
            case .overlayBackdrop:
                theme.colors.overlayBackdrop
            case .overlayFloating:
                theme.colors.overlayFloating
            }
        }
    }
}
