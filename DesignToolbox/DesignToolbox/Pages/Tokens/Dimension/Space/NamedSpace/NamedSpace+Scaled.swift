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

extension NamedSpace {

    enum Scaled: String, CaseIterable {
        case spaceScaledNone
        case spaceScaled3xsmall
        case spaceScaled2xsmall
        case spaceScaledXsmall
        case spaceScaledSmall
        case spaceScaledMedium
        case spaceScaledLarge
        case spaceScaledXlarge
        case spaceScaled2xlarge
        case spaceScaled3xlarge

        func token(from theme: OUDSTheme) -> MultipleSpaceSemanticTokens {
            switch self {
            case .spaceScaledNone:
                theme.spaces.spaceScaledNone
            case .spaceScaled3xsmall:
                theme.spaces.spaceScaled3xsmall
            case .spaceScaled2xsmall:
                theme.spaces.spaceScaled2xsmall
            case .spaceScaledXsmall:
                theme.spaces.spaceScaledXsmall
            case .spaceScaledSmall:
                theme.spaces.spaceScaledSmall
            case .spaceScaledMedium:
                theme.spaces.spaceScaledMedium
            case .spaceScaledLarge:
                theme.spaces.spaceScaledLarge
            case .spaceScaledXlarge:
                theme.spaces.spaceScaledXlarge
            case .spaceScaled2xlarge:
                theme.spaces.spaceScaled2xlarge
            case .spaceScaled3xlarge:
                theme.spaces.spaceScaled3xlarge
            }
        }
    }
}
