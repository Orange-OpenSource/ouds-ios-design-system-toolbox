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
import SwiftUI

extension NamedSize {

    enum IconWithTypography: String, CaseIterable {

        // MARK: With Heading

        case sizeIconWithHeadingXlargeSizeSmall
        case sizeIconWithHeadingXlargeSizeMedium
        case sizeIconWithHeadingXlargeSizeLarge

        case sizeIconWithHeadingLargeSizeSmall
        case sizeIconWithHeadingLargeSizeMedium
        case sizeIconWithHeadingLargeSizeLarge

        case sizeIconWithHeadingMediumSizeSmall
        case sizeIconWithHeadingMediumSizeMedium
        case sizeIconWithHeadingMediumSizeLarge

        case sizeIconWithHeadingSmallSizeSmall
        case sizeIconWithHeadingSmallSizeMedium
        case sizeIconWithHeadingSmallSizeLarge

        // MARK: With Body

        case sizeIconWithBodyLargeSizeSmall
        case sizeIconWithBodyLargeSizeMedium
        case sizeIconWithBodyLargeSizeLarge

        case sizeIconWithBodyMediumSizeSmall
        case sizeIconWithBodyMediumSizeMedium
        case sizeIconWithBodyMediumSizeLarge

        case sizeIconWithBodySmallSizeSmall
        case sizeIconWithBodySmallSizeMedium
        case sizeIconWithBodySmallSizeLarge

        // MARK: With Label

        case sizeIconWithLabelXlargeSizeSmall
        case sizeIconWithLabelXlargeSizeMedium
        case sizeIconWithLabelXlargeSizeLarge

        case sizeIconWithLabelLargeSizeXsmall
        case sizeIconWithLabelLargeSizeSmall
        case sizeIconWithLabelLargeSizeMedium
        case sizeIconWithLabelLargeSizeLarge
        case sizeIconWithLabelLargeSizeXlarge

        case sizeIconWithLabelMediumSizeXsmall
        case sizeIconWithLabelMediumSizeSmall
        case sizeIconWithLabelMediumSizeMedium
        case sizeIconWithLabelMediumSizeLarge

        case sizeIconWithLabelSmallSizeXsmall
        case sizeIconWithLabelSmallSizeSmall
        case sizeIconWithLabelSmallSizeMedium
        case sizeIconWithLabelSmallSizeLarge

        // MARK: Max width
        // Not sure they must be added

        // MARK: Min width
        // Not sure they must be added

        // swiftlint:disable function_body_length
        func token(for theme: OUDS.OUDSTheme, userInterfaceSizeClass: UserInterfaceSizeClass) -> OUDSTokensSemantic.SizeSemanticToken {
            switch self {
            // Heading
            case .sizeIconWithHeadingXlargeSizeSmall:
                theme.sizes.sizeIconWithHeadingXlargeSizeSmall.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingXlargeSizeMedium:
                theme.sizes.sizeIconWithHeadingXlargeSizeMedium.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingXlargeSizeLarge:
                theme.sizes.sizeIconWithHeadingXlargeSizeLarge.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingLargeSizeSmall:
                theme.sizes.sizeIconWithHeadingLargeSizeSmall.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingLargeSizeMedium:
                theme.sizes.sizeIconWithHeadingLargeSizeMedium.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingLargeSizeLarge:
                theme.sizes.sizeIconWithHeadingLargeSizeLarge.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingMediumSizeSmall:
                theme.sizes.sizeIconWithHeadingMediumSizeSmall.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingMediumSizeMedium:
                theme.sizes.sizeIconWithHeadingMediumSizeMedium.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingMediumSizeLarge:
                theme.sizes.sizeIconWithHeadingMediumSizeLarge.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingSmallSizeSmall:
                theme.sizes.sizeIconWithHeadingSmallSizeSmall.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingSmallSizeMedium:
                theme.sizes.sizeIconWithHeadingSmallSizeMedium.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingSmallSizeLarge:
                theme.sizes.sizeIconWithHeadingSmallSizeLarge.dimension(for: userInterfaceSizeClass)
            // Body
            case .sizeIconWithBodyLargeSizeSmall:
                theme.sizes.sizeIconWithBodyLargeSizeSmall.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodyLargeSizeMedium:
                theme.sizes.sizeIconWithBodyLargeSizeMedium.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodyLargeSizeLarge:
                theme.sizes.sizeIconWithBodyLargeSizeLarge.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodyMediumSizeSmall:
                theme.sizes.sizeIconWithBodyMediumSizeSmall.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodyMediumSizeMedium:
                theme.sizes.sizeIconWithBodyMediumSizeMedium.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodyMediumSizeLarge:
                theme.sizes.sizeIconWithBodyMediumSizeLarge.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodySmallSizeSmall:
                theme.sizes.sizeIconWithBodySmallSizeSmall.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodySmallSizeMedium:
                theme.sizes.sizeIconWithBodySmallSizeMedium.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodySmallSizeLarge:
                theme.sizes.sizeIconWithBodySmallSizeLarge.dimension(for: userInterfaceSizeClass)
            // With Label
            case .sizeIconWithLabelXlargeSizeSmall:
                theme.sizes.sizeIconWithLabelLargeSizeSmall
            case .sizeIconWithLabelXlargeSizeMedium:
                theme.sizes.sizeIconWithLabelLargeSizeMedium
            case .sizeIconWithLabelXlargeSizeLarge:
                theme.sizes.sizeIconWithLabelLargeSizeLarge
            case .sizeIconWithLabelLargeSizeXsmall:
                theme.sizes.sizeIconWithLabelLargeSizeXsmall
            case .sizeIconWithLabelLargeSizeSmall:
                theme.sizes.sizeIconWithLabelLargeSizeSmall
            case .sizeIconWithLabelLargeSizeMedium:
                theme.sizes.sizeIconWithLabelLargeSizeMedium
            case .sizeIconWithLabelLargeSizeLarge:
                theme.sizes.sizeIconWithLabelLargeSizeLarge
            case .sizeIconWithLabelLargeSizeXlarge:
                theme.sizes.sizeIconWithLabelLargeSizeXlarge
            case .sizeIconWithLabelMediumSizeXsmall:
                theme.sizes.sizeIconWithLabelMediumSizeXsmall
            case .sizeIconWithLabelMediumSizeSmall:
                theme.sizes.sizeIconWithLabelMediumSizeSmall
            case .sizeIconWithLabelMediumSizeMedium:
                theme.sizes.sizeIconWithLabelMediumSizeMedium
            case .sizeIconWithLabelMediumSizeLarge:
                theme.sizes.sizeIconWithLabelMediumSizeLarge
            case .sizeIconWithLabelSmallSizeXsmall:
                theme.sizes.sizeIconWithLabelSmallSizeXsmall
            case .sizeIconWithLabelSmallSizeSmall:
                theme.sizes.sizeIconWithLabelSmallSizeSmall
            case .sizeIconWithLabelSmallSizeMedium:
                theme.sizes.sizeIconWithLabelSmallSizeMedium
            case .sizeIconWithLabelSmallSizeLarge:
                theme.sizes.sizeIconWithLabelSmallSizeLarge
            }
        }

        // swiftlint:enable function_body_length

        /// Provides the `namedFont associated to the icon size
        var namedFont: NamedFont {
            switch self {
            case .sizeIconWithHeadingXlargeSizeSmall,
                 .sizeIconWithHeadingXlargeSizeMedium,
                 .sizeIconWithHeadingXlargeSizeLarge:
                .headingXLarge
            case .sizeIconWithHeadingLargeSizeSmall,
                 .sizeIconWithHeadingLargeSizeMedium,
                 .sizeIconWithHeadingLargeSizeLarge:
                .headingLarge
            case .sizeIconWithHeadingMediumSizeSmall,
                 .sizeIconWithHeadingMediumSizeMedium,
                 .sizeIconWithHeadingMediumSizeLarge:
                .headingMedium
            case .sizeIconWithHeadingSmallSizeSmall,
                 .sizeIconWithHeadingSmallSizeMedium,
                 .sizeIconWithHeadingSmallSizeLarge:
                .headingSmall
            case .sizeIconWithBodyLargeSizeSmall,
                 .sizeIconWithBodyLargeSizeMedium,
                 .sizeIconWithBodyLargeSizeLarge:
                .bodyDefaultLarge
            case .sizeIconWithBodyMediumSizeSmall,
                 .sizeIconWithBodyMediumSizeMedium,
                 .sizeIconWithBodyMediumSizeLarge:
                .bodyDefaultMedium
            case .sizeIconWithBodySmallSizeSmall,
                 .sizeIconWithBodySmallSizeMedium,
                 .sizeIconWithBodySmallSizeLarge:
                .bodyDefaultSmall
            case .sizeIconWithLabelXlargeSizeSmall,
                 .sizeIconWithLabelXlargeSizeMedium,
                 .sizeIconWithLabelXlargeSizeLarge:
                .labelDefaultXLarge
            case .sizeIconWithLabelLargeSizeXsmall,
                 .sizeIconWithLabelLargeSizeSmall,
                 .sizeIconWithLabelLargeSizeMedium,
                 .sizeIconWithLabelLargeSizeLarge,
                 .sizeIconWithLabelLargeSizeXlarge:
                .labelDefaultLarge
            case .sizeIconWithLabelMediumSizeXsmall,
                 .sizeIconWithLabelMediumSizeSmall,
                 .sizeIconWithLabelMediumSizeMedium,
                 .sizeIconWithLabelMediumSizeLarge:
                .labelDefaultMedium
            case .sizeIconWithLabelSmallSizeXsmall,
                 .sizeIconWithLabelSmallSizeSmall,
                 .sizeIconWithLabelSmallSizeMedium,
                 .sizeIconWithLabelSmallSizeLarge:
                .labelDefaultSmall
            }
        }

        var sizeDescription: String {
            switch self {
            case .sizeIconWithHeadingXlargeSizeSmall,
                 .sizeIconWithHeadingLargeSizeSmall,
                 .sizeIconWithHeadingMediumSizeSmall,
                 .sizeIconWithHeadingSmallSizeSmall,
                 .sizeIconWithBodyLargeSizeSmall,
                 .sizeIconWithBodyMediumSizeSmall,
                 .sizeIconWithBodySmallSizeSmall,
                 .sizeIconWithLabelXlargeSizeSmall,
                 .sizeIconWithLabelLargeSizeSmall,
                 .sizeIconWithLabelMediumSizeSmall,
                 .sizeIconWithLabelSmallSizeSmall:
                "Size Small"
            case .sizeIconWithHeadingXlargeSizeMedium,
                 .sizeIconWithHeadingLargeSizeMedium,
                 .sizeIconWithHeadingMediumSizeMedium,
                 .sizeIconWithHeadingSmallSizeMedium,
                 .sizeIconWithBodyLargeSizeMedium,
                 .sizeIconWithBodyMediumSizeMedium,
                 .sizeIconWithBodySmallSizeMedium,
                 .sizeIconWithLabelXlargeSizeMedium,
                 .sizeIconWithLabelLargeSizeMedium,
                 .sizeIconWithLabelMediumSizeMedium,
                 .sizeIconWithLabelSmallSizeMedium:
                "Size Medium"
            case .sizeIconWithHeadingXlargeSizeLarge,
                 .sizeIconWithHeadingLargeSizeLarge,
                 .sizeIconWithHeadingMediumSizeLarge,
                 .sizeIconWithHeadingSmallSizeLarge,
                 .sizeIconWithBodyLargeSizeLarge,
                 .sizeIconWithBodyMediumSizeLarge,
                 .sizeIconWithBodySmallSizeLarge,
                 .sizeIconWithLabelXlargeSizeLarge,
                 .sizeIconWithLabelLargeSizeLarge,
                 .sizeIconWithLabelMediumSizeLarge,
                 .sizeIconWithLabelSmallSizeLarge:
                "Size Large"
            case .sizeIconWithLabelSmallSizeXsmall,
                 .sizeIconWithLabelMediumSizeXsmall,
                 .sizeIconWithLabelLargeSizeXsmall:
                "Extra Small"
            case .sizeIconWithLabelLargeSizeXlarge:
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
