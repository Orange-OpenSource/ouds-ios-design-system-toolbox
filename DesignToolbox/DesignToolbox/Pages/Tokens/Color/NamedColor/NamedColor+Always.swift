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

    enum Always: String, CaseIterable {
        case colorAlwaysBlack
        case colorAlwaysOnBlack
        case colorAlwaysOnWhite
        case colorAlwaysWhite

        func token(from theme: OUDSTheme) -> ColorSemanticToken {
            switch self {
            case .colorAlwaysBlack:
                theme.colors.colorAlwaysBlack
            case .colorAlwaysOnBlack:
                theme.colors.colorAlwaysOnBlack
            case .colorAlwaysOnWhite:
                theme.colors.colorAlwaysOnWhite
            case .colorAlwaysWhite:
                theme.colors.colorAlwaysWhite
            }
        }
    }
}
