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

    enum Border: String, CaseIterable {
        case borderBrandPrimary
        case borderBrandSecondary
        case borderBrandTertiary
        case borderDefault
        case borderEmphasized
        case borderMuted
        case borderFocus
        case borderFocusInset
        case borderOnBrandPrimary
        case borderOnBrandSecondary
        case borderOnBrandTertiary
        case borderMinimal
        case borderStatusPositive
        case borderStatusInfo
        case borderStatusWarning
        case borderStatusNegative
        case borderStatusAccent

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .borderBrandPrimary:
                theme.colors.borderBrandPrimary
            case .borderBrandSecondary:
                theme.colors.borderBrandSecondary
            case .borderBrandTertiary:
                theme.colors.borderBrandTertiary
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
            case .borderOnBrandSecondary:
                theme.colors.borderOnBrandSecondary
            case .borderOnBrandTertiary:
                theme.colors.borderOnBrandTertiary
            case .borderMinimal:
                theme.colors.borderMinimal
            case .borderStatusPositive:
                theme.colors.borderStatusPositive
            case .borderStatusInfo:
                theme.colors.borderStatusInfo
            case .borderStatusWarning:
                theme.colors.borderStatusWarning
            case .borderStatusNegative:
                theme.colors.borderStatusNegative
            case .borderStatusAccent:
                theme.colors.borderStatusAccent
            }
        }
    }
}
