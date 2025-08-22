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

        case sizeIconWithHeadingXlargeSizeSm
        case sizeIconWithHeadingXlargeSizeMd
        case sizeIconWithHeadingXlargeSizeLg

        case sizeIconWithHeadingLargeSizeSm
        case sizeIconWithHeadingLargeSizeMd
        case sizeIconWithHeadingLargeSizeLg

        case sizeIconWithHeadingMediumSizeSm
        case sizeIconWithHeadingMediumSizeMd
        case sizeIconWithHeadingMediumSizeLg

        case sizeIconWithHeadingSmallSizeSm
        case sizeIconWithHeadingSmallSizeMd
        case sizeIconWithHeadingSmallSizeLg

        // MARK: With Body

        case sizeIconWithBodyLargeSizeSm
        case sizeIconWithBodyLargeSizeMd
        case sizeIconWithBodyLargeSizeLg

        case sizeIconWithBodyMediumSizeSm
        case sizeIconWithBodyMediumSizeMd
        case sizeIconWithBodyMediumSizeLg

        case sizeIconWithBodySmallSizeSm
        case sizeIconWithBodySmallSizeMd
        case sizeIconWithBodySmallSizeLg

        // MARK: With Label

        case sizeIconWithLabelXlargeSizeSm
        case sizeIconWithLabelXlargeSizeMd
        case sizeIconWithLabelXlargeSizeLg

        case sizeIconWithLabelLargeSizeXs
        case sizeIconWithLabelLargeSizeSm
        case sizeIconWithLabelLargeSizeMd
        case sizeIconWithLabelLargeSizeLg
        case sizeIconWithLabelLargeSizeXl

        case sizeIconWithLabelMediumSizeXs
        case sizeIconWithLabelMediumSizeSm
        case sizeIconWithLabelMediumSizeMd
        case sizeIconWithLabelMediumSizeLg

        case sizeIconWithLabelSmallSizeXs
        case sizeIconWithLabelSmallSizeSm
        case sizeIconWithLabelSmallSizeMd
        case sizeIconWithLabelSmallSizeLg

        // MARK: Max width
        // Not sure they must be added

        // MARK: Min width
        // Not sure they must be added

        // swiftlint:disable function_body_length
        func token(for theme: OUDS.OUDSTheme, userInterfaceSizeClass: UserInterfaceSizeClass) -> OUDSTokensSemantic.SizeSemanticToken {
            switch self {
            // Heading
            case .sizeIconWithHeadingXlargeSizeSm:
                theme.sizes.sizeIconWithHeadingXlargeSizeSm.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingXlargeSizeMd:
                theme.sizes.sizeIconWithHeadingXlargeSizeMd.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingXlargeSizeLg:
                theme.sizes.sizeIconWithHeadingXlargeSizeLg.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingLargeSizeSm:
                theme.sizes.sizeIconWithHeadingLargeSizeSm.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingLargeSizeMd:
                theme.sizes.sizeIconWithHeadingLargeSizeMd.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingLargeSizeLg:
                theme.sizes.sizeIconWithHeadingLargeSizeLg.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingMediumSizeSm:
                theme.sizes.sizeIconWithHeadingMediumSizeSm.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingMediumSizeMd:
                theme.sizes.sizeIconWithHeadingMediumSizeMd.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingMediumSizeLg:
                theme.sizes.sizeIconWithHeadingMediumSizeLg.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingSmallSizeSm:
                theme.sizes.sizeIconWithHeadingSmallSizeSm.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingSmallSizeMd:
                theme.sizes.sizeIconWithHeadingSmallSizeMd.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithHeadingSmallSizeLg:
                theme.sizes.sizeIconWithHeadingSmallSizeLg.dimension(for: userInterfaceSizeClass)
            // Body
            case .sizeIconWithBodyLargeSizeSm:
                theme.sizes.sizeIconWithBodyLargeSizeSm.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodyLargeSizeMd:
                theme.sizes.sizeIconWithBodyLargeSizeMd.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodyLargeSizeLg:
                theme.sizes.sizeIconWithBodyLargeSizeLg.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodyMediumSizeSm:
                theme.sizes.sizeIconWithBodyMediumSizeSm.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodyMediumSizeMd:
                theme.sizes.sizeIconWithBodyMediumSizeMd.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodyMediumSizeLg:
                theme.sizes.sizeIconWithBodyMediumSizeLg.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodySmallSizeSm:
                theme.sizes.sizeIconWithBodySmallSizeSm.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodySmallSizeMd:
                theme.sizes.sizeIconWithBodySmallSizeMd.dimension(for: userInterfaceSizeClass)
            case .sizeIconWithBodySmallSizeLg:
                theme.sizes.sizeIconWithBodySmallSizeLg.dimension(for: userInterfaceSizeClass)
            // With Label
            case .sizeIconWithLabelXlargeSizeSm:
                theme.sizes.sizeIconWithLabelLargeSizeSm
            case .sizeIconWithLabelXlargeSizeMd:
                theme.sizes.sizeIconWithLabelLargeSizeMd
            case .sizeIconWithLabelXlargeSizeLg:
                theme.sizes.sizeIconWithLabelLargeSizeLg
            case .sizeIconWithLabelLargeSizeXs:
                theme.sizes.sizeIconWithLabelLargeSizeXs
            case .sizeIconWithLabelLargeSizeSm:
                theme.sizes.sizeIconWithLabelLargeSizeSm
            case .sizeIconWithLabelLargeSizeMd:
                theme.sizes.sizeIconWithLabelLargeSizeMd
            case .sizeIconWithLabelLargeSizeLg:
                theme.sizes.sizeIconWithLabelLargeSizeLg
            case .sizeIconWithLabelLargeSizeXl:
                theme.sizes.sizeIconWithLabelLargeSizeXl
            case .sizeIconWithLabelMediumSizeXs:
                theme.sizes.sizeIconWithLabelMediumSizeXs
            case .sizeIconWithLabelMediumSizeSm:
                theme.sizes.sizeIconWithLabelMediumSizeSm
            case .sizeIconWithLabelMediumSizeMd:
                theme.sizes.sizeIconWithLabelMediumSizeMd
            case .sizeIconWithLabelMediumSizeLg:
                theme.sizes.sizeIconWithLabelMediumSizeLg
            case .sizeIconWithLabelSmallSizeXs:
                theme.sizes.sizeIconWithLabelSmallSizeXs
            case .sizeIconWithLabelSmallSizeSm:
                theme.sizes.sizeIconWithLabelSmallSizeSm
            case .sizeIconWithLabelSmallSizeMd:
                theme.sizes.sizeIconWithLabelSmallSizeMd
            case .sizeIconWithLabelSmallSizeLg:
                theme.sizes.sizeIconWithLabelSmallSizeLg
            }
        }

        // swiftlint:enable function_body_length

        /// Provides the `namedFont associated to the icon size
        var namedFont: NamedFont {
            switch self {
            case .sizeIconWithHeadingXlargeSizeSm,
                 .sizeIconWithHeadingXlargeSizeMd,
                 .sizeIconWithHeadingXlargeSizeLg:
                .headingXLarge
            case .sizeIconWithHeadingLargeSizeSm,
                 .sizeIconWithHeadingLargeSizeMd,
                 .sizeIconWithHeadingLargeSizeLg:
                .headingLarge
            case .sizeIconWithHeadingMediumSizeSm,
                 .sizeIconWithHeadingMediumSizeMd,
                 .sizeIconWithHeadingMediumSizeLg:
                .headingMedium
            case .sizeIconWithHeadingSmallSizeSm,
                 .sizeIconWithHeadingSmallSizeMd,
                 .sizeIconWithHeadingSmallSizeLg:
                .headingSmall
            case .sizeIconWithBodyLargeSizeSm,
                 .sizeIconWithBodyLargeSizeMd,
                 .sizeIconWithBodyLargeSizeLg:
                .bodyDefaultLarge
            case .sizeIconWithBodyMediumSizeSm,
                 .sizeIconWithBodyMediumSizeMd,
                 .sizeIconWithBodyMediumSizeLg:
                .bodyDefaultMedium
            case .sizeIconWithBodySmallSizeSm,
                 .sizeIconWithBodySmallSizeMd,
                 .sizeIconWithBodySmallSizeLg:
                .bodyDefaultSmall
            case .sizeIconWithLabelXlargeSizeSm,
                 .sizeIconWithLabelXlargeSizeMd,
                 .sizeIconWithLabelXlargeSizeLg:
                .labelDefaultXLarge
            case .sizeIconWithLabelLargeSizeXs,
                 .sizeIconWithLabelLargeSizeSm,
                 .sizeIconWithLabelLargeSizeMd,
                 .sizeIconWithLabelLargeSizeLg,
                 .sizeIconWithLabelLargeSizeXl:
                .labelDefaultLarge
            case .sizeIconWithLabelMediumSizeXs,
                 .sizeIconWithLabelMediumSizeSm,
                 .sizeIconWithLabelMediumSizeMd,
                 .sizeIconWithLabelMediumSizeLg:
                .labelDefaultMedium
            case .sizeIconWithLabelSmallSizeXs,
                 .sizeIconWithLabelSmallSizeSm,
                 .sizeIconWithLabelSmallSizeMd,
                 .sizeIconWithLabelSmallSizeLg:
                .labelDefaultSmall
            }
        }

        var sizeDescription: String {
            switch self {
            case .sizeIconWithHeadingXlargeSizeSm,
                 .sizeIconWithHeadingLargeSizeSm,
                 .sizeIconWithHeadingMediumSizeSm,
                 .sizeIconWithHeadingSmallSizeSm,
                 .sizeIconWithBodyLargeSizeSm,
                 .sizeIconWithBodyMediumSizeSm,
                 .sizeIconWithBodySmallSizeSm,
                 .sizeIconWithLabelXlargeSizeSm,
                 .sizeIconWithLabelLargeSizeSm,
                 .sizeIconWithLabelMediumSizeSm,
                 .sizeIconWithLabelSmallSizeSm:
                "Size Small"
            case .sizeIconWithHeadingXlargeSizeMd,
                 .sizeIconWithHeadingLargeSizeMd,
                 .sizeIconWithHeadingMediumSizeMd,
                 .sizeIconWithHeadingSmallSizeMd,
                 .sizeIconWithBodyLargeSizeMd,
                 .sizeIconWithBodyMediumSizeMd,
                 .sizeIconWithBodySmallSizeMd,
                 .sizeIconWithLabelXlargeSizeMd,
                 .sizeIconWithLabelLargeSizeMd,
                 .sizeIconWithLabelMediumSizeMd,
                 .sizeIconWithLabelSmallSizeMd:
                "Size Medium"
            case .sizeIconWithHeadingXlargeSizeLg,
                 .sizeIconWithHeadingLargeSizeLg,
                 .sizeIconWithHeadingMediumSizeLg,
                 .sizeIconWithHeadingSmallSizeLg,
                 .sizeIconWithBodyLargeSizeLg,
                 .sizeIconWithBodyMediumSizeLg,
                 .sizeIconWithBodySmallSizeLg,
                 .sizeIconWithLabelXlargeSizeLg,
                 .sizeIconWithLabelLargeSizeLg,
                 .sizeIconWithLabelMediumSizeLg,
                 .sizeIconWithLabelSmallSizeLg:
                "Size Large"
            case .sizeIconWithLabelSmallSizeXs,
                 .sizeIconWithLabelMediumSizeXs,
                 .sizeIconWithLabelLargeSizeXs:
                "Extra Small"
            case .sizeIconWithLabelLargeSizeXl:
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
