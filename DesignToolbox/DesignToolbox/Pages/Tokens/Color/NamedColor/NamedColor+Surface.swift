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

    enum Surface: String, CaseIterable {
        case colorSurfaceBrandPrimary
        case colorSurfaceStatusAccentEmphasized
        case colorSurfaceStatusAccentMuted
        case colorSurfaceStatusInfoEmphasized
        case colorSurfaceStatusInfoMuted
        case colorSurfaceStatusNegativeEmphasized
        case colorSurfaceStatusNegativeMuted
        case colorSurfaceInverseHigh
        case colorSurfaceInverseLow
        case colorSurfaceSecondary
        case colorSurfaceStatusPositiveEmphasized
        case colorSurfaceStatusPositiveMuted
        case colorSurfaceStatusWarningEmphasized
        case colorSurfaceStatusWarningMuted

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .colorSurfaceBrandPrimary:
                theme.colors.colorSurfaceBrandPrimary
            case .colorSurfaceStatusAccentEmphasized:
                theme.colors.colorSurfaceStatusAccentEmphasized
            case .colorSurfaceStatusAccentMuted:
                theme.colors.colorSurfaceStatusAccentMuted
            case .colorSurfaceStatusInfoEmphasized:
                theme.colors.colorSurfaceStatusInfoEmphasized
            case .colorSurfaceStatusInfoMuted:
                theme.colors.colorSurfaceStatusInfoMuted
            case .colorSurfaceStatusNegativeEmphasized:
                theme.colors.colorSurfaceStatusNegativeEmphasized
            case .colorSurfaceStatusNegativeMuted:
                theme.colors.colorSurfaceStatusNegativeMuted
            case .colorSurfaceInverseHigh:
                theme.colors.colorSurfaceInverseHigh
            case .colorSurfaceInverseLow:
                theme.colors.colorSurfaceInverseLow
            case .colorSurfaceSecondary:
                theme.colors.colorSurfaceSecondary
            case .colorSurfaceStatusPositiveEmphasized:
                theme.colors.colorSurfaceStatusPositiveEmphasized
            case .colorSurfaceStatusPositiveMuted:
                theme.colors.colorSurfaceStatusPositiveMuted
            case .colorSurfaceStatusWarningEmphasized:
                theme.colors.colorSurfaceStatusWarningEmphasized
            case .colorSurfaceStatusWarningMuted:
                theme.colors.colorSurfaceStatusWarningMuted
            }
        }
    }
}
