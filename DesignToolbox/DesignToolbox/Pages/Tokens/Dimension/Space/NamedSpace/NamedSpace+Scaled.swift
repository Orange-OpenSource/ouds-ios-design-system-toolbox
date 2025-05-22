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
        case spaceScaledSmash
        case spaceScaledShortest
        case spaceScaledShorter
        case spaceScaledShort
        case spaceScaledMedium
        case spaceScaledTall
        case spaceScaledTaller
        case spaceScaledTallest
        case spaceScaledSpacious

        func token(from theme: OUDSTheme) -> MultipleSpaceSemanticTokens {
            switch self {
            case .spaceScaledNone:
                theme.spaces.spaceScaledNone
            case .spaceScaledSmash:
                theme.spaces.spaceScaledSmash
            case .spaceScaledShortest:
                theme.spaces.spaceScaledShortest
            case .spaceScaledShorter:
                theme.spaces.spaceScaledShorter
            case .spaceScaledShort:
                theme.spaces.spaceScaledShort
            case .spaceScaledMedium:
                theme.spaces.spaceScaledMedium
            case .spaceScaledTall:
                theme.spaces.spaceScaledTall
            case .spaceScaledTaller:
                theme.spaces.spaceScaledTaller
            case .spaceScaledTallest:
                theme.spaces.spaceScaledTallest
            case .spaceScaledSpacious:
                theme.spaces.spaceScaledSpacious
            }
        }
    }
}
