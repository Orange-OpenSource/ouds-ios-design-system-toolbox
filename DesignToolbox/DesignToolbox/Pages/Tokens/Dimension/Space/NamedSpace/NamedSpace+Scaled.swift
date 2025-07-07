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
        case spaceScaled3xs
        case spaceScaled2xs
        case spaceScaledXs
        case spaceScaledSm
        case spaceScaledMd
        case spaceScaledLg
        case spaceScaledXl
        case spaceScaled2xl
        case spaceScaled3xl

        func token(from theme: OUDSTheme) -> MultipleSpaceSemanticTokens {
            switch self {
            case .spaceScaledNone:
                theme.spaces.spaceScaledNone
            case .spaceScaled3xs:
                theme.spaces.spaceScaled3xs
            case .spaceScaled2xs:
                theme.spaces.spaceScaled2xs
            case .spaceScaledXs:
                theme.spaces.spaceScaledXs
            case .spaceScaledSm:
                theme.spaces.spaceScaledSm
            case .spaceScaledMd:
                theme.spaces.spaceScaledMd
            case .spaceScaledLg:
                theme.spaces.spaceScaledLg
            case .spaceScaledXl:
                theme.spaces.spaceScaledXl
            case .spaceScaled2xl:
                theme.spaces.spaceScaled2xl
            case .spaceScaled3xl:
                theme.spaces.spaceScaled3xl
            }
        }
    }
}
