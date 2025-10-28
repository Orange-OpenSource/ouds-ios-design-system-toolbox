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
        case insetNone
        case inset4xsmall
        case inset3xsmall
        case inset2xsmall
        case insetXsmall
        case insetSmall
        case insetMedium
        case insetLarge
        case insetXlarge
        case inset2xlarge
        case inset3xlarge

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .insetNone:
                theme.spaces.insetNone
            case .inset4xsmall:
                theme.spaces.inset4xsmall
            case .inset3xsmall:
                theme.spaces.inset3xsmall
            case .inset2xsmall:
                theme.spaces.inset2xsmall
            case .insetXsmall:
                theme.spaces.insetXsmall
            case .insetSmall:
                theme.spaces.insetSmall
            case .insetMedium:
                theme.spaces.insetMedium
            case .insetLarge:
                theme.spaces.insetLarge
            case .insetXlarge:
                theme.spaces.insetXlarge
            case .inset2xlarge:
                theme.spaces.inset2xlarge
            case .inset3xlarge:
                theme.spaces.inset3xlarge
            }
        }
    }
}
