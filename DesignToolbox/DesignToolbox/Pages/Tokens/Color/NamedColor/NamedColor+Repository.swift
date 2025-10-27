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
// swiftlint:disable type_body_length

extension NamedColor {

    enum Repository: String, CaseIterable {
        case colorRepositoryAccentMedium
        case colorRepositoryAccentHigh
        case colorRepositoryAccentHigher
        case colorRepositoryAccentHighest
        case colorRepositoryAccentLow
        case colorRepositoryAccentLower
        case colorRepositoryAccentLowest
        case colorRepositoryInfoHigh
        case colorRepositoryInfoHigher
        case colorRepositoryInfoHighest
        case colorRepositoryInfoMedium
        case colorRepositoryInfoLow
        case colorRepositoryInfoLower
        case colorRepositoryInfoLowest
        case colorRepositoryNegativeMedium
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
        case colorRepositoryNeutralEmphasizedLow
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
        case colorRepositoryOpacityInfoLow
        case colorRepositoryOpacityInfoMedium
        case colorRepositoryOpacityAccentLow
        case colorRepositoryOpacityAccentMedium
        case colorRepositoryOpacityNegativeLow
        case colorRepositoryOpacityNegativeMedium
        case colorRepositoryOpacityPositiveLow
        case colorRepositoryOpacityPositiveMedium
        case colorRepositoryOpacityWarningLow
        case colorRepositoryOpacityWarningMedium
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
        case colorRepositoryPositiveMedium
        case colorRepositoryPositiveHigh
        case colorRepositoryPositiveHigher
        case colorRepositoryPositiveHighest
        case colorRepositoryPositiveLow
        case colorRepositoryPositiveLower
        case colorRepositoryPositiveLowest
        case colorRepositoryPrimaryHighest
        case colorRepositoryPrimaryHigher
        case colorRepositoryPrimaryHigh
        case colorRepositoryPrimaryMedium
        case colorRepositoryPrimaryLow
        case colorRepositoryPrimaryLower
        case colorRepositoryPrimaryLowest
        case colorRepositorySecondaryHighest
        case colorRepositorySecondaryHigher
        case colorRepositorySecondaryHigh
        case colorRepositorySecondaryMedium
        case colorRepositorySecondaryLow
        case colorRepositorySecondaryLower
        case colorRepositorySecondaryLowest
        case colorRepositoryTertiaryHighest
        case colorRepositoryTertiaryHigher
        case colorRepositoryTertiaryHigh
        case colorRepositoryTertiaryMedium
        case colorRepositoryTertiaryLow
        case colorRepositoryTertiaryLower
        case colorRepositoryTertiaryLowest
        case colorRepositoryWarningLow
        case colorRepositoryWarningLower
        case colorRepositoryWarningLowest
        case colorRepositoryWarningMedium
        case colorRepositoryWarningHigh
        case colorRepositoryWarningHigher
        case colorRepositoryWarningHighest

        func token(from theme: OUDSTheme) -> ColorSemanticToken {
            switch self {
            case .colorRepositoryAccentMedium:
                theme.colors.colorRepositoryAccentMedium
            case .colorRepositoryAccentHigh:
                theme.colors.colorRepositoryAccentHigh
            case .colorRepositoryAccentHigher:
                theme.colors.colorRepositoryAccentHigher
            case .colorRepositoryAccentHighest:
                theme.colors.colorRepositoryAccentHighest
            case .colorRepositoryAccentLow:
                theme.colors.colorRepositoryAccentLow
            case .colorRepositoryAccentLower:
                theme.colors.colorRepositoryAccentLower
            case .colorRepositoryAccentLowest:
                theme.colors.colorRepositoryAccentLowest
            case .colorRepositoryInfoMedium:
                theme.colors.colorRepositoryInfoMedium
            case .colorRepositoryInfoHigh:
                theme.colors.colorRepositoryInfoHigh
            case .colorRepositoryInfoHigher:
                theme.colors.colorRepositoryInfoHigher
            case .colorRepositoryInfoHighest:
                theme.colors.colorRepositoryInfoHighest
            case .colorRepositoryInfoLow:
                theme.colors.colorRepositoryInfoLow
            case .colorRepositoryInfoLower:
                theme.colors.colorRepositoryInfoLower
            case .colorRepositoryInfoLowest:
                theme.colors.colorRepositoryInfoLowest
            case .colorRepositoryNegativeMedium:
                theme.colors.colorRepositoryNegativeMedium
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
            case .colorRepositoryNeutralEmphasizedLow:
                theme.colors.colorRepositoryNeutralEmphasizedLow
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
            case .colorRepositoryOpacityInfoLow:
                theme.colors.colorRepositoryOpacityInfoLow
            case .colorRepositoryOpacityInfoMedium:
                theme.colors.colorRepositoryOpacityInfoMedium
            case .colorRepositoryOpacityAccentLow:
                theme.colors.colorRepositoryOpacityAccentLow
            case .colorRepositoryOpacityAccentMedium:
                theme.colors.colorRepositoryOpacityAccentMedium
            case .colorRepositoryOpacityNegativeLow:
                theme.colors.colorRepositoryOpacityNegativeLow
            case .colorRepositoryOpacityNegativeMedium:
                theme.colors.colorRepositoryOpacityNegativeMedium
            case .colorRepositoryOpacityPositiveLow:
                theme.colors.colorRepositoryOpacityPositiveLow
            case .colorRepositoryOpacityPositiveMedium:
                theme.colors.colorRepositoryOpacityPositiveMedium
            case .colorRepositoryOpacityWarningLow:
                theme.colors.colorRepositoryOpacityWarningLow
            case .colorRepositoryOpacityWarningMedium:
                theme.colors.colorRepositoryOpacityWarningMedium
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
            case .colorRepositoryPositiveMedium:
                theme.colors.colorRepositoryPositiveMedium
            case .colorRepositoryPositiveHigh:
                theme.colors.colorRepositoryPositiveHigh
            case .colorRepositoryPositiveHigher:
                theme.colors.colorRepositoryPositiveHigher
            case .colorRepositoryPositiveHighest:
                theme.colors.colorRepositoryPositiveHighest
            case .colorRepositoryPositiveLow:
                theme.colors.colorRepositoryPositiveLow
            case .colorRepositoryPositiveLower:
                theme.colors.colorRepositoryPositiveLower
            case .colorRepositoryPositiveLowest:
                theme.colors.colorRepositoryPositiveLowest
            case .colorRepositoryPrimaryHighest:
                theme.colors.colorRepositoryPrimaryHighest
            case .colorRepositoryPrimaryHigher:
                theme.colors.colorRepositoryPrimaryHigher
            case .colorRepositoryPrimaryHigh:
                theme.colors.colorRepositoryPrimaryHigh
            case .colorRepositoryPrimaryMedium:
                theme.colors.colorRepositoryPrimaryMedium
            case .colorRepositoryPrimaryLow:
                theme.colors.colorRepositoryPrimaryLow
            case .colorRepositoryPrimaryLower:
                theme.colors.colorRepositoryPrimaryLower
            case .colorRepositoryPrimaryLowest:
                theme.colors.colorRepositoryPrimaryLowest
            case .colorRepositorySecondaryHighest:
                theme.colors.colorRepositorySecondaryHighest
            case .colorRepositorySecondaryHigher:
                theme.colors.colorRepositorySecondaryHigher
            case .colorRepositorySecondaryHigh:
                theme.colors.colorRepositorySecondaryHigh
            case .colorRepositorySecondaryMedium:
                theme.colors.colorRepositorySecondaryMedium
            case .colorRepositorySecondaryLow:
                theme.colors.colorRepositorySecondaryLow
            case .colorRepositorySecondaryLower:
                theme.colors.colorRepositorySecondaryLower
            case .colorRepositorySecondaryLowest:
                theme.colors.colorRepositorySecondaryLowest
            case .colorRepositoryTertiaryHighest:
                theme.colors.colorRepositoryTertiaryHighest
            case .colorRepositoryTertiaryHigher:
                theme.colors.colorRepositoryTertiaryHigher
            case .colorRepositoryTertiaryHigh:
                theme.colors.colorRepositoryTertiaryHigh
            case .colorRepositoryTertiaryMedium:
                theme.colors.colorRepositoryTertiaryMedium
            case .colorRepositoryTertiaryLow:
                theme.colors.colorRepositoryTertiaryLow
            case .colorRepositoryTertiaryLower:
                theme.colors.colorRepositoryTertiaryLower
            case .colorRepositoryTertiaryLowest:
                theme.colors.colorRepositoryTertiaryLowest
            case .colorRepositoryWarningHighest:
                theme.colors.colorRepositoryWarningHighest
            case .colorRepositoryWarningHigher:
                theme.colors.colorRepositoryWarningHigher
            case .colorRepositoryWarningHigh:
                theme.colors.colorRepositoryWarningHigh
            case .colorRepositoryWarningMedium:
                theme.colors.colorRepositoryWarningMedium
            case .colorRepositoryWarningLow:
                theme.colors.colorRepositoryWarningLow
            case .colorRepositoryWarningLower:
                theme.colors.colorRepositoryWarningLower
            case .colorRepositoryWarningLowest:
                theme.colors.colorRepositoryWarningLowest
            }
        }
    }
}

// swiftlint:enable function_body_length
// swiftlint:enable type_body_length
