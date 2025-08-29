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

    enum Action: String, CaseIterable {
        case colorActionDisabled
        case colorActionEnabled
        case colorActionFocus
        case colorActionHighlighted
        case colorActionHover
        case colorActionLoading
        case colorActionNegativeEnabled
        case colorActionNegativeFocus
        case colorActionNegativeHover
        case colorActionNegativeLoading
        case colorActionNegativePressed
        case colorActionPressed
        case colorActionSelected
        case colorActionSupportEnabled
        case colorActionSupportDisabled
        case colorActionSupportFocus
        case colorActionSupportHover
        case colorActionSupportLoading
        case colorActionSupportPressed
        case colorActionSupportDisabled
        case colorActionVisited

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .colorActionDisabled:
                theme.colors.colorActionDisabled
            case .colorActionEnabled:
                theme.colors.colorActionEnabled
            case .colorActionFocus:
                theme.colors.colorActionFocus
            case .colorActionHighlighted:
                theme.colors.colorActionHighlighted
            case .colorActionHover:
                theme.colors.colorActionHover
            case .colorActionLoading:
                theme.colors.colorActionLoading
            case .colorActionNegativeEnabled:
                theme.colors.colorActionNegativeEnabled
            case .colorActionNegativeFocus:
                theme.colors.colorActionNegativeFocus
            case .colorActionNegativeHover:
                theme.colors.colorActionNegativeHover
            case .colorActionNegativeLoading:
                theme.colors.colorActionNegativeLoading
            case .colorActionNegativePressed:
                theme.colors.colorActionNegativePressed
            case .colorActionPressed:
                theme.colors.colorActionPressed
            case .colorActionSelected:
                theme.colors.colorActionSelected
            case .colorActionSupportEnabled:
                theme.colors.colorActionSupportEnabled
            case .colorActionSupportDisabled:
                theme.colors.colorActionSupportDisabled
            case .colorActionSupportFocus:
                theme.colors.colorActionSupportFocus
            case .colorActionSupportHover:
                theme.colors.colorActionSupportHover
            case .colorActionSupportLoading:
                theme.colors.colorActionSupportLoading
            case .colorActionSupportPressed:
                theme.colors.colorActionSupportPressed
            case .colorActionSupportDisabled:
                theme.colors.colorActionSupportDisabled
            case .colorActionVisited:
                theme.colors.colorActionVisited
            }
        }
    }
}
