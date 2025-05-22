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

    enum PaddingInset: String, CaseIterable, NamedSpaceToken {
        case spaceInsetNone
        case spaceInsetSmash
        case spaceInsetShortest
        case spaceInsetShorter
        case spaceInsetShort
        case spaceInsetMedium
        case spaceInsetTall
        case spaceInsetTaller
        case spaceInsetTallest
        case spaceInsetSpacious

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spaceInsetNone:
                theme.spaces.spaceInsetNone
            case .spaceInsetSmash:
                theme.spaces.spaceInsetSmash
            case .spaceInsetShortest:
                theme.spaces.spaceInsetShortest
            case .spaceInsetShorter:
                theme.spaces.spaceInsetShorter
            case .spaceInsetShort:
                theme.spaces.spaceInsetShort
            case .spaceInsetMedium:
                theme.spaces.spaceInsetMedium
            case .spaceInsetTall:
                theme.spaces.spaceInsetTall
            case .spaceInsetTaller:
                theme.spaces.spaceInsetTaller
            case .spaceInsetTallest:
                theme.spaces.spaceInsetTallest
            case .spaceInsetSpacious:
                theme.spaces.spaceInsetSpacious
            }
        }
    }
}
