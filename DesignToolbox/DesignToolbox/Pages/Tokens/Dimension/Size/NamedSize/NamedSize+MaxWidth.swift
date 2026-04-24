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
import SwiftUI

extension NamedSize {
    enum MaxWidth: String, CaseIterable {
        case maxWidthDisplayLarge
        case maxWidthDisplayMedium
        case maxWidthDisplaySmall
        case maxWidthHeadingXlarge
        case maxWidthHeadingLarge
        case maxWidthHeadingMedium
        case maxWidthHeadingSmall
        case maxWidthBodyLarge
        case maxWidthBodyMedium
        case maxWidthBodySmall
        case maxWidthLabelXlarge
        case maxWidthLabelLarge
        case maxWidthLabelMedium
        case maxWidthLabelSmall

        func token(for theme: OUDSTheme, userInterfaceSizeClass: UserInterfaceSizeClass) -> SizeSemanticToken {
            switch self {
            case .maxWidthDisplayLarge:
                theme.sizes.maxWidthDisplayLarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthDisplayMedium:
                theme.sizes.maxWidthDisplayMedium.dimension(for: userInterfaceSizeClass)
            case .maxWidthDisplaySmall:
                theme.sizes.maxWidthDisplaySmall.dimension(for: userInterfaceSizeClass)
            case .maxWidthHeadingXlarge:
                theme.sizes.maxWidthHeadingXlarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthHeadingLarge:
                theme.sizes.maxWidthHeadingLarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthHeadingMedium:
                theme.sizes.maxWidthHeadingMedium.dimension(for: userInterfaceSizeClass)
            case .maxWidthHeadingSmall:
                theme.sizes.maxWidthHeadingSmall.dimension(for: userInterfaceSizeClass)
            case .maxWidthBodyLarge:
                theme.sizes.maxWidthBodyLarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthBodyMedium:
                theme.sizes.maxWidthBodyMedium.dimension(for: userInterfaceSizeClass)
            case .maxWidthBodySmall:
                theme.sizes.maxWidthBodySmall.dimension(for: userInterfaceSizeClass)
            case .maxWidthLabelXlarge:
                theme.sizes.maxWidthLabelXlarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthLabelLarge:
                theme.sizes.maxWidthLabelLarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthLabelMedium:
                theme.sizes.maxWidthLabelMedium.dimension(for: userInterfaceSizeClass)
            case .maxWidthLabelSmall:
                theme.sizes.maxWidthLabelSmall.dimension(for: userInterfaceSizeClass)
            }
        }
    }
}
