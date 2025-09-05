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

    enum PaddingBlock: String, CaseIterable, NamedSpaceToken {
        case spacePaddingBlockNone
        case spacePaddingBlock4xs
        case spacePaddingBlock3xs
        case spacePaddingBlock2xs
        case spacePaddingBlockXs
        case spacePaddingBlockSm
        case spacePaddingBlockMd
        case spacePaddingBlockLg
        case spacePaddingBlockXl
        case spacePaddingBlock2xl
        case spacePaddingBlock3xl
        case spacePaddingBlock4xl

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spacePaddingBlockNone:
                theme.spaces.spacePaddingBlockNone
            case .spacePaddingBlock4xs:
                theme.spaces.spacePaddingBlock4xs
            case .spacePaddingBlock3xs:
                theme.spaces.spacePaddingBlock3xs
            case .spacePaddingBlock2xs:
                theme.spaces.spacePaddingBlock2xs
            case .spacePaddingBlockXs:
                theme.spaces.spacePaddingBlockXs
            case .spacePaddingBlockSm:
                theme.spaces.spacePaddingBlockSm
            case .spacePaddingBlockMd:
                theme.spaces.spacePaddingBlockMd
            case .spacePaddingBlockLg:
                theme.spaces.spacePaddingBlockLg
            case .spacePaddingBlockXl:
                theme.spaces.spacePaddingBlockXl
            case .spacePaddingBlock2xl:
                theme.spaces.spacePaddingBlock2xl
            case .spacePaddingBlock3xl:
                theme.spaces.spacePaddingBlock3xl
            case .spacePaddingBlock4xl:
                theme.spaces.spacePaddingBlock4xl
            }
        }
    }
}
