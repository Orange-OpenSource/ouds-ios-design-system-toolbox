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

import OUDSSwiftUI

extension NamedSpace {

    enum PaddingInline: String, CaseIterable, NamedSpaceToken {
        case paddingInlineNone
        case paddingInline4xsmall
        case paddingInline3xsmall
        case paddingInline2xsmall
        case paddingInlineXsmall
        case paddingInlineSmall
        case paddingInlineMedium
        case paddingInlineLarge
        case paddingInlineXlarge
        case paddingInline2xlarge
        case paddingInline3xlarge
        case paddingInline4xlarge

        var name: String { rawValue }

        func token(from theme: OUDSTheme) -> SpaceSemanticToken {
            switch self {
            case .paddingInlineNone:
                theme.spaces.paddingInlineNone
            case .paddingInline4xsmall:
                theme.spaces.paddingInline4xsmall
            case .paddingInline3xsmall:
                theme.spaces.paddingInline3xsmall
            case .paddingInline2xsmall:
                theme.spaces.paddingInline2xsmall
            case .paddingInlineXsmall:
                theme.spaces.paddingInlineXsmall
            case .paddingInlineSmall:
                theme.spaces.paddingInlineSmall
            case .paddingInlineMedium:
                theme.spaces.paddingInlineMedium
            case .paddingInlineLarge:
                theme.spaces.paddingInlineLarge
            case .paddingInlineXlarge:
                theme.spaces.paddingInlineXlarge
            case .paddingInline2xlarge:
                theme.spaces.paddingInline2xlarge
            case .paddingInline3xlarge:
                theme.spaces.paddingInline3xlarge
            case .paddingInline4xlarge:
                theme.spaces.paddingInline4xlarge
            }
        }
    }
}
