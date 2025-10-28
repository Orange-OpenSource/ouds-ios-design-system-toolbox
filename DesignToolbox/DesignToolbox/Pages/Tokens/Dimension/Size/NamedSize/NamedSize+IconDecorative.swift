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

extension NamedSize {
    enum IconDecorative: String, CaseIterable {
        case iconDecorative4xsmall
        case iconDecorative3xsmall
        case iconDecorative2xsmall
        case iconDecorativeXsmall
        case iconDecorativeSmall
        case iconDecorativeMedium
        case iconDecorativeLarge
        case iconDecorativeXlarge
        case iconDecorative2xlarge

        func token(from theme: OUDSTheme) -> SizeSemanticToken {
            switch self {
            case .iconDecorative4xsmall:
                theme.sizes.iconDecorative4xsmall
            case .iconDecorative3xsmall:
                theme.sizes.iconDecorative3xsmall
            case .iconDecorative2xsmall:
                theme.sizes.iconDecorative2xsmall
            case .iconDecorativeXsmall:
                theme.sizes.iconDecorativeXsmall
            case .iconDecorativeSmall:
                theme.sizes.iconDecorativeSmall
            case .iconDecorativeMedium:
                theme.sizes.iconDecorativeMedium
            case .iconDecorativeLarge:
                theme.sizes.iconDecorativeLarge
            case .iconDecorativeXlarge:
                theme.sizes.iconDecorativeXlarge
            case .iconDecorative2xlarge:
                theme.sizes.iconDecorative2xlarge
            }
        }
    }
}
