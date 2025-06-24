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
        case spaceInset3xs
        case spaceInset2xs
        case spaceInsetXs
        case spaceInsetSm
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
            case .spaceInset3xs:
                theme.spaces.spaceInset3xs
            case .spaceInset2xs:
                theme.spaces.spaceInset2xs
            case .spaceInsetXs:
                theme.spaces.spaceInsetXs
            case .spaceInsetSm:
                theme.spaces.spaceInsetSm
            case .spaceInsetMedium:
                theme.spaces.spaceInsetMd
            case .spaceInsetTall:
                theme.spaces.spaceInsetLg
            case .spaceInsetTaller:
                theme.spaces.spaceInsetXl
            case .spaceInsetTallest:
                theme.spaces.spaceInset2xl
            case .spaceInsetSpacious:
                theme.spaces.spaceInset3xl
            }
        }
    }
}
