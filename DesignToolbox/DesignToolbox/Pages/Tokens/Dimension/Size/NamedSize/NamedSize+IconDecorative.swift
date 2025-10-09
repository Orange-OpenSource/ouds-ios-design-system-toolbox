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
        case sizeIconDecorative4xsmall
        case sizeIconDecorative3xsmall
        case sizeIconDecorative2xsmall
        case sizeIconDecorativeXsmall
        case sizeIconDecorativeSmall
        case sizeIconDecorativeMedium
        case sizeIconDecorativeLarge
        case sizeIconDecorativeXlarge
        case sizeIconDecorative2xlarge

        func token(from theme: OUDSTheme) -> SizeSemanticToken {
            switch self {
            case .sizeIconDecorative4xsmall:
                theme.sizes.sizeIconDecorative4xs
            case .sizeIconDecorative3xsmall:
                theme.sizes.sizeIconDecorative3xs
            case .sizeIconDecorative2xsmall:
                theme.sizes.sizeIconDecorative2xs
            case .sizeIconDecorativeXsmall:
                theme.sizes.sizeIconDecorativeXs
            case .sizeIconDecorativeSmall:
                theme.sizes.sizeIconDecorativeSm
            case .sizeIconDecorativeMedium:
                theme.sizes.sizeIconDecorativeMd
            case .sizeIconDecorativeLarge:
                theme.sizes.sizeIconDecorativeLg
            case .sizeIconDecorativeXlarge:
                theme.sizes.sizeIconDecorativeXl
            case .sizeIconDecorative2xlarge:
                theme.sizes.sizeIconDecorative2xl
            }
        }
    }
}
