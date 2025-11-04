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

// MARK: - Opacity Token Page

struct OpacityTokenPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            Section {
                DesignToolboxCode(code: "theme.opacities.invisible", titleText: "app_tokens_common_viewCodeExample_label")
            }

            Spacer().frame(height: theme.spaces.fixedMedium)

            ForEach(NamedOpacity.allCases, id: \.rawValue) { opacityName in
                IllustrationOpacity(opacityName: opacityName)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, theme.spaces.fixedMedium)
    }

    struct IllustrationOpacity: View {
        @Environment(\.theme) private var theme
        @Environment(\.colorScheme) private var colorScheme

        let opacityName: NamedOpacity

        var body: some View {
            let token = opacityName.token(from: theme)
            let name = opacityName.rawValue
            let value = String(format: "%.2f", token)

            DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
                ZStack {
                    Image(decorative: "ic_union")
                        .resizable()
                        .renderingMode(.template)
                        .oudsForegroundColor(theme.colors.contentStatusInfo)
                        .frame(width: 48, height: 48)
                        .accessibilityHidden(true)

                    Rectangle()
                        .fill(theme.colors.overlayModal.color(for: colorScheme))
                        .opacity(token)
                        .frame(width: 48, height: 48)
                        .oudsBorder(style: theme.borders.styleDefault,
                                    width: theme.borders.widthThin,
                                    radius: theme.borders.radiusNone,
                                    color: theme.colors.borderDefault)
                        .padding(.top, 24)
                        .padding(.leading, 24)
                }
                .frame(width: 64, height: 64, alignment: .leading)
            }
        }
    }
}

// MARK: - Named Opacity

enum NamedOpacity: String, CaseIterable {
    case invisible
    case weakest
    case weaker
    case weak
    case medium
    case strong
    case opaque
    case disabled

    func token(from theme: OUDSTheme) -> OpacitySemanticToken {
        switch self {
        case .invisible:
            theme.opacities.invisible
        case .weakest:
            theme.opacities.weakest
        case .weaker:
            theme.opacities.weaker
        case .weak:
            theme.opacities.weak
        case .medium:
            theme.opacities.medium
        case .strong:
            theme.opacities.strong
        case .opaque:
            theme.opacities.opaque
        case .disabled:
            theme.opacities.disabled
        }
    }
}
