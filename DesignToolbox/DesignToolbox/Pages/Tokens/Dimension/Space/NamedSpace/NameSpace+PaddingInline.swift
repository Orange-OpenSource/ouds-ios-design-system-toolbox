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
        case spacePaddingInlineXs
        case spacePaddingInlineSm
        case spacePaddingInlineMd
        case spacePaddingInlineTall
        case spacePaddingInlineTaller
        case spacePaddingInlineTallest

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .spacePaddingInlineNone:
                theme.spaces.spacePaddingInlineNone
            case .spacePaddingInlineXs:
                theme.spaces.spacePaddingInlineXs
            case .spacePaddingInlineSm:
                theme.spaces.spacePaddingInlineSm
            case .spacePaddingInlineMd:
                theme.spaces.spacePaddingInlineMd
            case .spacePaddingInlineTall:
                theme.spaces.spacePaddingInlineLg
            case .spacePaddingInlineTaller:
                theme.spaces.spacePaddingInlineXl
            case .spacePaddingInlineTallest:
                theme.spaces.spacePaddingInline2xl
            }
        }
    }
}
