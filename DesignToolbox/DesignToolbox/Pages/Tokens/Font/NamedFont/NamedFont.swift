//
// Software Name: OUDSThemesContract iOS
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

import OUDSThemesContract
import OUDSTokensSemantic
import SwiftUI

// MARK: - Named Font

// swiftlint:disable function_body_length

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
    case bodyModerateLarge
    case bodyModerateMedium
    case bodyModerateSmall
    case bodyStrongLarge
    case bodyStrongMedium
    case bodyStrongSmall
    case labelDefaultXLarge
    case labelDefaultLarge
    case labelDefaultMedium
    case labelDefaultSmall
    case labelModerateXLarge
    case labelModerateLarge
    case labelModerateMedium
    case labelModerateSmall
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
            theme.fonts.displayLarge
        case .displayMedium:
            theme.fonts.displayMedium
        case .displaySmall:
            theme.fonts.displaySmall
        case .headingXLarge:
            theme.fonts.headingXLarge
        case .headingLarge:
            theme.fonts.headingLarge
        case .headingMedium:
            theme.fonts.headingMedium
        case .headingSmall:
            theme.fonts.headingSmall
        case .bodyDefaultLarge:
            theme.fonts.bodyDefaultLarge
        case .bodyDefaultMedium:
            theme.fonts.bodyDefaultMedium
        case .bodyDefaultSmall:
            theme.fonts.bodyDefaultSmall
        case .bodyModerateLarge:
            theme.fonts.bodyModerateLarge
        case .bodyModerateMedium:
            theme.fonts.bodyModerateMedium
        case .bodyModerateSmall:
            theme.fonts.bodyModerateSmall
        case .bodyStrongLarge:
            theme.fonts.bodyStrongLarge
        case .bodyStrongMedium:
            theme.fonts.bodyStrongMedium
        case .bodyStrongSmall:
            theme.fonts.bodyStrongSmall
        case .labelDefaultXLarge:
            theme.fonts.labelDefaultXLarge
        case .labelDefaultLarge:
            theme.fonts.labelDefaultLarge
        case .labelDefaultMedium:
            theme.fonts.labelDefaultMedium
        case .labelDefaultSmall:
            theme.fonts.labelDefaultSmall
        case .labelModerateXLarge:
            theme.fonts.labelModerateXLarge
        case .labelModerateLarge:
            theme.fonts.labelModerateLarge
        case .labelModerateMedium:
            theme.fonts.labelModerateMedium
        case .labelModerateSmall:
            theme.fonts.labelModerateSmall
        case .labelStrongXLarge:
            theme.fonts.labelStrongXLarge
        case .labelStrongLarge:
            theme.fonts.labelStrongLarge
        case .labelStrongMedium:
            theme.fonts.labelStrongMedium
        case .labelStrongSmall:
            theme.fonts.labelStrongSmall
        case .codeSmall:
            theme.fonts.codeSmall
        case .codeMedium:
            theme.fonts.codeMedium
        }
    }
}

// swiftlint:enable function_body_length
