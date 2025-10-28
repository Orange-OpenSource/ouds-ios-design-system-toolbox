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
        case chartBorder
        case chartBorderContrast
        case chartCategoricalTier1
        case chartCategoricalTier2
        case chartCategoricalTier3
        case chartCategoricalTier4
        case chartCategoricalTier5
        case chartCategoricalTier6
        case chartCategoricalTier7
        case chartCategoricalTier8
        case chartCategoricalTier9
        case chartCategoricalTier10
        case chartFunctionalInfo
        case chartFunctionalNegative
        case chartFunctionalPositive
        case chartFunctionalWarning
        case chartGridlines
        case chartHighlight
        case chartNeutral

        // We can bang! theme.charts here because controls on the existence of theme.charts have been previosuly done
        // swiftlint:disable force_unwrapping
        func token(from theme: OUDSTheme) -> MultipleColorSemanticTokens {
            switch self {
            case .chartBorder:
                theme.charts!.chartBorder
            case .chartBorderContrast:
                theme.charts!.chartBorderContrast
            case .chartCategoricalTier1:
                theme.charts!.chartCategoricalTier1
            case .chartCategoricalTier2:
                theme.charts!.chartCategoricalTier2
            case .chartCategoricalTier3:
                theme.charts!.chartCategoricalTier3
            case .chartCategoricalTier4:
                theme.charts!.chartCategoricalTier4
            case .chartCategoricalTier5:
                theme.charts!.chartCategoricalTier5
            case .chartCategoricalTier6:
                theme.charts!.chartCategoricalTier6
            case .chartCategoricalTier7:
                theme.charts!.chartCategoricalTier7
            case .chartCategoricalTier8:
                theme.charts!.chartCategoricalTier8
            case .chartCategoricalTier9:
                theme.charts!.chartCategoricalTier9
            case .chartCategoricalTier10:
                theme.charts!.chartCategoricalTier10
            case .chartFunctionalInfo:
                theme.charts!.chartFunctionalInfo
            case .chartFunctionalNegative:
                theme.charts!.chartFunctionalNegative
            case .chartFunctionalPositive:
                theme.charts!.chartFunctionalPositive
            case .chartFunctionalWarning:
                theme.charts!.chartFunctionalWarning
            case .chartGridlines:
                theme.charts!.chartGridlines
            case .chartHighlight:
                theme.charts!.chartHighlight
            case .chartNeutral:
                theme.charts!.chartNeutral
            }
        }
        // swiftlint:enable force_unwrapping
    }
}
