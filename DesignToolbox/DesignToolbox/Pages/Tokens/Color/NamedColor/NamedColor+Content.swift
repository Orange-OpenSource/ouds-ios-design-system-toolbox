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

    enum Content: String, CaseIterable {
        case contentBrandPrimary
        case contentDefault
        case contentDisabled
        case contentMuted
        case contentOnActionDisabled
        case contentOnActionEnabled
        case contentOnActionFocus
        case contentOnActionHighlighted
        case contentOnActionHover
        case contentOnActionLoading
        case contentOnActionPressed
        case contentOnActionSelected
        case contentOnBrandPrimary
        case contentInverse
        case contentOnStatusNegativeEmphasized
        case contentStatusInfo
        case contentStatusNegative
        case contentStatusPositive
        case contentStatusWarning

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .contentBrandPrimary:
                theme.colors.contentBrandPrimary
            case .contentDefault:
                theme.colors.contentDefault
            case .contentDisabled:
                theme.colors.contentDisabled
            case .contentMuted:
                theme.colors.contentMuted
            case .contentOnActionDisabled:
                theme.colors.contentOnActionDisabled
            case .contentOnActionEnabled:
                theme.colors.contentOnActionEnabled
            case .contentOnActionFocus:
                theme.colors.contentOnActionFocus
            case .contentOnActionHighlighted:
                theme.colors.contentOnActionHighlighted
            case .contentOnActionHover:
                theme.colors.contentOnActionHover
            case .contentOnActionLoading:
                theme.colors.contentOnActionLoading
            case .contentOnActionPressed:
                theme.colors.contentOnActionPressed
            case .contentOnActionSelected:
                theme.colors.contentOnActionSelected
            case .contentOnBrandPrimary:
                theme.colors.contentOnBrandPrimary
            case .contentInverse:
                theme.colors.contentInverse
            case .contentOnStatusNegativeEmphasized:
                theme.colors.contentOnStatusNegativeEmphasized
            case .contentStatusInfo:
                theme.colors.contentStatusInfo
            case .contentStatusNegative:
                theme.colors.contentStatusNegative
            case .contentStatusPositive:
                theme.colors.contentStatusPositive
            case .contentStatusWarning:
                theme.colors.contentStatusWarning
            }
        }
    }
}
