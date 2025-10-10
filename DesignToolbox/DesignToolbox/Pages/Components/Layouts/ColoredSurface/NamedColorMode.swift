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

    case modeOnBgPrimary
    case modeOnBgSecondary
    case modeOnBgTertiary
    case modeOnBgEmphasized
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
    case modeOnOverlayDefault
    case modeOnOverlayEmphasized
    case modeOnOverlayModal

    func toSurfaceColor(from theme: OUDSTheme) -> OUDSColoredSurface.SurfaceColor {
        switch self {
        case .modeOnBgPrimary:
            theme.colorModes.modeOnBgPrimary
        case .modeOnBgSecondary:
            theme.colorModes.modeOnBgSecondary
        case .modeOnBgTertiary:
            theme.colorModes.modeOnBgTertiary
        case .modeOnBgEmphasized:
            theme.colorModes.modeOnBgEmphasized
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
        case .modeOnOverlayDefault:
            theme.colorModes.modeOnOverlayDefault
        case .modeOnOverlayEmphasized:
            theme.colorModes.modeOnOverlayEmphasized
        case .modeOnOverlayModal:
            theme.colorModes.modeOnOverlayModal
        }
    }

    // No l10n, tehchnical names
    var formattedName: String {
        switch self {
        case .modeOnBgPrimary:
            "On Background Primary"
        case .modeOnBgSecondary:
            "On Background Secondary"
        case .modeOnBgTertiary:
            "On Background Tertiary"
        case .modeOnBgEmphasized:
            "On Background Emphasized"
        case .modeOnBrandPrimary:
            "On Brand Primary"
        case .modeOnBrandSecondary:
            "On Brand Secondary"
        case .modeOnBrandTertiary:
            "On Brand Tertiary"
        case .modeOnStatusAccentEmphasized:
            "On Status Accent Emphasized"
        case .modeOnStatusAccentMuted:
            "On Status Accent Muted"
        case .modeOnStatusInfoEmphasized:
            "On Status Info Emphasized"
        case .modeOnStatusInfoMuted:
            "On Status Info Muted"
        case .modeOnStatusNegativeEmphasized:
            "On Status Negative Emphasized"
        case .modeOnStatusNegativeMuted:
            "On Status Negative Muted"
        case .modeOnStatusNeutralEmphasized:
            "On Status Neutral Emphasized"
        case .modeOnStatusNeutralMuted:
            "On Status Neutral Muted"
        case .modeOnStatusPositiveEmphasized:
            "On Status Positive Emphasized"
        case .modeOnStatusPositiveMuted:
            "On Status Positive Muted"
        case .modeOnStatusWarningEmphasized:
            "On Status Warning Emphasized"
        case .modeOnStatusWarningMuted:
            "On Status Warning Muted"
        case .modeOnOverlayDefault:
            "On Overlay Default"
        case .modeOnOverlayEmphasized:
            "On Overlay Emphasized"
        case .modeOnOverlayModal:
            "On Overlay Modal"
        }
    }

    var description: String {
        switch self {
        case .modeOnBgPrimary:
            "modeOnBgPrimary"
        case .modeOnBgSecondary:
            "modeOnBgSecondary"
        case .modeOnBgTertiary:
            "modeOnBgTertiary"
        case .modeOnBgEmphasized:
            "modeOnBgEmphasized"
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
        case .modeOnOverlayDefault:
            "modeOnOverlayDefault"
        case .modeOnOverlayEmphasized:
            "modeOnOverlayEmphasized"
        case .modeOnOverlayModal:
            "modeOnOverlayModal"
        }
    }

    var id: String { description }
}
