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

    enum PaddingInline: String, CaseIterable, NamedSpaceToken {
        case spacePaddingInlineNone
        case spacePaddingInline4xsmall
        case spacePaddingInline3xsmall
        case spacePaddingInline2xsmall
        case spacePaddingInlineXsmall
        case spacePaddingInlineSmall
        case spacePaddingInlineMedium
        case spacePaddingInlineLarge
        case spacePaddingInlineXlarge
        case spacePaddingInline2xlarge
        case spacePaddingInline3xlarge
        case spacePaddingInline4xlarge

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spacePaddingInlineNone:
                theme.spaces.spacePaddingInlineNone
            case .spacePaddingInline4xsmall:
                theme.spaces.spacePaddingInline4xsmall
            case .spacePaddingInline3xsmall:
                theme.spaces.spacePaddingInline3xsmall
            case .spacePaddingInline2xsmall:
                theme.spaces.spacePaddingInline2xsmall
            case .spacePaddingInlineXsmall:
                theme.spaces.spacePaddingInlineXsmall
            case .spacePaddingInlineSmall:
                theme.spaces.spacePaddingInlineSmall
            case .spacePaddingInlineMedium:
                theme.spaces.spacePaddingInlineMedium
            case .spacePaddingInlineLarge:
                theme.spaces.spacePaddingInlineLarge
            case .spacePaddingInlineXlarge:
                theme.spaces.spacePaddingInlineXlarge
            case .spacePaddingInline2xlarge:
                theme.spaces.spacePaddingInline2xlarge
            case .spacePaddingInline3xlarge:
                theme.spaces.spacePaddingInline3xlarge
            case .spacePaddingInline4xlarge:
                theme.spaces.spacePaddingInline4xlarge
            }
        }
    }
}
