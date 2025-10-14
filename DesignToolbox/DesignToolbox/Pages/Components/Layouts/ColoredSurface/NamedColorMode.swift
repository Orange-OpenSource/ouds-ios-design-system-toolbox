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

    /*
     // MARK: - On Status

     // MARK: - Navigation

     var modeNavigationBar: MultipleColorModeSemanticTokens { get }
     */
    case modeOnBgPrimary
    case modeOnBgSecondary
    case modeOnBgTertiary
    case modeOnBrandPrimary
    case modeOnBrandSecondary
    case modeOnBrandTertiary
    case modeOnOverlayModal
    case modeOnOverlayDropdown
    case modeOnOverlayTooltip
    case modeOnStatusAccentEmphasized
    case modeOnStatusAccentMuted
    case modeOnStatusInfoEmphasized
    case modeOnStatusInfoMuted
    case modeOnStatusNegativeEmphasized
    case modeOnStatusNegativeMuted
    case modeOnStatusPositiveEmphasized
    case modeOnStatusPositiveMuted
    case modeOnStatusWarningEmphasized
    case modeOnStatusWarningMuted
    case modeNavigationBar

    func toSurfaceColor(from theme: OUDSTheme) -> OUDSColoredSurface.SurfaceColor {
        switch self {
        case .modeOnBgPrimary:
            theme.colorModes.modeOnBgPrimary
        case .modeOnBgSecondary:
            theme.colorModes.modeOnBgSecondary
        case .modeOnBgTertiary:
            theme.colorModes.modeOnBgTertiary
        case .modeOnBrandPrimary:
            theme.colorModes.modeOnBrandPrimary
        case .modeOnBrandSecondary:
            theme.colorModes.modeOnBrandSecondary
        case .modeOnBrandTertiary:
            theme.colorModes.modeOnBrandTertiary
        case .modeOnOverlayModal:
            theme.colorModes.modeOnOverlayModal
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
        case .modeOnStatusPositiveEmphasized:
            theme.colorModes.modeOnStatusPositiveEmphasized
        case .modeOnStatusPositiveMuted:
            theme.colorModes.modeOnStatusPositiveMuted
        case .modeOnStatusWarningEmphasized:
            theme.colorModes.modeOnStatusWarningEmphasized
        case .modeOnStatusWarningMuted:
            theme.colorModes.modeOnStatusWarningMuted
        case .modeOnOverlayDropdown:
            theme.colorModes.modeOnOverlayDropdown
        case .modeOnOverlayTooltip:
            theme.colorModes.modeOnOverlayTooltip
        case .modeNavigationBar:
            theme.colorModes.modeNavigationBar
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
        case .modeOnStatusPositiveEmphasized:
            "On Status Positive Emphasized"
        case .modeOnStatusPositiveMuted:
            "On Status Positive Muted"
        case .modeOnStatusWarningEmphasized:
            "On Status Warning Emphasized"
        case .modeOnStatusWarningMuted:
            "On Status Warning Muted"
        case .modeOnOverlayDropdown:
            "On Overlay Dropdown"
        case .modeOnOverlayTooltip:
            "On Overlay Tooltip"
        case .modeOnOverlayModal:
            "On Overlay Modal"
        case .modeNavigationBar:
            "Navigation Bar"
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
        case .modeOnStatusPositiveEmphasized:
            "modeOnStatusPositiveEmphasized"
        case .modeOnStatusPositiveMuted:
            "modeOnStatusPositiveMuted"
        case .modeOnStatusWarningEmphasized:
            "modeOnStatusWarningEmphasized"
        case .modeOnStatusWarningMuted:
            "modeOnStatusWarningMuted"
        case .modeOnOverlayDropdown:
            "modeOnOverlayDropdown"
        case .modeOnOverlayTooltip:
            "modeOnOverlayTooltip"
        case .modeOnOverlayModal:
            "modeOnOverlayModal"
        case .modeNavigationBar:
            "modeNavigationBar"
        }
    }

    var id: String { description }
}
