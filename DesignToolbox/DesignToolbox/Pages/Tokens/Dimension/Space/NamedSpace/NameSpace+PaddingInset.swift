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
        case spaceInset4xs
        case spaceInset3xs
        case spaceInset2xs
        case spaceInsetXs
        case spaceInsetSm
        case spaceInsetMd
        case spaceInsetLg
        case spaceInsetXl
        case spaceInset2xl
        case spaceInset3xl

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spaceInsetNone:
                theme.spaces.spaceInsetNone
            case .spaceInset4xs:
                theme.spaces.spaceInset4xs
            case .spaceInset3xs:
                theme.spaces.spaceInset3xs
            case .spaceInset2xs:
                theme.spaces.spaceInset2xs
            case .spaceInsetXs:
                theme.spaces.spaceInsetXs
            case .spaceInsetSm:
                theme.spaces.spaceInsetSm
            case .spaceInsetMd:
                theme.spaces.spaceInsetMd
            case .spaceInsetLg:
                theme.spaces.spaceInsetLg
            case .spaceInsetXl:
                theme.spaces.spaceInsetXl
            case .spaceInset2xl:
                theme.spaces.spaceInset2xl
            case .spaceInset3xl:
                theme.spaces.spaceInset3xl
            }
        }
    }
}
