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

import OUDSThemesContract
import OUDSTokensSemantic
import SwiftUI

extension NamedSpace {

    enum Fixed: String, CaseIterable, NamedSpaceToken {
        case fixedNone
        case fixed3xsmall
        case fixed2xsmall
        case fixedXsmall
        case fixedSmall
        case fixedMedium
        case fixedLarge
        case fixedXlarge
        case fixed2xlarge
        case fixed3xlarge
        case fixed4xlarge
        case fixed5xlarge

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .fixedNone:
                theme.spaces.fixedNone
            case .fixed3xsmall:
                theme.spaces.fixed3xsmall
            case .fixed2xsmall:
                theme.spaces.fixed2xsmall
            case .fixedXsmall:
                theme.spaces.fixedXsmall
            case .fixedSmall:
                theme.spaces.fixedSmall
            case .fixedMedium:
                theme.spaces.fixedMedium
            case .fixedLarge:
                theme.spaces.fixedLarge
            case .fixedXlarge:
                theme.spaces.fixedXlarge
            case .fixed2xlarge:
                theme.spaces.fixed2xlarge
            case .fixed3xlarge:
                theme.spaces.fixed3xlarge
            case .fixed4xlarge:
                theme.spaces.fixed4xlarge
            case .fixed5xlarge:
                theme.spaces.fixed5xlarge
            }
        }
    }
}
