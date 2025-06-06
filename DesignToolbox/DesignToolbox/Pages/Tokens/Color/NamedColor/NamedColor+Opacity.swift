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

    enum Opacity: String, CaseIterable {
        case colorOpacityLowest
        case colorOpacityLower
        case colorOpacityTransparent

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .colorOpacityLowest:
                theme.colors.colorOpacityLowest
            case .colorOpacityLower:
                theme.colors.colorOpacityLower
            case .colorOpacityTransparent:
                theme.colors.colorOpacityTransparent
            }
        }
    }
}
