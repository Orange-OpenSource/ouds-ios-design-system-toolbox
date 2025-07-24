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

        // We can bang! theme.colorCharts here because controls on the existence of theme.colorCharts have been previosuly done
        // swiftlint:disable force_unwrapping
        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .colorChartBorder:
                theme.colorCharts!.colorChartBorder
            case .colorChartBorderContrast:
                theme.colorCharts!.colorChartBorderContrast
            case .colorChartCategoricalTier1:
                theme.colorCharts!.colorChartCategoricalTier1
            case .colorChartCategoricalTier2:
                theme.colorCharts!.colorChartCategoricalTier2
            case .colorChartCategoricalTier3:
                theme.colorCharts!.colorChartCategoricalTier3
            case .colorChartCategoricalTier4:
                theme.colorCharts!.colorChartCategoricalTier4
            case .colorChartCategoricalTier5:
                theme.colorCharts!.colorChartCategoricalTier5
            case .colorChartCategoricalTier6:
                theme.colorCharts!.colorChartCategoricalTier6
            case .colorChartCategoricalTier7:
                theme.colorCharts!.colorChartCategoricalTier7
            case .colorChartCategoricalTier8:
                theme.colorCharts!.colorChartCategoricalTier8
            case .colorChartCategoricalTier9:
                theme.colorCharts!.colorChartCategoricalTier9
            case .colorChartCategoricalTier10:
                theme.colorCharts!.colorChartCategoricalTier10
            case .colorChartFunctionalInfo:
                theme.colorCharts!.colorChartFunctionalInfo
            case .colorChartFunctionalNegative:
                theme.colorCharts!.colorChartFunctionalNegative
            case .colorChartFunctionalPositive:
                theme.colorCharts!.colorChartFunctionalPositive
            case .colorChartFunctionalWarning:
                theme.colorCharts!.colorChartFunctionalWarning
            case .colorChartGridlines:
                theme.colorCharts!.colorChartGridlines
            case .colorChartHighlight:
                theme.colorCharts!.colorChartHighlight
            case .colorChartNeutral:
                theme.colorCharts!.colorChartNeutral
            }
        }
        // swiftlint:enable force_unwrapping
    }
}
