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

// MARK: - Token Illustration

// swiftlint:disable function_body_length

// Used in Typography screen and SizeIconWithLabel
extension View {

    @ViewBuilder
    func illustration(for namedFont: NamedFont, in theme: OUDSTheme) -> some View {
        switch namedFont {
        case .displayLarge:
            Text(namedFont.rawValue.camelCase).displayLarge(theme)
        case .displayMedium:
            Text(namedFont.rawValue.camelCase).displayMedium(theme)
        case .displaySmall:
            Text(namedFont.rawValue.camelCase).displaySmall(theme)
        case .headingXLarge:
            Text(namedFont.rawValue.camelCase).headingXLarge(theme)
        case .headingLarge:
            Text(namedFont.rawValue.camelCase).headingLarge(theme)
        case .headingMedium:
            Text(namedFont.rawValue.camelCase).headingMedium(theme)
        case .headingSmall:
            Text(namedFont.rawValue.camelCase).headingSmall(theme)
        case .bodyDefaultLarge:
            Text(namedFont.rawValue.camelCase).bodyDefaultLarge(theme)
        case .bodyDefaultMedium:
            Text(namedFont.rawValue.camelCase).bodyDefaultMedium(theme)
        case .bodyDefaultSmall:
            Text(namedFont.rawValue.camelCase).bodyDefaultSmall(theme)
        case .bodyModerateLarge:
            Text(namedFont.rawValue.camelCase).bodyModerateLarge(theme)
        case .bodyModerateMedium:
            Text(namedFont.rawValue.camelCase).bodyModerateMedium(theme)
        case .bodyModerateSmall:
            Text(namedFont.rawValue.camelCase).bodyModerateSmall(theme)
        case .bodyStrongLarge:
            Text(namedFont.rawValue.camelCase).bodyStrongLarge(theme)
        case .bodyStrongMedium:
            Text(namedFont.rawValue.camelCase).bodyStrongMedium(theme)
        case .bodyStrongSmall:
            Text(namedFont.rawValue.camelCase).bodyStrongSmall(theme)
        case .labelDefaultXLarge:
            Text(namedFont.rawValue.camelCase).labelDefaultXLarge(theme)
        case .labelDefaultLarge:
            Text(namedFont.rawValue.camelCase).labelDefaultLarge(theme)
        case .labelDefaultMedium:
            Text(namedFont.rawValue.camelCase).labelDefaultMedium(theme)
        case .labelDefaultSmall:
            Text(namedFont.rawValue.camelCase).labelDefaultSmall(theme)
        case .labelModerateXLarge:
            Text(namedFont.rawValue.camelCase).labelModerateXLarge(theme)
        case .labelModerateLarge:
            Text(namedFont.rawValue.camelCase).labelModerateLarge(theme)
        case .labelModerateMedium:
            Text(namedFont.rawValue.camelCase).labelModerateMedium(theme)
        case .labelModerateSmall:
            Text(namedFont.rawValue.camelCase).labelModerateSmall(theme)
        case .labelStrongXLarge:
            Text(namedFont.rawValue.camelCase).labelStrongXLarge(theme)
        case .labelStrongLarge:
            Text(namedFont.rawValue.camelCase).labelStrongLarge(theme)
        case .labelStrongMedium:
            Text(namedFont.rawValue.camelCase).labelStrongMedium(theme)
        case .labelStrongSmall:
            Text(namedFont.rawValue.camelCase).labelStrongSmall(theme)
        case .codeSmall:
            Text(namedFont.rawValue.camelCase).codeMedium(theme)
        case .codeMedium:
            Text(namedFont.rawValue.camelCase).codeMedium(theme)
        }
    }
}

// swiftlint:enable function_body_length
