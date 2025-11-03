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

    enum Action: String, CaseIterable {
        case actionDisabled
        case actionEnabled
        case actionFocus
        case actionHighlighted
        case actionHover
        case actionLoading
        case actionNegativeEnabled
        case actionNegativeFocus
        case actionNegativeHover
        case actionNegativeLoading
        case actionNegativePressed
        case actionPressed
        case actionSelected
        case actionSupportEnabled
        case actionSupportDisabled
        case actionSupportFocus
        case actionSupportHover
        case actionSupportLoading
        case actionSupportPressed
        case actionVisited

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .actionDisabled:
                theme.colors.actionDisabled
            case .actionEnabled:
                theme.colors.actionEnabled
            case .actionFocus:
                theme.colors.actionFocus
            case .actionHighlighted:
                theme.colors.actionHighlighted
            case .actionHover:
                theme.colors.actionHover
            case .actionLoading:
                theme.colors.actionLoading
            case .actionNegativeEnabled:
                theme.colors.actionNegativeEnabled
            case .actionNegativeFocus:
                theme.colors.actionNegativeFocus
            case .actionNegativeHover:
                theme.colors.actionNegativeHover
            case .actionNegativeLoading:
                theme.colors.actionNegativeLoading
            case .actionNegativePressed:
                theme.colors.actionNegativePressed
            case .actionPressed:
                theme.colors.actionPressed
            case .actionSelected:
                theme.colors.actionSelected
            case .actionSupportEnabled:
                theme.colors.actionSupportEnabled
            case .actionSupportDisabled:
                theme.colors.actionSupportDisabled
            case .actionSupportFocus:
                theme.colors.actionSupportFocus
            case .actionSupportHover:
                theme.colors.actionSupportHover
            case .actionSupportLoading:
                theme.colors.actionSupportLoading
            case .actionSupportPressed:
                theme.colors.actionSupportPressed
            case .actionVisited:
                theme.colors.actionVisited
            }
        }
    }
}
