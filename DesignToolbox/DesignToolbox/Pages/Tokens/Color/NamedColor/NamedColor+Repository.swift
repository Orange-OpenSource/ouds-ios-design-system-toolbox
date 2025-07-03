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

    enum Repository: String, CaseIterable {
        case colorRepositoryAccentDefault
        case colorRepositoryAccentHigh
        case colorRepositoryAccentHigher
        case colorRepositoryAccentHighest
        case colorRepositoryAccentLow
        case colorRepositoryAccentLowest
        case colorRepositoryInfoDefault
        case colorRepositoryInfoHighest
        case colorRepositoryInfoLow
        case colorRepositoryInfoLowest
        case colorRepositoryNegativeDefault
        case colorRepositoryNegativeHigh
        case colorRepositoryNegativeHigher
        case colorRepositoryNegativeHighest
        case colorRepositoryNegativeLow
        case colorRepositoryNegativeLower
        case colorRepositoryNegativeLowest
        case colorRepositoryNeutralEmphasizedBlack
        case colorRepositoryNeutralEmphasizedHigh
        case colorRepositoryNeutralEmphasizedHigher
        case colorRepositoryNeutralEmphasizedHighest
        case colorRepositoryNeutralEmphasizedMedium
        case colorRepositoryNeutralMutedLower
        case colorRepositoryNeutralMutedLowest
        case colorRepositoryNeutralMutedWhite
        case colorRepositoryOpacityBlackHigh
        case colorRepositoryOpacityBlackHigher
        case colorRepositoryOpacityBlackHighest
        case colorRepositoryOpacityBlackLow
        case colorRepositoryOpacityBlackLower
        case colorRepositoryOpacityBlackLowest
        case colorRepositoryOpacityBlackMediumLow
        case colorRepositoryOpacityBlackMedium
        case colorRepositoryOpacityBlackMediumHigh
        case colorRepositoryOpacityBlackTransparent
        case colorRepositoryOpacityInfo
        case colorRepositoryOpacityAccent
        case colorRepositoryOpacityNegative
        case colorRepositoryOpacityPositive
        case colorRepositoryOpacityWarning
        case colorRepositoryOpacityWhiteHigh
        case colorRepositoryOpacityWhiteHigher
        case colorRepositoryOpacityWhiteHighest
        case colorRepositoryOpacityWhiteMedium
        case colorRepositoryOpacityWhiteMediumLow
        case colorRepositoryOpacityWhiteLow
        case colorRepositoryOpacityWhiteLower
        case colorRepositoryOpacityWhiteLowest
        case colorRepositoryOpacityWhiteTransparent
        case colorRepositoryOpacityPrimaryLow
        case colorRepositoryOpacityPrimaryLower
        case colorRepositoryOpacityPrimaryLowest
        case colorRepositoryOpacityPrimaryMedium
        case colorRepositoryOpacityPrimaryHigh
        case colorRepositoryOpacityPrimaryHigher
        case colorRepositoryOpacityPrimaryHighest
        case colorRepositoryPositiveDefault
        case colorRepositoryPositiveHigh
        case colorRepositoryPositiveHighest
        case colorRepositoryPositiveLow
        case colorRepositoryPositiveLowest
        case colorRepositoryPrimaryDefault
        case colorRepositoryPrimaryLow
        case colorRepositoryWarningDefault
        case colorRepositoryWarningHighest
        case colorRepositoryWarningLow
        case colorRepositoryWarningLowest

        func token(from theme: OUDSTheme) -> ColorSemanticToken {
            switch self {
            case .colorRepositoryAccentDefault:
                theme.colors.colorRepositoryAccentDefault
            case .colorRepositoryAccentHigh:
                theme.colors.colorRepositoryAccentHigh
            case .colorRepositoryAccentHigher:
                theme.colors.colorRepositoryAccentHigher
            case .colorRepositoryAccentHighest:
                theme.colors.colorRepositoryAccentHighest
            case .colorRepositoryAccentLow:
                theme.colors.colorRepositoryAccentLow
            case .colorRepositoryAccentLowest:
                theme.colors.colorRepositoryAccentLowest
            case .colorRepositoryInfoDefault:
                theme.colors.colorRepositoryInfoDefault
            case .colorRepositoryInfoHighest:
                theme.colors.colorRepositoryInfoHighest
            case .colorRepositoryInfoLow:
                theme.colors.colorRepositoryInfoLow
            case .colorRepositoryInfoLowest:
                theme.colors.colorRepositoryInfoLowest
            case .colorRepositoryNegativeDefault:
                theme.colors.colorRepositoryNegativeDefault
            case .colorRepositoryNegativeHigh:
                theme.colors.colorRepositoryNegativeHigh
            case .colorRepositoryNegativeHigher:
                theme.colors.colorRepositoryNegativeHigher
            case .colorRepositoryNegativeHighest:
                theme.colors.colorRepositoryNegativeHighest
            case .colorRepositoryNegativeLow:
                theme.colors.colorRepositoryNegativeLow
            case .colorRepositoryNegativeLower:
                theme.colors.colorRepositoryNegativeLower
            case .colorRepositoryNegativeLowest:
                theme.colors.colorRepositoryNegativeLowest
            case .colorRepositoryNeutralEmphasizedBlack:
                theme.colors.colorRepositoryNeutralEmphasizedBlack
            case .colorRepositoryNeutralEmphasizedHigh:
                theme.colors.colorRepositoryNeutralEmphasizedHigh
            case .colorRepositoryNeutralEmphasizedHigher:
                theme.colors.colorRepositoryNeutralEmphasizedHigher
            case .colorRepositoryNeutralEmphasizedHighest:
                theme.colors.colorRepositoryNeutralEmphasizedHighest
            case .colorRepositoryNeutralEmphasizedMedium:
                theme.colors.colorRepositoryNeutralEmphasizedMedium
            case .colorRepositoryNeutralMutedLower:
                theme.colors.colorRepositoryNeutralMutedLower
            case .colorRepositoryNeutralMutedLowest:
                theme.colors.colorRepositoryNeutralMutedLowest
            case .colorRepositoryNeutralMutedWhite:
                theme.colors.colorRepositoryNeutralMutedWhite
            case .colorRepositoryOpacityBlackHigh:
                theme.colors.colorRepositoryOpacityBlackHigh
            case .colorRepositoryOpacityBlackHigher:
                theme.colors.colorRepositoryOpacityBlackHigher
            case .colorRepositoryOpacityBlackHighest:
                theme.colors.colorRepositoryOpacityBlackHighest
            case .colorRepositoryOpacityBlackLow:
                theme.colors.colorRepositoryOpacityBlackLow
            case .colorRepositoryOpacityBlackLower:
                theme.colors.colorRepositoryOpacityBlackLower
            case .colorRepositoryOpacityBlackLowest:
                theme.colors.colorRepositoryOpacityBlackLowest
            case .colorRepositoryOpacityBlackMediumLow:
                theme.colors.colorRepositoryOpacityBlackMediumLow
            case .colorRepositoryOpacityBlackMedium:
                theme.colors.colorRepositoryOpacityBlackMedium
            case .colorRepositoryOpacityBlackMediumHigh:
                theme.colors.colorRepositoryOpacityBlackMediumHigh
            case .colorRepositoryOpacityBlackTransparent:
                theme.colors.colorRepositoryOpacityBlackTransparent
            case .colorRepositoryOpacityInfo:
                theme.colors.colorRepositoryOpacityInfo
            case .colorRepositoryOpacityAccent:
                theme.colors.colorRepositoryOpacityAccent
            case .colorRepositoryOpacityNegative:
                theme.colors.colorRepositoryOpacityNegative
            case .colorRepositoryOpacityPositive:
                theme.colors.colorRepositoryOpacityPositive
            case .colorRepositoryOpacityWarning:
                theme.colors.colorRepositoryOpacityWarning
            case .colorRepositoryOpacityWhiteHigh:
                theme.colors.colorRepositoryOpacityWhiteHigh
            case .colorRepositoryOpacityWhiteHigher:
                theme.colors.colorRepositoryOpacityWhiteHigher
            case .colorRepositoryOpacityWhiteHighest:
                theme.colors.colorRepositoryOpacityWhiteHighest
            case .colorRepositoryOpacityWhiteMedium:
                theme.colors.colorRepositoryOpacityWhiteMedium
            case .colorRepositoryOpacityWhiteMediumLow:
                theme.colors.colorRepositoryOpacityWhiteMediumLow
            case .colorRepositoryOpacityWhiteLow:
                theme.colors.colorRepositoryOpacityWhiteLow
            case .colorRepositoryOpacityWhiteLower:
                theme.colors.colorRepositoryOpacityWhiteLower
            case .colorRepositoryOpacityWhiteLowest:
                theme.colors.colorRepositoryOpacityWhiteLowest
            case .colorRepositoryOpacityWhiteTransparent:
                theme.colors.colorRepositoryOpacityWhiteTransparent
            case .colorRepositoryOpacityPrimaryLow:
                theme.colors.colorRepositoryOpacityPrimaryLow
            case .colorRepositoryOpacityPrimaryLower:
                theme.colors.colorRepositoryOpacityPrimaryLower
            case .colorRepositoryOpacityPrimaryLowest:
                theme.colors.colorRepositoryOpacityPrimaryLowest
            case .colorRepositoryOpacityPrimaryMedium:
                theme.colors.colorRepositoryOpacityPrimaryMedium
            case .colorRepositoryOpacityPrimaryHigh:
                theme.colors.colorRepositoryOpacityPrimaryHigh
            case .colorRepositoryOpacityPrimaryHigher:
                theme.colors.colorRepositoryOpacityPrimaryHigher
            case .colorRepositoryOpacityPrimaryHighest:
                theme.colors.colorRepositoryOpacityPrimaryHighest
            case .colorRepositoryPositiveDefault:
                theme.colors.colorRepositoryPositiveDefault
            case .colorRepositoryPositiveHigh:
                theme.colors.colorRepositoryPositiveHigh
            case .colorRepositoryPositiveHighest:
                theme.colors.colorRepositoryPositiveHighest
            case .colorRepositoryPositiveLow:
                theme.colors.colorRepositoryPositiveLow
            case .colorRepositoryPositiveLowest:
                theme.colors.colorRepositoryPositiveLowest
            case .colorRepositoryPrimaryDefault:
                theme.colors.colorRepositoryPrimaryDefault
            case .colorRepositoryPrimaryLow:
                theme.colors.colorRepositoryPrimaryLow
            case .colorRepositoryWarningDefault:
                theme.colors.colorRepositoryWarningDefault
            case .colorRepositoryWarningHighest:
                theme.colors.colorRepositoryWarningHighest
            case .colorRepositoryWarningLow:
                theme.colors.colorRepositoryWarningLow
            case .colorRepositoryWarningLowest:
                theme.colors.colorRepositoryWarningLowest
            }
        }
    }
}

// swiftlint:enable function_body_length
