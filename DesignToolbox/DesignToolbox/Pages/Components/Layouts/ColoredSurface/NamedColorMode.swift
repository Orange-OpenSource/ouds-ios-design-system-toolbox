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

enum NamedColorMode: CaseIterable, CustomStringConvertible {

    case onBgPrimary
    case onBgSecondary
    case onBgTertiary
    case onBgInverseHigh
    case onBgInverseLow
    case onBrandPrimary
    case onBrandSecondary
    case onBrandTertiary
    case onOverlayModal
    case onOverlayDropdown
    case onOverlayTooltip
    case onStatusAccentEmphasized
    case onStatusAccentMuted
    case onStatusInfoEmphasized
    case onStatusInfoMuted
    case onStatusNegativeEmphasized
    case onStatusNegativeMuted
    case onStatusPositiveEmphasized
    case onStatusPositiveMuted
    case onStatusWarningEmphasized
    case onStatusWarningMuted
    case onSurfacePrimary
    case onSurfaceSecondary
    case onSurfaceTertiary
    case onSurfaceInverseHigh
    case onSurfaceInverseLow
    case navigationBar

    func toSurfaceColor(from theme: OUDSTheme) -> OUDSColoredSurface.SurfaceColor {
        switch self {
        case .onBgPrimary:
            theme.colorModes.onBgPrimary
        case .onBgSecondary:
            theme.colorModes.onBgSecondary
        case .onBgTertiary:
            theme.colorModes.onBgTertiary
        case .onBgInverseHigh:
            theme.colorModes.onBgInverseHigh
        case .onBgInverseLow:
            theme.colorModes.onBgInverseLow
        case .onBrandPrimary:
            theme.colorModes.onBrandPrimary
        case .onBrandSecondary:
            theme.colorModes.onBrandSecondary
        case .onBrandTertiary:
            theme.colorModes.onBrandTertiary
        case .onOverlayModal:
            theme.colorModes.onOverlayModal
        case .onStatusAccentEmphasized:
            theme.colorModes.onStatusAccentEmphasized
        case .onStatusAccentMuted:
            theme.colorModes.onStatusAccentMuted
        case .onStatusInfoEmphasized:
            theme.colorModes.onStatusInfoEmphasized
        case .onStatusInfoMuted:
            theme.colorModes.onStatusInfoMuted
        case .onStatusNegativeEmphasized:
            theme.colorModes.onStatusNegativeEmphasized
        case .onStatusNegativeMuted:
            theme.colorModes.onStatusNegativeMuted
        case .onStatusPositiveEmphasized:
            theme.colorModes.onStatusPositiveEmphasized
        case .onStatusPositiveMuted:
            theme.colorModes.onStatusPositiveMuted
        case .onStatusWarningEmphasized:
            theme.colorModes.onStatusWarningEmphasized
        case .onStatusWarningMuted:
            theme.colorModes.onStatusWarningMuted
        case .onOverlayDropdown:
            theme.colorModes.onOverlayDropdown
        case .onOverlayTooltip:
            theme.colorModes.onOverlayTooltip
        case .onSurfacePrimary:
            theme.colorModes.onSurfacePrimary
        case .onSurfaceSecondary:
            theme.colorModes.onSurfaceSecondary
        case .onSurfaceTertiary:
            theme.colorModes.onSurfaceTertiary
        case .onSurfaceInverseHigh:
            theme.colorModes.onSurfaceInverseHigh
        case .onSurfaceInverseLow:
            theme.colorModes.onSurfaceInverseLow
        case .navigationBar:
            theme.colorModes.navigationBar
        }
    }

    // No l10n, tehchnical names
    var formattedName: String {
        switch self {
        case .onBgPrimary:
            "On Background Primary"
        case .onBgSecondary:
            "On Background Secondary"
        case .onBgTertiary:
            "On Background Tertiary"
        case .onBgInverseHigh:
            "On Background Inverse High"
        case .onBgInverseLow:
            "On Background Inverse Low"
        case .onBrandPrimary:
            "On Brand Primary"
        case .onBrandSecondary:
            "On Brand Secondary"
        case .onBrandTertiary:
            "On Brand Tertiary"
        case .onStatusAccentEmphasized:
            "On Status Accent Emphasized"
        case .onStatusAccentMuted:
            "On Status Accent Muted"
        case .onStatusInfoEmphasized:
            "On Status Info Emphasized"
        case .onStatusInfoMuted:
            "On Status Info Muted"
        case .onStatusNegativeEmphasized:
            "On Status Negative Emphasized"
        case .onStatusNegativeMuted:
            "On Status Negative Muted"
        case .onStatusPositiveEmphasized:
            "On Status Positive Emphasized"
        case .onStatusPositiveMuted:
            "On Status Positive Muted"
        case .onStatusWarningEmphasized:
            "On Status Warning Emphasized"
        case .onStatusWarningMuted:
            "On Status Warning Muted"
        case .onOverlayDropdown:
            "On Overlay Dropdown"
        case .onOverlayTooltip:
            "On Overlay Tooltip"
        case .onOverlayModal:
            "On Overlay Modal"
        case .onSurfacePrimary:
            "On Surface Primary"
        case .onSurfaceSecondary:
            "On Surface Secondary"
        case .onSurfaceTertiary:
            "On Surface Tertiary"
        case .onSurfaceInverseHigh:
            "On Surface Inverse High"
        case .onSurfaceInverseLow:
            "On Surface Inverse Low"
        case .navigationBar:
            "Navigation Bar"
        }
    }

    var description: String {
        switch self {
        case .onBgPrimary:
            "onBgPrimary"
        case .onBgSecondary:
            "onBgSecondary"
        case .onBgTertiary:
            "onBgTertiary"
        case .onBgInverseHigh:
            "onBgInverseHigh"
        case .onBgInverseLow:
            "onBgInverseLow"
        case .onBrandPrimary:
            "onBrandPrimary"
        case .onBrandSecondary:
            "onBrandSecondary"
        case .onBrandTertiary:
            "onBrandTertiary"
        case .onStatusAccentEmphasized:
            "onStatusAccentEmphasized"
        case .onStatusAccentMuted:
            "onStatusAccentMuted"
        case .onStatusInfoEmphasized:
            "onStatusInfoEmphasized"
        case .onStatusInfoMuted:
            "onStatusInfoMuted"
        case .onStatusNegativeEmphasized:
            "onStatusNegativeEmphasized"
        case .onStatusNegativeMuted:
            "onStatusNegativeMuted"
        case .onStatusPositiveEmphasized:
            "onStatusPositiveEmphasized"
        case .onStatusPositiveMuted:
            "onStatusPositiveMuted"
        case .onStatusWarningEmphasized:
            "onStatusWarningEmphasized"
        case .onStatusWarningMuted:
            "onStatusWarningMuted"
        case .onOverlayDropdown:
            "onOverlayDropdown"
        case .onOverlayTooltip:
            "onOverlayTooltip"
        case .onOverlayModal:
            "onOverlayModal"
        case .onSurfacePrimary:
            "onSurfacePrimary"
        case .onSurfaceSecondary:
            "onSurfaceSecondary"
        case .onSurfaceTertiary:
            "onSurfaceTertiary"
        case .onSurfaceInverseHigh:
            "onSurfaceInverseHigh"
        case .onSurfaceInverseLow:
            "onSurfaceInverseLow"
        case .navigationBar:
            "navigationBar"
        }
    }

    var id: String { description }
}

// swiftlint:enable function_body_length
