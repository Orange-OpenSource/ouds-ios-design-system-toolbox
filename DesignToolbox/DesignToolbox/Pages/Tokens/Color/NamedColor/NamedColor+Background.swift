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

    enum Background: String, CaseIterable {
        case bgPrimary
        case bgSecondary
        case bgTertiary
        case bgInverseHigh
        case bgInverseLow

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .bgPrimary:
                theme.colors.bgPrimary
            case .bgSecondary:
                theme.colors.bgSecondary
            case .bgTertiary:
                theme.colors.bgTertiary
            case .bgInverseHigh:
                theme.colors.bgInverseHigh
            case .bgInverseLow:
                theme.colors.bgInverseLow
            }
        }
    }
}
