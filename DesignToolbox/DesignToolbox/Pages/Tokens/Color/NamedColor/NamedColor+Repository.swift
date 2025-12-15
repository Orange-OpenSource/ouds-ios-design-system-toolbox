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
// swiftlint:disable type_body_length

extension NamedColor {

    enum Repository: String, CaseIterable {
        case repositoryAccentHigh
        case repositoryAccentHigher
        case repositoryAccentHighest
        case repositoryAccentMedium
        case repositoryAccentLow
        case repositoryAccentLower
        case repositoryAccentLowest
        case repositoryInfoHigh
        case repositoryInfoHigher
        case repositoryInfoHighest
        case repositoryInfoMedium
        case repositoryInfoLow
        case repositoryInfoLower
        case repositoryInfoLowest
        case repositoryNegativeHigh
        case repositoryNegativeHigher
        case repositoryNegativeHighest
        case repositoryNegativeMedium
        case repositoryNegativeLow
        case repositoryNegativeLower
        case repositoryNegativeLowest
        case repositoryNeutralEmphasizedBlack
        case repositoryNeutralEmphasizedHigh
        case repositoryNeutralEmphasizedHigher
        case repositoryNeutralEmphasizedHighest
        case repositoryNeutralEmphasizedMedium
        case repositoryNeutralEmphasizedLow
        case repositoryNeutralEmphasizedLower
        case repositoryNeutralEmphasizedLowest
        case repositoryNeutralMutedHigh
        case repositoryNeutralMutedHigher
        case repositoryNeutralMutedHighest
        case repositoryNeutralMutedMedium
        case repositoryNeutralMutedLow
        case repositoryNeutralMutedLower
        case repositoryNeutralMutedLowest
        case repositoryNeutralMutedWhite
        case repositoryOpacityBlackHigh
        case repositoryOpacityBlackHigher
        case repositoryOpacityBlackHighest
        case repositoryOpacityBlackLow
        case repositoryOpacityBlackLower
        case repositoryOpacityBlackLowest
        case repositoryOpacityBlackMediumLow
        case repositoryOpacityBlackMedium
        case repositoryOpacityBlackMediumHigh
        case repositoryOpacityBlackTransparent
        case repositoryOpacityInfoLow
        case repositoryOpacityInfoMedium
        case repositoryOpacityAccentLow
        case repositoryOpacityAccentMedium
        case repositoryOpacityNegativeLow
        case repositoryOpacityNegativeMedium
        case repositoryOpacityPositiveLow
        case repositoryOpacityPositiveMedium
        case repositoryOpacityWarningLow
        case repositoryOpacityWarningMedium
        case repositoryOpacityWhiteHigh
        case repositoryOpacityWhiteHigher
        case repositoryOpacityWhiteHighest
        case repositoryOpacityWhiteMedium
        case repositoryOpacityWhiteMediumLow
        case repositoryOpacityWhiteLow
        case repositoryOpacityWhiteLower
        case repositoryOpacityWhiteLowest
        case repositoryOpacityWhiteTransparent
        case repositoryOpacityPrimaryTransparent
        case repositoryOpacityPrimaryLow
        case repositoryOpacityPrimaryLower
        case repositoryOpacityPrimaryLowest
        case repositoryOpacityPrimaryMedium
        case repositoryOpacityPrimaryHigh
        case repositoryOpacityPrimaryHigher
        case repositoryOpacityPrimaryHighest
        case repositoryPositiveMedium
        case repositoryPositiveHigh
        case repositoryPositiveHigher
        case repositoryPositiveHighest
        case repositoryPositiveLow
        case repositoryPositiveLower
        case repositoryPositiveLowest
        case repositoryPrimaryHighest
        case repositoryPrimaryHigher
        case repositoryPrimaryHigh
        case repositoryPrimaryMedium
        case repositoryPrimaryLow
        case repositoryPrimaryLower
        case repositoryPrimaryLowest
        case repositorySecondaryHighest
        case repositorySecondaryHigher
        case repositorySecondaryHigh
        case repositorySecondaryMedium
        case repositorySecondaryLow
        case repositorySecondaryLower
        case repositorySecondaryLowest
        case repositoryTertiaryHighest
        case repositoryTertiaryHigher
        case repositoryTertiaryHigh
        case repositoryTertiaryMedium
        case repositoryTertiaryLow
        case repositoryTertiaryLower
        case repositoryTertiaryLowest
        case repositoryWarningLow
        case repositoryWarningLower
        case repositoryWarningLowest
        case repositoryWarningMedium
        case repositoryWarningHigh
        case repositoryWarningHigher
        case repositoryWarningHighest

        func token(from theme: OUDSTheme) -> ColorSemanticToken {
            switch self {
            case .repositoryAccentMedium:
                theme.colors.repositoryAccentMedium
            case .repositoryAccentHigh:
                theme.colors.repositoryAccentHigh
            case .repositoryAccentHigher:
                theme.colors.repositoryAccentHigher
            case .repositoryAccentHighest:
                theme.colors.repositoryAccentHighest
            case .repositoryAccentLow:
                theme.colors.repositoryAccentLow
            case .repositoryAccentLower:
                theme.colors.repositoryAccentLower
            case .repositoryAccentLowest:
                theme.colors.repositoryAccentLowest
            case .repositoryInfoMedium:
                theme.colors.repositoryInfoMedium
            case .repositoryInfoHigh:
                theme.colors.repositoryInfoHigh
            case .repositoryInfoHigher:
                theme.colors.repositoryInfoHigher
            case .repositoryInfoHighest:
                theme.colors.repositoryInfoHighest
            case .repositoryInfoLow:
                theme.colors.repositoryInfoLow
            case .repositoryInfoLower:
                theme.colors.repositoryInfoLower
            case .repositoryInfoLowest:
                theme.colors.repositoryInfoLowest
            case .repositoryNegativeMedium:
                theme.colors.repositoryNegativeMedium
            case .repositoryNegativeHigh:
                theme.colors.repositoryNegativeHigh
            case .repositoryNegativeHigher:
                theme.colors.repositoryNegativeHigher
            case .repositoryNegativeHighest:
                theme.colors.repositoryNegativeHighest
            case .repositoryNegativeLow:
                theme.colors.repositoryNegativeLow
            case .repositoryNegativeLower:
                theme.colors.repositoryNegativeLower
            case .repositoryNegativeLowest:
                theme.colors.repositoryNegativeLowest
            case .repositoryNeutralEmphasizedBlack:
                theme.colors.repositoryNeutralEmphasizedBlack
            case .repositoryNeutralEmphasizedHigh:
                theme.colors.repositoryNeutralEmphasizedHigh
            case .repositoryNeutralEmphasizedHigher:
                theme.colors.repositoryNeutralEmphasizedHigher
            case .repositoryNeutralEmphasizedHighest:
                theme.colors.repositoryNeutralEmphasizedHighest
            case .repositoryNeutralEmphasizedMedium:
                theme.colors.repositoryNeutralEmphasizedMedium
            case .repositoryNeutralEmphasizedLow:
                theme.colors.repositoryNeutralEmphasizedLow
            case .repositoryNeutralEmphasizedLower:
                theme.colors.repositoryNeutralEmphasizedLower
            case .repositoryNeutralEmphasizedLowest:
                theme.colors.repositoryNeutralEmphasizedLowest
            case .repositoryNeutralMutedHigh:
                theme.colors.repositoryNeutralMutedHigh
            case .repositoryNeutralMutedHigher:
                theme.colors.repositoryNeutralMutedHigher
            case .repositoryNeutralMutedHighest:
                theme.colors.repositoryNeutralMutedHighest
            case .repositoryNeutralMutedMedium:
                theme.colors.repositoryNeutralMutedMedium
            case .repositoryNeutralMutedLow:
                theme.colors.repositoryNeutralMutedLow
            case .repositoryNeutralMutedLower:
                theme.colors.repositoryNeutralMutedLower
            case .repositoryNeutralMutedLowest:
                theme.colors.repositoryNeutralMutedLowest
            case .repositoryNeutralMutedWhite:
                theme.colors.repositoryNeutralMutedWhite
            case .repositoryOpacityBlackHigh:
                theme.colors.repositoryOpacityBlackHigh
            case .repositoryOpacityBlackHigher:
                theme.colors.repositoryOpacityBlackHigher
            case .repositoryOpacityBlackHighest:
                theme.colors.repositoryOpacityBlackHighest
            case .repositoryOpacityBlackLow:
                theme.colors.repositoryOpacityBlackLow
            case .repositoryOpacityBlackLower:
                theme.colors.repositoryOpacityBlackLower
            case .repositoryOpacityBlackLowest:
                theme.colors.repositoryOpacityBlackLowest
            case .repositoryOpacityBlackMediumLow:
                theme.colors.repositoryOpacityBlackMediumLow
            case .repositoryOpacityBlackMedium:
                theme.colors.repositoryOpacityBlackMedium
            case .repositoryOpacityBlackMediumHigh:
                theme.colors.repositoryOpacityBlackMediumHigh
            case .repositoryOpacityBlackTransparent:
                theme.colors.repositoryOpacityBlackTransparent
            case .repositoryOpacityInfoLow:
                theme.colors.repositoryOpacityInfoLow
            case .repositoryOpacityInfoMedium:
                theme.colors.repositoryOpacityInfoMedium
            case .repositoryOpacityAccentLow:
                theme.colors.repositoryOpacityAccentLow
            case .repositoryOpacityAccentMedium:
                theme.colors.repositoryOpacityAccentMedium
            case .repositoryOpacityNegativeLow:
                theme.colors.repositoryOpacityNegativeLow
            case .repositoryOpacityNegativeMedium:
                theme.colors.repositoryOpacityNegativeMedium
            case .repositoryOpacityPositiveLow:
                theme.colors.repositoryOpacityPositiveLow
            case .repositoryOpacityPositiveMedium:
                theme.colors.repositoryOpacityPositiveMedium
            case .repositoryOpacityWarningLow:
                theme.colors.repositoryOpacityWarningLow
            case .repositoryOpacityWarningMedium:
                theme.colors.repositoryOpacityWarningMedium
            case .repositoryOpacityWhiteHigh:
                theme.colors.repositoryOpacityWhiteHigh
            case .repositoryOpacityWhiteHigher:
                theme.colors.repositoryOpacityWhiteHigher
            case .repositoryOpacityWhiteHighest:
                theme.colors.repositoryOpacityWhiteHighest
            case .repositoryOpacityWhiteMedium:
                theme.colors.repositoryOpacityWhiteMedium
            case .repositoryOpacityWhiteMediumLow:
                theme.colors.repositoryOpacityWhiteMediumLow
            case .repositoryOpacityWhiteLow:
                theme.colors.repositoryOpacityWhiteLow
            case .repositoryOpacityWhiteLower:
                theme.colors.repositoryOpacityWhiteLower
            case .repositoryOpacityWhiteLowest:
                theme.colors.repositoryOpacityWhiteLowest
            case .repositoryOpacityWhiteTransparent:
                theme.colors.repositoryOpacityWhiteTransparent
            case .repositoryOpacityPrimaryTransparent:
                theme.colors.repositoryOpacityPrimaryTransparent
            case .repositoryOpacityPrimaryLow:
                theme.colors.repositoryOpacityPrimaryLow
            case .repositoryOpacityPrimaryLower:
                theme.colors.repositoryOpacityPrimaryLower
            case .repositoryOpacityPrimaryLowest:
                theme.colors.repositoryOpacityPrimaryLowest
            case .repositoryOpacityPrimaryMedium:
                theme.colors.repositoryOpacityPrimaryMedium
            case .repositoryOpacityPrimaryHigh:
                theme.colors.repositoryOpacityPrimaryHigh
            case .repositoryOpacityPrimaryHigher:
                theme.colors.repositoryOpacityPrimaryHigher
            case .repositoryOpacityPrimaryHighest:
                theme.colors.repositoryOpacityPrimaryHighest
            case .repositoryPositiveMedium:
                theme.colors.repositoryPositiveMedium
            case .repositoryPositiveHigh:
                theme.colors.repositoryPositiveHigh
            case .repositoryPositiveHigher:
                theme.colors.repositoryPositiveHigher
            case .repositoryPositiveHighest:
                theme.colors.repositoryPositiveHighest
            case .repositoryPositiveLow:
                theme.colors.repositoryPositiveLow
            case .repositoryPositiveLower:
                theme.colors.repositoryPositiveLower
            case .repositoryPositiveLowest:
                theme.colors.repositoryPositiveLowest
            case .repositoryPrimaryHighest:
                theme.colors.repositoryPrimaryHighest
            case .repositoryPrimaryHigher:
                theme.colors.repositoryPrimaryHigher
            case .repositoryPrimaryHigh:
                theme.colors.repositoryPrimaryHigh
            case .repositoryPrimaryMedium:
                theme.colors.repositoryPrimaryMedium
            case .repositoryPrimaryLow:
                theme.colors.repositoryPrimaryLow
            case .repositoryPrimaryLower:
                theme.colors.repositoryPrimaryLower
            case .repositoryPrimaryLowest:
                theme.colors.repositoryPrimaryLowest
            case .repositorySecondaryHighest:
                theme.colors.repositorySecondaryHighest
            case .repositorySecondaryHigher:
                theme.colors.repositorySecondaryHigher
            case .repositorySecondaryHigh:
                theme.colors.repositorySecondaryHigh
            case .repositorySecondaryMedium:
                theme.colors.repositorySecondaryMedium
            case .repositorySecondaryLow:
                theme.colors.repositorySecondaryLow
            case .repositorySecondaryLower:
                theme.colors.repositorySecondaryLower
            case .repositorySecondaryLowest:
                theme.colors.repositorySecondaryLowest
            case .repositoryTertiaryHighest:
                theme.colors.repositoryTertiaryHighest
            case .repositoryTertiaryHigher:
                theme.colors.repositoryTertiaryHigher
            case .repositoryTertiaryHigh:
                theme.colors.repositoryTertiaryHigh
            case .repositoryTertiaryMedium:
                theme.colors.repositoryTertiaryMedium
            case .repositoryTertiaryLow:
                theme.colors.repositoryTertiaryLow
            case .repositoryTertiaryLower:
                theme.colors.repositoryTertiaryLower
            case .repositoryTertiaryLowest:
                theme.colors.repositoryTertiaryLowest
            case .repositoryWarningHighest:
                theme.colors.repositoryWarningHighest
            case .repositoryWarningHigher:
                theme.colors.repositoryWarningHigher
            case .repositoryWarningHigh:
                theme.colors.repositoryWarningHigh
            case .repositoryWarningMedium:
                theme.colors.repositoryWarningMedium
            case .repositoryWarningLow:
                theme.colors.repositoryWarningLow
            case .repositoryWarningLower:
                theme.colors.repositoryWarningLower
            case .repositoryWarningLowest:
                theme.colors.repositoryWarningLowest
            }
        }
    }
}

// swiftlint:enable function_body_length
// swiftlint:enable type_body_length
