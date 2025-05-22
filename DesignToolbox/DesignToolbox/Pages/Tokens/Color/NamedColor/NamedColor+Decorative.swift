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

// swiftlint:disable function_body_length

extension NamedColor {

    enum Decorative: String, CaseIterable {
        case colorDecorativeAccent1Default
        case colorDecorativeAccent1Emphasized
        case colorDecorativeAccent1Muted
        case colorDecorativeAccent2Default
        case colorDecorativeAccent2Emphasized
        case colorDecorativeAccent2Muted
        case colorDecorativeAccent3Default
        case colorDecorativeAccent3Emphasized
        case colorDecorativeAccent3Muted
        case colorDecorativeAccent4Default
        case colorDecorativeAccent4Emphasized
        case colorDecorativeAccent4Muted
        case colorDecorativeAccent5Default
        case colorDecorativeAccent5Emphasized
        case colorDecorativeAccent5Muted
        case colorDecorativeBrandPrimary
        case colorDecorativeBrandSecondary
        case colorDecorativeBrandTertiary
        case colorDecorativeSkinTint100
        case colorDecorativeSkinTint200
        case colorDecorativeSkinTint300
        case colorDecorativeSkinTint400
        case colorDecorativeSkinTint500
        case colorDecorativeSkinTint600
        case colorDecorativeSkinTint700
        case colorDecorativeSkinTint800
        case colorDecorativeSkinTint900
        case colorDecorativeNeutralEmphasizedHigher
        case colorDecorativeNeutralEmphasizedLow
        case colorDecorativeNeutralEmphasizedLower
        case colorDecorativeNeutralEmphasizedLowest
        case colorDecorativeNeutralMutedHigh
        case colorDecorativeNeutralMutedHigher
        case colorDecorativeNeutralMutedHighest
        case colorDecorativeNeutralMutedLow
        case colorDecorativeNeutralMutedLower
        case colorDecorativeNeutralMutedLowest
        case colorDecorativeNeutralMutedMedium

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .colorDecorativeAccent1Default:
                theme.colors.colorDecorativeAccent1Default
            case .colorDecorativeAccent1Emphasized:
                theme.colors.colorDecorativeAccent1Emphasized
            case .colorDecorativeAccent1Muted:
                theme.colors.colorDecorativeAccent1Muted
            case .colorDecorativeAccent2Default:
                theme.colors.colorDecorativeAccent2Default
            case .colorDecorativeAccent2Emphasized:
                theme.colors.colorDecorativeAccent2Emphasized
            case .colorDecorativeAccent2Muted:
                theme.colors.colorDecorativeAccent2Muted
            case .colorDecorativeAccent3Default:
                theme.colors.colorDecorativeAccent3Default
            case .colorDecorativeAccent3Emphasized:
                theme.colors.colorDecorativeAccent3Emphasized
            case .colorDecorativeAccent3Muted:
                theme.colors.colorDecorativeAccent3Muted
            case .colorDecorativeAccent4Default:
                theme.colors.colorDecorativeAccent4Default
            case .colorDecorativeAccent4Emphasized:
                theme.colors.colorDecorativeAccent4Emphasized
            case .colorDecorativeAccent4Muted:
                theme.colors.colorDecorativeAccent4Muted
            case .colorDecorativeAccent5Default:
                theme.colors.colorDecorativeAccent5Default
            case .colorDecorativeAccent5Emphasized:
                theme.colors.colorDecorativeAccent5Emphasized
            case .colorDecorativeAccent5Muted:
                theme.colors.colorDecorativeAccent5Muted
            case .colorDecorativeBrandPrimary:
                theme.colors.colorDecorativeBrandPrimary
            case .colorDecorativeBrandSecondary:
                theme.colors.colorDecorativeBrandSecondary
            case .colorDecorativeBrandTertiary:
                theme.colors.colorDecorativeBrandTertiary
            case .colorDecorativeSkinTint100:
                theme.colors.colorDecorativeSkinTint100
            case .colorDecorativeSkinTint200:
                theme.colors.colorDecorativeSkinTint200
            case .colorDecorativeSkinTint300:
                theme.colors.colorDecorativeSkinTint300
            case .colorDecorativeSkinTint400:
                theme.colors.colorDecorativeSkinTint400
            case .colorDecorativeSkinTint500:
                theme.colors.colorDecorativeSkinTint500
            case .colorDecorativeSkinTint600:
                theme.colors.colorDecorativeSkinTint600
            case .colorDecorativeSkinTint700:
                theme.colors.colorDecorativeSkinTint700
            case .colorDecorativeSkinTint800:
                theme.colors.colorDecorativeSkinTint800
            case .colorDecorativeSkinTint900:
                theme.colors.colorDecorativeSkinTint900
            case .colorDecorativeNeutralEmphasizedHigher:
                theme.colors.colorDecorativeNeutralEmphasizedHigher
            case .colorDecorativeNeutralEmphasizedLow:
                theme.colors.colorDecorativeNeutralEmphasizedLow
            case .colorDecorativeNeutralEmphasizedLower:
                theme.colors.colorDecorativeNeutralEmphasizedLower
            case .colorDecorativeNeutralEmphasizedLowest:
                theme.colors.colorDecorativeNeutralEmphasizedLowest
            case .colorDecorativeNeutralMutedHigh:
                theme.colors.colorDecorativeNeutralMutedHigh
            case .colorDecorativeNeutralMutedHigher:
                theme.colors.colorDecorativeNeutralMutedHigher
            case .colorDecorativeNeutralMutedHighest:
                theme.colors.colorDecorativeNeutralMutedHighest
            case .colorDecorativeNeutralMutedLow:
                theme.colors.colorDecorativeNeutralMutedLow
            case .colorDecorativeNeutralMutedLower:
                theme.colors.colorDecorativeNeutralMutedLower
            case .colorDecorativeNeutralMutedLowest:
                theme.colors.colorDecorativeNeutralMutedLowest
            case .colorDecorativeNeutralMutedMedium:
                theme.colors.colorDecorativeNeutralMutedMedium
            }
        }
    }
}

// swiftlint:enable function_body_length
