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
        case sequentialAccent1Tint100
        case sequentialAccent1Tint200
        case sequentialAccent1Tint300
        case sequentialAccent1Tint400
        case sequentialAccent1Tint500
        case sequentialAccent1Tint600
        case sequentialAccent1Tint700
        case sequentialAccent1Tint800
        case sequentialAccent1Tint900
        case sequentialAccent2Tint100
        case sequentialAccent2Tint200
        case sequentialAccent2Tint300
        case sequentialAccent2Tint400
        case sequentialAccent2Tint500
        case sequentialAccent2Tint600
        case sequentialAccent2Tint700
        case sequentialAccent2Tint800
        case sequentialAccent2Tint900
        case sequentialAccent3Tint100
        case sequentialAccent3Tint200
        case sequentialAccent3Tint300
        case sequentialAccent3Tint400
        case sequentialAccent3Tint500
        case sequentialAccent3Tint600
        case sequentialAccent3Tint700
        case sequentialAccent3Tint800
        case sequentialAccent3Tint900
        case sequentialAccent4Tint100
        case sequentialAccent4Tint200
        case sequentialAccent4Tint300
        case sequentialAccent4Tint400
        case sequentialAccent4Tint500
        case sequentialAccent4Tint600
        case sequentialAccent4Tint700
        case sequentialAccent4Tint800
        case sequentialAccent4Tint900
        case sequentialAccent5Tint100
        case sequentialAccent5Tint200
        case sequentialAccent5Tint300
        case sequentialAccent5Tint400
        case sequentialAccent5Tint500
        case sequentialAccent5Tint600
        case sequentialAccent5Tint700
        case sequentialAccent5Tint800
        case sequentialAccent5Tint900

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
            case .sequentialAccent1Tint100:
                theme.colorsCharts!.sequentialAccent1Tint100
            case .sequentialAccent1Tint200:
                theme.colorsCharts!.sequentialAccent1Tint200
            case .sequentialAccent1Tint300:
                theme.colorsCharts!.sequentialAccent1Tint300
            case .sequentialAccent1Tint400:
                theme.colorsCharts!.sequentialAccent1Tint400
            case .sequentialAccent1Tint500:
                theme.colorsCharts!.sequentialAccent1Tint500
            case .sequentialAccent1Tint600:
                theme.colorsCharts!.sequentialAccent1Tint600
            case .sequentialAccent1Tint700:
                theme.colorsCharts!.sequentialAccent1Tint700
            case .sequentialAccent1Tint800:
                theme.colorsCharts!.sequentialAccent1Tint800
            case .sequentialAccent1Tint900:
                theme.colorsCharts!.sequentialAccent1Tint900
            case .sequentialAccent2Tint100:
                theme.colorsCharts!.sequentialAccent2Tint100
            case .sequentialAccent2Tint200:
                theme.colorsCharts!.sequentialAccent2Tint200
            case .sequentialAccent2Tint300:
                theme.colorsCharts!.sequentialAccent2Tint300
            case .sequentialAccent2Tint400:
                theme.colorsCharts!.sequentialAccent2Tint400
            case .sequentialAccent2Tint500:
                theme.colorsCharts!.sequentialAccent2Tint500
            case .sequentialAccent2Tint600:
                theme.colorsCharts!.sequentialAccent2Tint600
            case .sequentialAccent2Tint700:
                theme.colorsCharts!.sequentialAccent2Tint700
            case .sequentialAccent2Tint800:
                theme.colorsCharts!.sequentialAccent2Tint800
            case .sequentialAccent2Tint900:
                theme.colorsCharts!.sequentialAccent2Tint900
            case .sequentialAccent3Tint100:
                theme.colorsCharts!.sequentialAccent3Tint100
            case .sequentialAccent3Tint200:
                theme.colorsCharts!.sequentialAccent3Tint200
            case .sequentialAccent3Tint300:
                theme.colorsCharts!.sequentialAccent3Tint300
            case .sequentialAccent3Tint400:
                theme.colorsCharts!.sequentialAccent3Tint400
            case .sequentialAccent3Tint500:
                theme.colorsCharts!.sequentialAccent3Tint500
            case .sequentialAccent3Tint600:
                theme.colorsCharts!.sequentialAccent3Tint600
            case .sequentialAccent3Tint700:
                theme.colorsCharts!.sequentialAccent3Tint700
            case .sequentialAccent3Tint800:
                theme.colorsCharts!.sequentialAccent3Tint800
            case .sequentialAccent3Tint900:
                theme.colorsCharts!.sequentialAccent3Tint900
            case .sequentialAccent4Tint100:
                theme.colorsCharts!.sequentialAccent4Tint100
            case .sequentialAccent4Tint200:
                theme.colorsCharts!.sequentialAccent4Tint200
            case .sequentialAccent4Tint300:
                theme.colorsCharts!.sequentialAccent4Tint300
            case .sequentialAccent4Tint400:
                theme.colorsCharts!.sequentialAccent4Tint400
            case .sequentialAccent4Tint500:
                theme.colorsCharts!.sequentialAccent4Tint500
            case .sequentialAccent4Tint600:
                theme.colorsCharts!.sequentialAccent4Tint600
            case .sequentialAccent4Tint700:
                theme.colorsCharts!.sequentialAccent4Tint700
            case .sequentialAccent4Tint800:
                theme.colorsCharts!.sequentialAccent4Tint800
            case .sequentialAccent4Tint900:
                theme.colorsCharts!.sequentialAccent4Tint900
            case .sequentialAccent5Tint100:
                theme.colorsCharts!.sequentialAccent5Tint100
            case .sequentialAccent5Tint200:
                theme.colorsCharts!.sequentialAccent5Tint200
            case .sequentialAccent5Tint300:
                theme.colorsCharts!.sequentialAccent5Tint300
            case .sequentialAccent5Tint400:
                theme.colorsCharts!.sequentialAccent5Tint400
            case .sequentialAccent5Tint500:
                theme.colorsCharts!.sequentialAccent5Tint500
            case .sequentialAccent5Tint600:
                theme.colorsCharts!.sequentialAccent5Tint600
            case .sequentialAccent5Tint700:
                theme.colorsCharts!.sequentialAccent5Tint700
            case .sequentialAccent5Tint800:
                theme.colorsCharts!.sequentialAccent5Tint800
            case .sequentialAccent5Tint900:
                theme.colorsCharts!.sequentialAccent5Tint900
            }
        }
        // swiftlint:enable force_unwrapping
    }
}

// swiftlint:enable function_body_length
