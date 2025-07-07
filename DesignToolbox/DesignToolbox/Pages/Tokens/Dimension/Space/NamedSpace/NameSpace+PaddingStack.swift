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

    enum PaddingStack: String, CaseIterable, NamedSpaceToken {
        case spacePaddingBlockNone
        case spacePaddingBlockXs
        case spacePaddingBlockSm
        case spacePaddingBlockMedium
        case spacePaddingBlockTall
        case spacePaddingBlockTaller
        case spacePaddingBlockTallest

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spacePaddingBlockNone:
                theme.spaces.spacePaddingBlockNone
            case .spacePaddingBlockXs:
                theme.spaces.spacePaddingBlockXs
            case .spacePaddingBlockSm:
                theme.spaces.spacePaddingBlockSm
            case .spacePaddingBlockMedium:
                theme.spaces.spacePaddingBlockMd
            case .spacePaddingBlockTall:
                theme.spaces.spacePaddingBlockLg
            case .spacePaddingBlockTaller:
                theme.spaces.spacePaddingBlockXl
            case .spacePaddingBlockTallest:
                theme.spaces.spacePaddingBlock2xl
            }
        }
    }
}
