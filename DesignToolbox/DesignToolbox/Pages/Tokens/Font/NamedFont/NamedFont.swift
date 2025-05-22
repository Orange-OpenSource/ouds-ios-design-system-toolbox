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
import SwiftUI

// MARK: - Named Font

enum NamedFont: String, CaseIterable {
    case displayLarge
    case displayMedium
    case displaySmall
    case headingXLarge
    case headingLarge
    case headingMedium
    case headingSmall
    case bodyDefaultLarge
    case bodyDefaultMedium
    case bodyDefaultSmall
    case bodyStrongLarge
    case bodyStrongMedium
    case bodyStrongSmall
    case labelDefaultXLarge
    case labelDefaultLarge
    case labelDefaultMedium
    case labelDefaultSmall
    case labelStrongXLarge
    case labelStrongLarge
    case labelStrongMedium
    case labelStrongSmall
    case codeMedium
    case codeSmall

    // MARK: - Token Values

    func token(from theme: OUDSTheme) -> MultipleFontCompositeRawTokens {
        switch self {
        case .displayLarge:
            theme.fonts.typeDisplayLarge
        case .displayMedium:
            theme.fonts.typeDisplayMedium
        case .displaySmall:
            theme.fonts.typeDisplaySmall
        case .headingXLarge:
            theme.fonts.typeHeadingXLarge
        case .headingLarge:
            theme.fonts.typeHeadingLarge
        case .headingMedium:
            theme.fonts.typeHeadingMedium
        case .headingSmall:
            theme.fonts.typeHeadingSmall
        case .bodyDefaultLarge:
            theme.fonts.typeBodyDefaultLarge
        case .bodyDefaultMedium:
            theme.fonts.typeBodyDefaultMedium
        case .bodyDefaultSmall:
            theme.fonts.typeBodyDefaultSmall
        case .bodyStrongLarge:
            theme.fonts.typeBodyStrongLarge
        case .bodyStrongMedium:
            theme.fonts.typeBodyStrongMedium
        case .bodyStrongSmall:
            theme.fonts.typeBodyStrongSmall
        case .labelDefaultXLarge:
            theme.fonts.typeLabelDefaultXLarge
        case .labelDefaultLarge:
            theme.fonts.typeLabelDefaultLarge
        case .labelDefaultMedium:
            theme.fonts.typeLabelDefaultMedium
        case .labelDefaultSmall:
            theme.fonts.typeLabelDefaultSmall
        case .labelStrongXLarge:
            theme.fonts.typeLabelStrongXLarge
        case .labelStrongLarge:
            theme.fonts.typeLabelStrongLarge
        case .labelStrongMedium:
            theme.fonts.typeLabelStrongMedium
        case .labelStrongSmall:
            theme.fonts.typeLabelStrongSmall
        case .codeSmall:
            theme.fonts.typeCodeSmall
        case .codeMedium:
            theme.fonts.typeCodeMedium
        }
    }
}
