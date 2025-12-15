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

    enum IconWithTypography: String, CaseIterable {

        // MARK: With Heading

        case iconWithHeadingXlargeSizeSmall
        case iconWithHeadingXlargeSizeMedium
        case iconWithHeadingXlargeSizeLarge

        case iconWithHeadingLargeSizeSmall
        case iconWithHeadingLargeSizeMedium
        case iconWithHeadingLargeSizeLarge

        case iconWithHeadingMediumSizeSmall
        case iconWithHeadingMediumSizeMedium
        case iconWithHeadingMediumSizeLarge

        case iconWithHeadingSmallSizeSmall
        case iconWithHeadingSmallSizeMedium
        case iconWithHeadingSmallSizeLarge

        // MARK: With Body

        case iconWithBodyLargeSizeSmall
        case iconWithBodyLargeSizeMedium
        case iconWithBodyLargeSizeLarge

        case iconWithBodyMediumSizeSmall
        case iconWithBodyMediumSizeMedium
        case iconWithBodyMediumSizeLarge

        case iconWithBodySmallSizeSmall
        case iconWithBodySmallSizeMedium
        case iconWithBodySmallSizeLarge

        // MARK: With Label

        case iconWithLabelXlargeSizeSmall
        case iconWithLabelXlargeSizeMedium
        case iconWithLabelXlargeSizeLarge

        case iconWithLabelLargeSizeXsmall
        case iconWithLabelLargeSizeSmall
        case iconWithLabelLargeSizeMedium
        case iconWithLabelLargeSizeLarge
        case iconWithLabelLargeSizeXlarge

        case iconWithLabelMediumSizeXsmall
        case iconWithLabelMediumSizeSmall
        case iconWithLabelMediumSizeMedium
        case iconWithLabelMediumSizeLarge

        case iconWithLabelSmallSizeXsmall
        case iconWithLabelSmallSizeSmall
        case iconWithLabelSmallSizeMedium
        case iconWithLabelSmallSizeLarge

        // MARK: Max width
        // Not sure they must be added

        // MARK: Min width
        // Not sure they must be added

        // swiftlint:disable function_body_length
        func token(for theme: OUDSTheme, userInterfaceSizeClass: UserInterfaceSizeClass) -> OUDSTokensSemantic.SizeSemanticToken {
            switch self {
            // Heading
            case .iconWithHeadingXlargeSizeSmall:
                theme.sizes.iconWithHeadingXlargeSizeSmall.dimension(for: userInterfaceSizeClass)
            case .iconWithHeadingXlargeSizeMedium:
                theme.sizes.iconWithHeadingXlargeSizeMedium.dimension(for: userInterfaceSizeClass)
            case .iconWithHeadingXlargeSizeLarge:
                theme.sizes.iconWithHeadingXlargeSizeLarge.dimension(for: userInterfaceSizeClass)
            case .iconWithHeadingLargeSizeSmall:
                theme.sizes.iconWithHeadingLargeSizeSmall.dimension(for: userInterfaceSizeClass)
            case .iconWithHeadingLargeSizeMedium:
                theme.sizes.iconWithHeadingLargeSizeMedium.dimension(for: userInterfaceSizeClass)
            case .iconWithHeadingLargeSizeLarge:
                theme.sizes.iconWithHeadingLargeSizeLarge.dimension(for: userInterfaceSizeClass)
            case .iconWithHeadingMediumSizeSmall:
                theme.sizes.iconWithHeadingMediumSizeSmall.dimension(for: userInterfaceSizeClass)
            case .iconWithHeadingMediumSizeMedium:
                theme.sizes.iconWithHeadingMediumSizeMedium.dimension(for: userInterfaceSizeClass)
            case .iconWithHeadingMediumSizeLarge:
                theme.sizes.iconWithHeadingMediumSizeLarge.dimension(for: userInterfaceSizeClass)
            case .iconWithHeadingSmallSizeSmall:
                theme.sizes.iconWithHeadingSmallSizeSmall.dimension(for: userInterfaceSizeClass)
            case .iconWithHeadingSmallSizeMedium:
                theme.sizes.iconWithHeadingSmallSizeMedium.dimension(for: userInterfaceSizeClass)
            case .iconWithHeadingSmallSizeLarge:
                theme.sizes.iconWithHeadingSmallSizeLarge.dimension(for: userInterfaceSizeClass)
            // Body
            case .iconWithBodyLargeSizeSmall:
                theme.sizes.iconWithBodyLargeSizeSmall.dimension(for: userInterfaceSizeClass)
            case .iconWithBodyLargeSizeMedium:
                theme.sizes.iconWithBodyLargeSizeMedium.dimension(for: userInterfaceSizeClass)
            case .iconWithBodyLargeSizeLarge:
                theme.sizes.iconWithBodyLargeSizeLarge.dimension(for: userInterfaceSizeClass)
            case .iconWithBodyMediumSizeSmall:
                theme.sizes.iconWithBodyMediumSizeSmall.dimension(for: userInterfaceSizeClass)
            case .iconWithBodyMediumSizeMedium:
                theme.sizes.iconWithBodyMediumSizeMedium.dimension(for: userInterfaceSizeClass)
            case .iconWithBodyMediumSizeLarge:
                theme.sizes.iconWithBodyMediumSizeLarge.dimension(for: userInterfaceSizeClass)
            case .iconWithBodySmallSizeSmall:
                theme.sizes.iconWithBodySmallSizeSmall.dimension(for: userInterfaceSizeClass)
            case .iconWithBodySmallSizeMedium:
                theme.sizes.iconWithBodySmallSizeMedium.dimension(for: userInterfaceSizeClass)
            case .iconWithBodySmallSizeLarge:
                theme.sizes.iconWithBodySmallSizeLarge.dimension(for: userInterfaceSizeClass)
            // With Label
            case .iconWithLabelXlargeSizeSmall:
                theme.sizes.iconWithLabelXlargeSizeSmall
            case .iconWithLabelXlargeSizeMedium:
                theme.sizes.iconWithLabelXlargeSizeMedium
            case .iconWithLabelXlargeSizeLarge:
                theme.sizes.iconWithLabelXlargeSizeLarge
            case .iconWithLabelLargeSizeXsmall:
                theme.sizes.iconWithLabelLargeSizeXsmall
            case .iconWithLabelLargeSizeSmall:
                theme.sizes.iconWithLabelLargeSizeSmall
            case .iconWithLabelLargeSizeMedium:
                theme.sizes.iconWithLabelLargeSizeMedium
            case .iconWithLabelLargeSizeLarge:
                theme.sizes.iconWithLabelLargeSizeLarge
            case .iconWithLabelLargeSizeXlarge:
                theme.sizes.iconWithLabelLargeSizeXlarge
            case .iconWithLabelMediumSizeXsmall:
                theme.sizes.iconWithLabelMediumSizeXsmall
            case .iconWithLabelMediumSizeSmall:
                theme.sizes.iconWithLabelMediumSizeSmall
            case .iconWithLabelMediumSizeMedium:
                theme.sizes.iconWithLabelMediumSizeMedium
            case .iconWithLabelMediumSizeLarge:
                theme.sizes.iconWithLabelMediumSizeLarge
            case .iconWithLabelSmallSizeXsmall:
                theme.sizes.iconWithLabelSmallSizeXsmall
            case .iconWithLabelSmallSizeSmall:
                theme.sizes.iconWithLabelSmallSizeSmall
            case .iconWithLabelSmallSizeMedium:
                theme.sizes.iconWithLabelSmallSizeMedium
            case .iconWithLabelSmallSizeLarge:
                theme.sizes.iconWithLabelSmallSizeLarge
            }
        }

        // swiftlint:enable function_body_length

        /// Provides the `namedFont associated to the icon size
        var namedFont: NamedFont {
            switch self {
            case .iconWithHeadingXlargeSizeSmall,
                 .iconWithHeadingXlargeSizeMedium,
                 .iconWithHeadingXlargeSizeLarge:
                .headingXLarge
            case .iconWithHeadingLargeSizeSmall,
                 .iconWithHeadingLargeSizeMedium,
                 .iconWithHeadingLargeSizeLarge:
                .headingLarge
            case .iconWithHeadingMediumSizeSmall,
                 .iconWithHeadingMediumSizeMedium,
                 .iconWithHeadingMediumSizeLarge:
                .headingMedium
            case .iconWithHeadingSmallSizeSmall,
                 .iconWithHeadingSmallSizeMedium,
                 .iconWithHeadingSmallSizeLarge:
                .headingSmall
            case .iconWithBodyLargeSizeSmall,
                 .iconWithBodyLargeSizeMedium,
                 .iconWithBodyLargeSizeLarge:
                .bodyDefaultLarge
            case .iconWithBodyMediumSizeSmall,
                 .iconWithBodyMediumSizeMedium,
                 .iconWithBodyMediumSizeLarge:
                .bodyDefaultMedium
            case .iconWithBodySmallSizeSmall,
                 .iconWithBodySmallSizeMedium,
                 .iconWithBodySmallSizeLarge:
                .bodyDefaultSmall
            case .iconWithLabelXlargeSizeSmall,
                 .iconWithLabelXlargeSizeMedium,
                 .iconWithLabelXlargeSizeLarge:
                .labelDefaultXLarge
            case .iconWithLabelLargeSizeXsmall,
                 .iconWithLabelLargeSizeSmall,
                 .iconWithLabelLargeSizeMedium,
                 .iconWithLabelLargeSizeLarge,
                 .iconWithLabelLargeSizeXlarge:
                .labelDefaultLarge
            case .iconWithLabelMediumSizeXsmall,
                 .iconWithLabelMediumSizeSmall,
                 .iconWithLabelMediumSizeMedium,
                 .iconWithLabelMediumSizeLarge:
                .labelDefaultMedium
            case .iconWithLabelSmallSizeXsmall,
                 .iconWithLabelSmallSizeSmall,
                 .iconWithLabelSmallSizeMedium,
                 .iconWithLabelSmallSizeLarge:
                .labelDefaultSmall
            }
        }

        var sizeDescription: String {
            switch self {
            case .iconWithHeadingXlargeSizeSmall,
                 .iconWithHeadingLargeSizeSmall,
                 .iconWithHeadingMediumSizeSmall,
                 .iconWithHeadingSmallSizeSmall,
                 .iconWithBodyLargeSizeSmall,
                 .iconWithBodyMediumSizeSmall,
                 .iconWithBodySmallSizeSmall,
                 .iconWithLabelXlargeSizeSmall,
                 .iconWithLabelLargeSizeSmall,
                 .iconWithLabelMediumSizeSmall,
                 .iconWithLabelSmallSizeSmall:
                "Size Small"
            case .iconWithHeadingXlargeSizeMedium,
                 .iconWithHeadingLargeSizeMedium,
                 .iconWithHeadingMediumSizeMedium,
                 .iconWithHeadingSmallSizeMedium,
                 .iconWithBodyLargeSizeMedium,
                 .iconWithBodyMediumSizeMedium,
                 .iconWithBodySmallSizeMedium,
                 .iconWithLabelXlargeSizeMedium,
                 .iconWithLabelLargeSizeMedium,
                 .iconWithLabelMediumSizeMedium,
                 .iconWithLabelSmallSizeMedium:
                "Size Medium"
            case .iconWithHeadingXlargeSizeLarge,
                 .iconWithHeadingLargeSizeLarge,
                 .iconWithHeadingMediumSizeLarge,
                 .iconWithHeadingSmallSizeLarge,
                 .iconWithBodyLargeSizeLarge,
                 .iconWithBodyMediumSizeLarge,
                 .iconWithBodySmallSizeLarge,
                 .iconWithLabelXlargeSizeLarge,
                 .iconWithLabelLargeSizeLarge,
                 .iconWithLabelMediumSizeLarge,
                 .iconWithLabelSmallSizeLarge:
                "Size Large"
            case .iconWithLabelSmallSizeXsmall,
                 .iconWithLabelMediumSizeXsmall,
                 .iconWithLabelLargeSizeXsmall:
                "Extra Small"
            case .iconWithLabelLargeSizeXlarge:
                "Extra Large"
            }
        }
    }

    /// Used to illustrate icon sizes grouped by
    /// typography category
    struct SizeIconByTypographyCategory {
        let namedFont: NamedFont
        var sizes: [NamedSize.IconWithTypography]
    }

    /// Provides all sizes grouped by typpgraphy categories
    static var iconSizeByTypographyCategories: [NamedSize.SizeIconByTypographyCategory] {
        var lastCategory: NamedSize.SizeIconByTypographyCategory?

        return NamedSize.IconWithTypography.allCases.reduce(into: []) { partialResult, namedSize in
            if namedSize.namedFont == lastCategory?.namedFont {
                lastCategory?.sizes.append(namedSize)
            } else {
                if let category = lastCategory {
                    partialResult.append(category)
                }

                lastCategory = SizeIconByTypographyCategory(namedFont: namedSize.namedFont, sizes: [namedSize])
            }
        }
    }
}
