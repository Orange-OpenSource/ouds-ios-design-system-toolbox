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

    enum Content: String, CaseIterable {
        case colorContentBrandPrimary
        case colorContentDefault
        case colorContentDisabled
        case colorContentMuted
        case colorContentOnActionDisabled
        case colorContentOnActionEnabled
        case colorContentOnActionFocus
        case colorContentOnActionHighlighted
        case colorContentOnActionHover
        case colorContentOnActionLoading
        case colorContentOnActionPressed
        case colorContentOnActionSelected
        case colorContentOnBrandPrimary
        case colorContentOnOverlayEmphasized
        case colorContentOnStatusNeutralEmphasized
        case colorContentOnStatusNegativeEmphasized
        case colorContentOnStatusNeutralMuted
        case colorContentStatusInfo
        case colorContentStatusNegative
        case colorContentStatusPositive
        case colorContentStatusWarning

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .colorContentBrandPrimary:
                theme.colors.colorContentBrandPrimary
            case .colorContentDefault:
                theme.colors.colorContentDefault
            case .colorContentDisabled:
                theme.colors.colorContentDisabled
            case .colorContentMuted:
                theme.colors.colorContentMuted
            case .colorContentOnActionDisabled:
                theme.colors.colorContentOnActionDisabled
            case .colorContentOnActionEnabled:
                theme.colors.colorContentOnActionEnabled
            case .colorContentOnActionFocus:
                theme.colors.colorContentOnActionFocus
            case .colorContentOnActionHighlighted:
                theme.colors.colorContentOnActionHighlighted
            case .colorContentOnActionHover:
                theme.colors.colorContentOnActionHover
            case .colorContentOnActionLoading:
                theme.colors.colorContentOnActionLoading
            case .colorContentOnActionPressed:
                theme.colors.colorContentOnActionPressed
            case .colorContentOnActionSelected:
                theme.colors.colorContentOnActionSelected
            case .colorContentOnBrandPrimary:
                theme.colors.colorContentOnBrandPrimary
            case .colorContentOnOverlayEmphasized:
                theme.colors.colorContentOnOverlayEmphasized
            case .colorContentOnStatusNeutralEmphasized:
                theme.colors.colorContentOnStatusNeutralEmphasized
            case .colorContentOnStatusNegativeEmphasized:
                theme.colors.colorContentOnStatusNegativeEmphasized
            case .colorContentOnStatusNeutralMuted:
                theme.colors.colorContentOnStatusNeutralMuted
            case .colorContentStatusInfo:
                theme.colors.colorContentStatusInfo
            case .colorContentStatusNegative:
                theme.colors.colorContentStatusNegative
            case .colorContentStatusPositive:
                theme.colors.colorContentStatusPositive
            case .colorContentStatusWarning:
                theme.colors.colorContentStatusWarning
            }
        }
    }
}
