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

    enum Surface: String, CaseIterable {
        case surfaceBrandPrimary
        case surfaceBrandSecondary
        case surfaceBrandTertiary
        case surfaceStatusAccentEmphasized
        case surfaceStatusAccentMuted
        case surfaceStatusInfoEmphasized
        case surfaceStatusInfoMuted
        case surfaceStatusNegativeEmphasized
        case surfaceStatusNegativeMuted
        case surfaceStatusPositiveEmphasized
        case surfaceStatusPositiveMuted
        case surfaceStatusWarningEmphasized
        case surfaceStatusWarningMuted
        case surfaceInverseHigh
        case surfaceInverseLow
        case surfacePrimary
        case surfaceSecondary
        case surfaceTertiary

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .surfaceBrandPrimary:
                theme.colors.surfaceBrandPrimary
            case .surfaceBrandSecondary:
                theme.colors.surfaceBrandSecondary
            case .surfaceBrandTertiary:
                theme.colors.surfaceBrandTertiary
            case .surfaceStatusAccentEmphasized:
                theme.colors.surfaceStatusAccentEmphasized
            case .surfaceStatusAccentMuted:
                theme.colors.surfaceStatusAccentMuted
            case .surfaceStatusInfoEmphasized:
                theme.colors.surfaceStatusInfoEmphasized
            case .surfaceStatusInfoMuted:
                theme.colors.surfaceStatusInfoMuted
            case .surfaceStatusNegativeEmphasized:
                theme.colors.surfaceStatusNegativeEmphasized
            case .surfaceStatusNegativeMuted:
                theme.colors.surfaceStatusNegativeMuted
            case .surfaceInverseHigh:
                theme.colors.surfaceInverseHigh
            case .surfaceInverseLow:
                theme.colors.surfaceInverseLow
            case .surfaceStatusPositiveEmphasized:
                theme.colors.surfaceStatusPositiveEmphasized
            case .surfaceStatusPositiveMuted:
                theme.colors.surfaceStatusPositiveMuted
            case .surfaceStatusWarningEmphasized:
                theme.colors.surfaceStatusWarningEmphasized
            case .surfaceStatusWarningMuted:
                theme.colors.surfaceStatusWarningMuted
            case .surfacePrimary:
                theme.colors.surfacePrimary
            case .surfaceSecondary:
                theme.colors.surfaceSecondary
            case .surfaceTertiary:
                theme.colors.surfaceTertiary
            }
        }
    }
}
