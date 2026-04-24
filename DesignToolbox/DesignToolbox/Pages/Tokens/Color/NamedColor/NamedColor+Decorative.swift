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

// swiftlint:disable function_body_length

extension NamedColor {

    enum Decorative: String, CaseIterable {
        case brandPrimary
        case brandPrimaryMuted
        case brandPrimaryEmphasized

        case brandSecondary
        case brandSecondaryMuted
        case brandSecondaryEmphasized

        case brandTertiary
        case brandTertiaryMuted
        case brandTertiaryEmphasized

        case neutralMutedLowest
        case neutralMutedLower
        case neutralMutedLow
        case neutralMutedMedium
        case neutralMutedHigh
        case neutralMutedHigher
        case neutralMutedHighest

        case neutralEmphasizedLowest
        case neutralEmphasizedLower
        case neutralEmphasizedLow
        case neutralEmphasizedMedium
        case neutralEmphasizedHigh
        case neutralEmphasizedHigher
        case neutralEmphasizedHighest

        case accent1Muted
        case accent1Default
        case accent1Emphasized
        case accent2Muted
        case accent2Default
        case accent2Emphasized
        case accent3Muted
        case accent3Default
        case accent3Emphasized
        case accent4Muted
        case accent4Default
        case accent4Emphasized
        case accent5Muted
        case accent5Default
        case accent5Emphasized

        case skinTint100
        case skinTint200
        case skinTint300
        case skinTint400
        case skinTint500
        case skinTint600
        case skinTint700
        case skinTint800
        case skinTint900

        // We can bang! theme.charts here because controls on the existence of theme.charts have been previosuly done
        // swiftlint:disable force_unwrapping
        func token(from theme: OUDSTheme) -> ColorSemanticToken {
            switch self {
            case .brandPrimary:
                theme.colorsDecorative!.brandPrimary
            case .brandPrimaryMuted:
                theme.colorsDecorative!.brandPrimaryMuted
            case .brandPrimaryEmphasized:
                theme.colorsDecorative!.brandPrimaryEmphasized
            case .brandSecondary:
                theme.colorsDecorative!.brandSecondary
            case .brandSecondaryMuted:
                theme.colorsDecorative!.brandSecondaryMuted
            case .brandSecondaryEmphasized:
                theme.colorsDecorative!.brandSecondaryEmphasized
            case .brandTertiary:
                theme.colorsDecorative!.brandTertiary
            case .brandTertiaryMuted:
                theme.colorsDecorative!.brandTertiaryMuted
            case .brandTertiaryEmphasized:
                theme.colorsDecorative!.brandTertiaryEmphasized
            case .neutralMutedLowest:
                theme.colorsDecorative!.neutralMutedLowest
            case .neutralMutedLower:
                theme.colorsDecorative!.neutralMutedLower
            case .neutralMutedLow:
                theme.colorsDecorative!.neutralMutedLow
            case .neutralMutedMedium:
                theme.colorsDecorative!.neutralMutedMedium
            case .neutralMutedHigh:
                theme.colorsDecorative!.neutralMutedHigh
            case .neutralMutedHigher:
                theme.colorsDecorative!.neutralMutedHigher
            case .neutralMutedHighest:
                theme.colorsDecorative!.neutralMutedHighest
            case .neutralEmphasizedLowest:
                theme.colorsDecorative!.neutralEmphasizedLowest
            case .neutralEmphasizedLower:
                theme.colorsDecorative!.neutralEmphasizedLower
            case .neutralEmphasizedLow:
                theme.colorsDecorative!.neutralEmphasizedLow
            case .neutralEmphasizedMedium:
                theme.colorsDecorative!.neutralEmphasizedMedium
            case .neutralEmphasizedHigh:
                theme.colorsDecorative!.neutralEmphasizedHigh
            case .neutralEmphasizedHigher:
                theme.colorsDecorative!.neutralEmphasizedHigher
            case .neutralEmphasizedHighest:
                theme.colorsDecorative!.neutralEmphasizedHighest
            case .accent1Muted:
                theme.colorsDecorative!.accent1Muted
            case .accent1Default:
                theme.colorsDecorative!.accent1Default
            case .accent1Emphasized:
                theme.colorsDecorative!.accent1Emphasized
            case .accent2Muted:
                theme.colorsDecorative!.accent2Muted
            case .accent2Default:
                theme.colorsDecorative!.accent2Default
            case .accent2Emphasized:
                theme.colorsDecorative!.accent2Emphasized
            case .accent3Muted:
                theme.colorsDecorative!.accent3Muted
            case .accent3Default:
                theme.colorsDecorative!.accent3Default
            case .accent3Emphasized:
                theme.colorsDecorative!.accent3Emphasized
            case .accent4Muted:
                theme.colorsDecorative!.accent4Muted
            case .accent4Default:
                theme.colorsDecorative!.accent4Default
            case .accent4Emphasized:
                theme.colorsDecorative!.accent4Emphasized
            case .accent5Muted:
                theme.colorsDecorative!.accent5Muted
            case .accent5Default:
                theme.colorsDecorative!.accent5Default
            case .accent5Emphasized:
                theme.colorsDecorative!.accent5Emphasized
            case .skinTint100:
                theme.colorsDecorative!.skinTint100
            case .skinTint200:
                theme.colorsDecorative!.skinTint200
            case .skinTint300:
                theme.colorsDecorative!.skinTint300
            case .skinTint400:
                theme.colorsDecorative!.skinTint400
            case .skinTint500:
                theme.colorsDecorative!.skinTint500
            case .skinTint600:
                theme.colorsDecorative!.skinTint600
            case .skinTint700:
                theme.colorsDecorative!.skinTint700
            case .skinTint800:
                theme.colorsDecorative!.skinTint800
            case .skinTint900:
                theme.colorsDecorative!.skinTint900
            }
        }
        // swiftlint:enable force_unwrapping
    }
}

// swiftlint:enable function_body_length
