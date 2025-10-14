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
import OUDSTokensRaw
import OUDSTokensSemantic
import SwiftUI

struct ColorTokenPage: View {

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        Group {
            Section {
                DesignToolboxCode(code: "theme.colors.colorBgPrimary.color(for: colorScheme)", titleText: "app_tokens_common_viewCodeExample_label")
            }
            Section { illustrationForAction() } header: { header("Action") }
            Section { illustrationForAlways() } header: { header("Always") }
            Section { illustrationForBackground() } header: { header("Background") }
            Section { illustrationForBorder() } header: { header("Border") }
            if theme.colorCharts != nil { // Some themes like Sosh do not have color charts
                Section { illustrationForChart() } header: { header("Chart") }
            }
            Section { illustrationForContent() } header: { header("Content") }
            Section { illustrationForOpacity() } header: { header("Opacity") }
            Section { illustrationForOverlay() } header: { header("Overlay") }
            Section { illustrationForRepository() } header: { header("Repository") }
            Section { illustrationForSurface() } header: { header("Surface") }
        }
        .padding(.horizontal, theme.spaces.spaceFixedMedium)
    }

    // MARK: Private helpers

    private func header(_ text: String) -> some View {
        Text(text).designToolboxSectionHeaderStyle()
    }

    private func illustrationForBackground() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            ForEach(NamedColor.Background.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    private func illustrationForAction() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            ForEach(NamedColor.Action.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    private func illustrationForAlways() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            ForEach(NamedColor.Always.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).isForbiddenValueColor() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    private func illustrationForChart() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            ForEach(NamedColor.Chart.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    private func illustrationForBorder() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            ForEach(NamedColor.Border.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    private func illustrationForContent() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            ForEach(NamedColor.Content.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    private func illustrationForOverlay() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            ForEach(NamedColor.Overlay.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    private func illustrationForSurface() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            ForEach(NamedColor.Surface.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    private func illustrationForOpacity() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            ForEach(NamedColor.Opacity.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    private func illustrationForRepository() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedNone) {
            ForEach(NamedColor.Repository.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).isForbiddenValueColor() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    struct Illustration: View {

        private let lightValue: ColorSemanticToken
        private let darkValue: ColorSemanticToken
        private let name: String

        @Environment(\.theme) private var theme
        @Environment(\.colorScheme) private var colorScheme

        init(token: ColorSemanticToken, name: String) {
            lightValue = token
            darkValue = token
            self.name = name
        }

        init(token: MultipleColorSemanticTokens, name: String) {
            lightValue = token.light
            darkValue = token.dark
            self.name = name
        }

        var body: some View {
            let colorRawToken = colorScheme == .dark ? darkValue : lightValue
            DesignToolboxTokenIllustration(tokenName: name, tokenValue: colorRawToken) {
                Rectangle()
                    .fill(colorRawToken.color)
                    .frame(width: 64, height: 64)
                    .oudsBorder(
                        style: theme.borders.borderStyleDefault,
                        width: theme.borders.borderWidthThin,
                        radius: theme.borders.borderRadiusNone,
                        color: theme.colors.colorBorderDefault)
            }
        }
    }
}
