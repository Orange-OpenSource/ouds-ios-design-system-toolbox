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
        case maxWidthTypeDisplayLarge
        case maxWidthTypeDisplayMedium
        case maxWidthTypeDisplaySmall
        case maxWidthTypeHeadingXlarge
        case maxWidthTypeHeadingLarge
        case maxWidthTypeHeadingMedium
        case maxWidthTypeHeadingSmall
        case maxWidthTypeBodyLarge
        case maxWidthTypeBodyMedium
        case maxWidthTypeBodySmall
        case maxWidthTypeLabelXlarge
        case maxWidthTypeLabelLarge
        case maxWidthTypeLabelMedium
        case maxWidthTypeLabelSmall

        func token(for theme: OUDSTheme, userInterfaceSizeClass: UserInterfaceSizeClass) -> SizeSemanticToken {
            switch self {
            case .maxWidthTypeDisplayLarge:
                theme.sizes.maxWidthTypeDisplayLarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeDisplayMedium:
                theme.sizes.maxWidthTypeDisplayMedium.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeDisplaySmall:
                theme.sizes.maxWidthTypeDisplaySmall.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeHeadingXlarge:
                theme.sizes.maxWidthTypeHeadingXlarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeHeadingLarge:
                theme.sizes.maxWidthTypeHeadingLarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeHeadingMedium:
                theme.sizes.maxWidthTypeHeadingMedium.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeHeadingSmall:
                theme.sizes.maxWidthTypeHeadingSmall.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeBodyLarge:
                theme.sizes.maxWidthTypeBodyLarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeBodyMedium:
                theme.sizes.maxWidthTypeBodyMedium.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeBodySmall:
                theme.sizes.maxWidthTypeBodySmall.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeLabelXlarge:
                theme.sizes.maxWidthTypeLabelXlarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeLabelLarge:
                theme.sizes.maxWidthTypeLabelLarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeLabelMedium:
                theme.sizes.maxWidthTypeLabelMedium.dimension(for: userInterfaceSizeClass)
            case .maxWidthTypeLabelSmall:
                theme.sizes.maxWidthTypeLabelSmall.dimension(for: userInterfaceSizeClass)
            }
        }
    }
}
