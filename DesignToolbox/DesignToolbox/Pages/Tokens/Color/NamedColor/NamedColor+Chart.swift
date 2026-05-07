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
        func token(from theme: OUDSTheme) -> MultipleColorSemanticToken {
            switch self {
            case .border:
                theme.colorsCharts!.border
            case .borderContrast:
                theme.colorsCharts!.borderContrast
            case .categoricalTier1:
                theme.colorsCharts!.categoricalTier1
            case .categoricalTier2:
                theme.colorsCharts!.categoricalTier2
            case .categoricalTier3:
                theme.colorsCharts!.categoricalTier3
            case .categoricalTier4:
                theme.colorsCharts!.categoricalTier4
            case .categoricalTier5:
                theme.colorsCharts!.categoricalTier5
            case .categoricalTier6:
                theme.colorsCharts!.categoricalTier6
            case .categoricalTier7:
                theme.colorsCharts!.categoricalTier7
            case .categoricalTier8:
                theme.colorsCharts!.categoricalTier8
            case .categoricalTier9:
                theme.colorsCharts!.categoricalTier9
            case .categoricalTier10:
                theme.colorsCharts!.categoricalTier10
            case .functionalInfo:
                theme.colorsCharts!.functionalInfo
            case .functionalNegative:
                theme.colorsCharts!.functionalNegative
            case .functionalPositive:
                theme.colorsCharts!.functionalPositive
            case .functionalWarning:
                theme.colorsCharts!.functionalWarning
            case .gridlines:
                theme.colorsCharts!.gridlines
            case .highlight:
                theme.colorsCharts!.highlight
            case .neutral:
                theme.colorsCharts!.neutral
            }
        }
        // swiftlint:enable force_unwrapping
    }
}
