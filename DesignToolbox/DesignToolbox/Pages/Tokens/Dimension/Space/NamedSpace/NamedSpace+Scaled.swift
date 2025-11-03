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

import OUDSSwiftUI

extension NamedSpace {

    enum Scaled: String, CaseIterable {
        case scaledNone
        case scaled3xsmall
        case scaled2xsmall
        case scaledXsmall
        case scaledSmall
        case scaledMedium
        case scaledLarge
        case scaledXlarge
        case scaled2xlarge
        case scaled3xlarge

        func token(from theme: OUDSTheme) -> MultipleSpaceSemanticTokens {
            switch self {
            case .scaledNone:
                theme.spaces.scaledNone
            case .scaled3xsmall:
                theme.spaces.scaled3xsmall
            case .scaled2xsmall:
                theme.spaces.scaled2xsmall
            case .scaledXsmall:
                theme.spaces.scaledXsmall
            case .scaledSmall:
                theme.spaces.scaledSmall
            case .scaledMedium:
                theme.spaces.scaledMedium
            case .scaledLarge:
                theme.spaces.scaledLarge
            case .scaledXlarge:
                theme.spaces.scaledXlarge
            case .scaled2xlarge:
                theme.spaces.scaled2xlarge
            case .scaled3xlarge:
                theme.spaces.scaled3xlarge
            }
        }
    }
}
