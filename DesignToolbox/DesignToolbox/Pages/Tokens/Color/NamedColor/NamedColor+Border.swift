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
        case colorBorderBrandPrimary
        case colorBorderDefault
        case colorBorderEmphasized
        case colorBorderMuted
        case colorBorderFocus
        case colorBorderFocusInset
        case colorBorderOnBrandPrimary

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .colorBorderBrandPrimary:
                theme.colors.colorBorderBrandPrimary
            case .colorBorderDefault:
                theme.colors.colorBorderDefault
            case .colorBorderEmphasized:
                theme.colors.colorBorderEmphasized
            case .colorBorderMuted:
                theme.colors.colorBorderMuted
            case .colorBorderFocus:
                theme.colors.colorBorderFocus
            case .colorBorderFocusInset:
                theme.colors.colorBorderFocusInset
            case .colorBorderOnBrandPrimary:
                theme.colors.colorBorderOnBrandPrimary
            }
        }
    }
}
