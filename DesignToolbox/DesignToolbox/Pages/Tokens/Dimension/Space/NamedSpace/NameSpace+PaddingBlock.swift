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
        case spacePaddingBlock4xsmall
        case spacePaddingBlock3xsmall
        case spacePaddingBlock2xsmall
        case spacePaddingBlockXsmall
        case spacePaddingBlockSmall
        case spacePaddingBlockMedium
        case spacePaddingBlockLarge
        case spacePaddingBlockXlarge
        case spacePaddingBlock2xlarge
        case spacePaddingBlock3xlarge
        case spacePaddingBlock4xlarge

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spacePaddingBlockNone:
                theme.spaces.spacePaddingBlockNone
            case .spacePaddingBlock4xsmall:
                theme.spaces.spacePaddingBlock4xsmall
            case .spacePaddingBlock3xsmall:
                theme.spaces.spacePaddingBlock3xsmall
            case .spacePaddingBlock2xsmall:
                theme.spaces.spacePaddingBlock2xsmall
            case .spacePaddingBlockXsmall:
                theme.spaces.spacePaddingBlockXsmall
            case .spacePaddingBlockSmall:
                theme.spaces.spacePaddingBlockSmall
            case .spacePaddingBlockMedium:
                theme.spaces.spacePaddingBlockMedium
            case .spacePaddingBlockLarge:
                theme.spaces.spacePaddingBlockLarge
            case .spacePaddingBlockXlarge:
                theme.spaces.spacePaddingBlockXlarge
            case .spacePaddingBlock2xlarge:
                theme.spaces.spacePaddingBlock2xlarge
            case .spacePaddingBlock3xlarge:
                theme.spaces.spacePaddingBlock3xlarge
            case .spacePaddingBlock4xlarge:
                theme.spaces.spacePaddingBlock4xlarge
            }
        }
    }
}
