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
        case spacePaddingBlockShorter
        case spacePaddingBlockShort
        case spacePaddingBlockMedium
        case spacePaddingBlockTall
        case spacePaddingBlockTaller
        case spacePaddingBlockTallest

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spacePaddingBlockNone:
                theme.spaces.spacePaddingBlockNone
            case .spacePaddingBlockShorter:
                theme.spaces.spacePaddingBlockShorter
            case .spacePaddingBlockShort:
                theme.spaces.spacePaddingBlockShort
            case .spacePaddingBlockMedium:
                theme.spaces.spacePaddingBlockMedium
            case .spacePaddingBlockTall:
                theme.spaces.spacePaddingBlockTall
            case .spacePaddingBlockTaller:
                theme.spaces.spacePaddingBlockTaller
            case .spacePaddingBlockTallest:
                theme.spaces.spacePaddingBlockTallest
            }
        }
    }
}
