//
// Software Name: OUDSThemesContract iOS
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

import OUDSSwiftUI

extension NamedSpace {

    enum PaddingBlock: String, CaseIterable, NamedSpaceToken {
        case paddingBlockNone
        case paddingBlock4xsmall
        case paddingBlock3xsmall
        case paddingBlock2xsmall
        case paddingBlockXsmall
        case paddingBlockSmall
        case paddingBlockMedium
        case paddingBlockLarge
        case paddingBlockXlarge
        case paddingBlock2xlarge
        case paddingBlock3xlarge
        case paddingBlock4xlarge

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .paddingBlockNone:
                theme.spaces.paddingBlockNone
            case .paddingBlock4xsmall:
                theme.spaces.paddingBlock4xsmall
            case .paddingBlock3xsmall:
                theme.spaces.paddingBlock3xsmall
            case .paddingBlock2xsmall:
                theme.spaces.paddingBlock2xsmall
            case .paddingBlockXsmall:
                theme.spaces.paddingBlockXsmall
            case .paddingBlockSmall:
                theme.spaces.paddingBlockSmall
            case .paddingBlockMedium:
                theme.spaces.paddingBlockMedium
            case .paddingBlockLarge:
                theme.spaces.paddingBlockLarge
            case .paddingBlockXlarge:
                theme.spaces.paddingBlockXlarge
            case .paddingBlock2xlarge:
                theme.spaces.paddingBlock2xlarge
            case .paddingBlock3xlarge:
                theme.spaces.paddingBlock3xlarge
            case .paddingBlock4xlarge:
                theme.spaces.paddingBlock4xlarge
            }
        }
    }
}
