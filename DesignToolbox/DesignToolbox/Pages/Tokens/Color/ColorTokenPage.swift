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

struct ColorTokenPage: View {

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        Group {
            Section {
                DesignToolboxCode(code: "theme.colors.bgPrimary.color(for: colorScheme)", titleText: "app_tokens_common_viewCodeExample_label")
            }
            Section { illustrationForAction() } header: { header("Action") }
            Section { illustrationForAlways() } header: { header("Always") }
            Section { illustrationForBackground() } header: { header("Background") }
            Section { illustrationForBorder() } header: { header("Border") }
            if theme.charts != nil { // Some themes like Sosh do not have color charts
                Section { illustrationForChart() } header: { header("Chart") }
            }
            Section { illustrationForContent() } header: { header("Content") }
            Section { illustrationForOpacity() } header: { header("Opacity") }
            Section { illustrationForOverlay() } header: { header("Overlay") }
            Section { illustrationForRepository() } header: { header("Repository") }
            Section { illustrationForSurface() } header: { header("Surface") }
        }
        .padding(.horizontal, theme.spaces.fixedMedium)
    }

    // MARK: Private helpers

    private func header(_ text: String) -> some View {
        Text(text).designToolboxSectionHeaderStyle()
    }

    private func illustrationForBackground() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Background.allCases, id: \.rawValue) { namedColorToken in
                Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
            }
        }
    }

    private func illustrationForAction() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Action.allCases, id: \.rawValue) { namedColorToken in
                Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
            }
        }
    }

    private func illustrationForAlways() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Always.allCases, id: \.rawValue) { namedColorToken in
                Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
            }
        }
    }

    private func illustrationForChart() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Chart.allCases, id: \.rawValue) { namedColorToken in
                Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
            }
        }
    }

    private func illustrationForBorder() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Border.allCases, id: \.rawValue) { namedColorToken in
                Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
            }
        }
    }

    private func illustrationForContent() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Content.allCases, id: \.rawValue) { namedColorToken in
                Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
            }
        }
    }

    private func illustrationForOverlay() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Overlay.allCases, id: \.rawValue) { namedColorToken in
                Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
            }
        }
    }

    private func illustrationForSurface() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Surface.allCases, id: \.rawValue) { namedColorToken in
                Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
            }
        }
    }

    private func illustrationForOpacity() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Opacity.allCases, id: \.rawValue) { namedColorToken in
                Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
            }
        }
    }

    private func illustrationForRepository() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Repository.allCases, id: \.rawValue) { namedColorToken in
                Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
            }
        }
    }

    struct Illustration: View {

        // MARK: Properties

        private let lightValue: ColorSemanticToken?
        private let darkValue: ColorSemanticToken?
        private let name: String

        private static let colorIllustrationDimension: CGFloat = 64

        @Environment(\.theme) private var theme
        @Environment(\.colorScheme) private var colorScheme

        // MARK: Initializers

        init(token: ColorSemanticToken, name: String) {
            self.name = name

            if token.isForbiddenValueColor() {
                lightValue = nil
                darkValue = nil
            } else {
                lightValue = token
                darkValue = token
            }
        }

        init(token: MultipleColorSemanticTokens, name: String) {
            self.name = name

            if token.hasForbiddenColorValue() {
                lightValue = nil
                darkValue = nil
            } else {
                lightValue = token.light
                darkValue = token.dark
            }
        }

<<<<<<< HEAD
        // MARK: Body

        var body: some View {
            let colorRawToken = colorScheme == .dark ? darkValue : lightValue
            let value: String = colorRawToken ?? "app_tokens_color_unspecified_label".localized()
            DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
                Group {
                    if let colorRawToken {
                        Rectangle().fill(colorRawToken.color)
                    } else {
                        Canvas { ctx, _ in
                            var path = Path()
                            // `move` without drawing
                            path.move(to: CGPoint(x: 0, y: Self.colorIllustrationDimension))
                            // `draw` a line
                            path.addLine(to: CGPoint(x: Self.colorIllustrationDimension, y: 0))
                            ctx.stroke(path, with: .color(theme.colors.contentDisabled.color(for: colorScheme)), lineWidth: 2)
                        }
                    }
                }
                .frame(width: Self.colorIllustrationDimension, height: Self.colorIllustrationDimension)
                .oudsBorder(
                    style: theme.borders.styleDefault,
                    width: theme.borders.widthThin,
                    radius: theme.borders.radiusNone,
                    color: theme.colors.borderDefault)
=======
        // swiftlint:disable force_unwrapping
        var body: some View {
            let colorRawToken = colorScheme == .dark ? darkValue : lightValue
            DesignToolboxTokenIllustration(tokenName: name, tokenValue: colorRawToken) {
                Rectangle()
                    .fill(Color(hexadecimalCode: colorRawToken)!) // If color cannot be managed, issue with tokenator or tokens
                    .frame(width: 64, height: 64)
                    .oudsBorder(
                        style: theme.borders.styleDefault,
                        width: theme.borders.widthThin,
                        radius: theme.borders.radiusNone,
                        color: theme.colors.borderDefault)
>>>>>>> e026910c0 (test: update snapshots)
            }
        }
        // swiftlint:enable force_unwrapping
    }
}
