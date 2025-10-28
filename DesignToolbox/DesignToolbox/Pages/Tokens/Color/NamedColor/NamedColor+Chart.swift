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

    enum Chart: String, CaseIterable {
        case border
        case borderContrast
        case categoricalTier1
        case categoricalTier2
        case categoricalTier3
        case categoricalTier4
        case categoricalTier5
        case categoricalTier6
        case categoricalTier7
        case categoricalTier8
        case categoricalTier9
        case categoricalTier10
        case functionalInfo
        case functionalNegative
        case functionalPositive
        case functionalWarning
        case gridlines
        case highlight
        case neutral

        // We can bang! theme.charts here because controls on the existence of theme.charts have been previosuly done
        // swiftlint:disable force_unwrapping
        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .border:
                theme.charts!.border
            case .borderContrast:
                theme.charts!.borderContrast
            case .categoricalTier1:
                theme.charts!.categoricalTier1
            case .categoricalTier2:
                theme.charts!.categoricalTier2
            case .categoricalTier3:
                theme.charts!.categoricalTier3
            case .categoricalTier4:
                theme.charts!.categoricalTier4
            case .categoricalTier5:
                theme.charts!.categoricalTier5
            case .categoricalTier6:
                theme.charts!.categoricalTier6
            case .categoricalTier7:
                theme.charts!.categoricalTier7
            case .categoricalTier8:
                theme.charts!.categoricalTier8
            case .categoricalTier9:
                theme.charts!.categoricalTier9
            case .categoricalTier10:
                theme.charts!.categoricalTier10
            case .functionalInfo:
                theme.charts!.functionalInfo
            case .functionalNegative:
                theme.charts!.functionalNegative
            case .functionalPositive:
                theme.charts!.functionalPositive
            case .functionalWarning:
                theme.charts!.functionalWarning
            case .gridlines:
                theme.charts!.gridlines
            case .highlight:
                theme.charts!.highlight
            case .neutral:
                theme.charts!.neutral
            }
        }
        // swiftlint:enable force_unwrapping
    }
}
