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

    enum Border: String, CaseIterable {
        case borderBrandPrimary
        case borderDefault
        case borderEmphasized
        case borderMuted
        case borderFocus
        case borderFocusInset
        case borderOnBrandPrimary

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .borderBrandPrimary:
                theme.colors.borderBrandPrimary
            case .borderDefault:
                theme.colors.borderDefault
            case .borderEmphasized:
                theme.colors.borderEmphasized
            case .borderMuted:
                theme.colors.borderMuted
            case .borderFocus:
                theme.colors.borderFocus
            case .borderFocusInset:
                theme.colors.borderFocusInset
            case .borderOnBrandPrimary:
                theme.colors.borderOnBrandPrimary
            }
        }
    }
}
