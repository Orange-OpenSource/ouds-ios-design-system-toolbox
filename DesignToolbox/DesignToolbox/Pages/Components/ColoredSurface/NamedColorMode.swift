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
import OUDSComponents
import OUDSTokensSemantic

enum NamedColorMode: CaseIterable, CustomStringConvertible {

    case modeOnBrandPrimary
    case modeOnBrandSecondary
    case modeOnBrandTertiary
    case modeOnStatusAccentEmphasized
    case modeOnStatusAccentMuted
    case modeOnStatusInfoEmphasized
    case modeOnStatusInfoMuted
    case modeOnStatusNegativeEmphasized
    case modeOnStatusNegativeMuted
    case modeOnStatusNeutralEmphasized
    case modeOnStatusNeutralMuted
    case modeOnStatusPositiveEmphasized
    case modeOnStatusPositiveMuted
    case modeOnStatusWarningEmphasized
    case modeOnStatusWarningMuted

    func toSurfaceColor(from theme: OUDSTheme) -> OUDSColoredSurface.SurfaceColor {
        switch self {
        case .modeOnBrandPrimary:
            theme.colorModes.modeOnBrandPrimary
        case .modeOnBrandSecondary:
            theme.colorModes.modeOnBrandSecondary
        case .modeOnBrandTertiary:
            theme.colorModes.modeOnBrandTertiary
        case .modeOnStatusAccentEmphasized:
            theme.colorModes.modeOnStatusAccentEmphasized
        case .modeOnStatusAccentMuted:
            theme.colorModes.modeOnStatusAccentMuted
        case .modeOnStatusInfoEmphasized:
            theme.colorModes.modeOnStatusInfoEmphasized
        case .modeOnStatusInfoMuted:
            theme.colorModes.modeOnStatusInfoMuted
        case .modeOnStatusNegativeEmphasized:
            theme.colorModes.modeOnStatusNegativeEmphasized
        case .modeOnStatusNegativeMuted:
            theme.colorModes.modeOnStatusNegativeMuted
        case .modeOnStatusNeutralEmphasized:
            theme.colorModes.modeOnStatusNeutralEmphasized
        case .modeOnStatusNeutralMuted:
            theme.colorModes.modeOnStatusNeutralMuted
        case .modeOnStatusPositiveEmphasized:
            theme.colorModes.modeOnStatusPositiveEmphasized
        case .modeOnStatusPositiveMuted:
            theme.colorModes.modeOnStatusPositiveMuted
        case .modeOnStatusWarningEmphasized:
            theme.colorModes.modeOnStatusWarningEmphasized
        case .modeOnStatusWarningMuted:
            theme.colorModes.modeOnStatusWarningMuted
        }
    }

    // No l10n, tehchnical names
    var formattedName: String {
        switch self {
        case .modeOnBrandPrimary:
            "Brand Primary"
        case .modeOnBrandSecondary:
            "Brand Secondary"
        case .modeOnBrandTertiary:
            "Brand Tertiary"
        case .modeOnStatusAccentEmphasized:
            "Status Accent Emphasized"
        case .modeOnStatusAccentMuted:
            "Status Accent Muted"
        case .modeOnStatusInfoEmphasized:
            "Status Info Emphasized"
        case .modeOnStatusInfoMuted:
            "Status Info Muted"
        case .modeOnStatusNegativeEmphasized:
            "Status Negative Emphasized"
        case .modeOnStatusNegativeMuted:
            "Status Negative Muted"
        case .modeOnStatusNeutralEmphasized:
            "Status Neutral Emphasized"
        case .modeOnStatusNeutralMuted:
            "Status Neutral Muted"
        case .modeOnStatusPositiveEmphasized:
            "Status Positive Emphasized"
        case .modeOnStatusPositiveMuted:
            "Status Positive Muted"
        case .modeOnStatusWarningEmphasized:
            "Status Warning Emphasized"
        case .modeOnStatusWarningMuted:
            "Status Warning Muted"
        }
    }

    public var description: String {
        switch self {
        case .modeOnBrandPrimary:
            "modeOnBrandPrimary"
        case .modeOnBrandSecondary:
            "modeOnBrandSecondary"
        case .modeOnBrandTertiary:
            "modeOnBrandTertiary"
        case .modeOnStatusAccentEmphasized:
            "modeOnStatusAccentEmphasized"
        case .modeOnStatusAccentMuted:
            "modeOnStatusAccentMuted"
        case .modeOnStatusInfoEmphasized:
            "modeOnStatusInfoEmphasized"
        case .modeOnStatusInfoMuted:
            "modeOnStatusInfoMuted"
        case .modeOnStatusNegativeEmphasized:
            "modeOnStatusNegativeEmphasized"
        case .modeOnStatusNegativeMuted:
            "modeOnStatusNegativeMuted"
        case .modeOnStatusNeutralEmphasized:
            "modeOnStatusNeutralEmphasized"
        case .modeOnStatusNeutralMuted:
            "modeOnStatusNeutralMuted"
        case .modeOnStatusPositiveEmphasized:
            "modeOnStatusPositiveEmphasized"
        case .modeOnStatusPositiveMuted:
            "modeOnStatusPositiveMuted"
        case .modeOnStatusWarningEmphasized:
            "modeOnStatusWarningEmphasized"
        case .modeOnStatusWarningMuted:
            "modeOnStatusWarningMuted"
        }
    }

    var id: String { description }
}
