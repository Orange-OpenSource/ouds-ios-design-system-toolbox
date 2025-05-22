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
        case colorChartBorder
        case colorChartBorderContrast
        case colorChartCategoricalTier1
        case colorChartCategoricalTier2
        case colorChartCategoricalTier3
        case colorChartCategoricalTier4
        case colorChartCategoricalTier5
        case colorChartCategoricalTier6
        case colorChartCategoricalTier7
        case colorChartCategoricalTier8
        case colorChartCategoricalTier9
        case colorChartCategoricalTier10
        case colorChartFunctionalInfo
        case colorChartFunctionalNegative
        case colorChartFunctionalPositive
        case colorChartFunctionalWarning
        case colorChartGridlines
        case colorChartHighlight
        case colorChartNeutral

        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .colorChartBorder:
                theme.colors.colorChartBorder
            case .colorChartBorderContrast:
                theme.colors.colorChartBorderContrast
            case .colorChartCategoricalTier1:
                theme.colors.colorChartCategoricalTier1
            case .colorChartCategoricalTier2:
                theme.colors.colorChartCategoricalTier2
            case .colorChartCategoricalTier3:
                theme.colors.colorChartCategoricalTier3
            case .colorChartCategoricalTier4:
                theme.colors.colorChartCategoricalTier4
            case .colorChartCategoricalTier5:
                theme.colors.colorChartCategoricalTier5
            case .colorChartCategoricalTier6:
                theme.colors.colorChartCategoricalTier6
            case .colorChartCategoricalTier7:
                theme.colors.colorChartCategoricalTier7
            case .colorChartCategoricalTier8:
                theme.colors.colorChartCategoricalTier8
            case .colorChartCategoricalTier9:
                theme.colors.colorChartCategoricalTier9
            case .colorChartCategoricalTier10:
                theme.colors.colorChartCategoricalTier10
            case .colorChartFunctionalInfo:
                theme.colors.colorChartFunctionalInfo
            case .colorChartFunctionalNegative:
                theme.colors.colorChartFunctionalNegative
            case .colorChartFunctionalPositive:
                theme.colors.colorChartFunctionalPositive
            case .colorChartFunctionalWarning:
                theme.colors.colorChartFunctionalWarning
            case .colorChartGridlines:
                theme.colors.colorChartGridlines
            case .colorChartHighlight:
                theme.colors.colorChartHighlight
            case .colorChartNeutral:
                theme.colors.colorChartNeutral
            }
        }
    }
}
