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

// swiftlint:disable type_body_length
/// Using Swift files from DesignToolbox folder, displays simply the colors tokens
struct ColorsView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        #if os(tvOS)
        tvLayout
        #else
        watchLayout
        #endif
    }

    @ViewBuilder
    private var watchLayout: some View {
        NavigationView {
            List {
                NavigationLink("Action") { WatchVerticalLayout { illustrationForAction() } }
                NavigationLink("Always") { illustrationForAlways() }
                NavigationLink("Background") { illustrationForBackground() }
                NavigationLink("Border") { illustrationForBorder() }
                if theme.charts != nil {
                    NavigationLink("Chart") { illustrationForChart() }
                }
                NavigationLink("Content") { illustrationForContent() }
                NavigationLink("Overlay") { illustrationForOverlay() }
                NavigationLink("Surface") { illustrationForSurface() }
                NavigationLink("Opacity") { illustrationForOpacity() }
                NavigationLink("Repository") { illustrationForRepository() }
            }
        }
    }

    @ViewBuilder
    private var tvLayout: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                TVGridLayout(count: 4) {
                    NavigationLink("Action") { illustrationForAction() }
                    NavigationLink("Always") { illustrationForAlways() }
                    NavigationLink("Background") { illustrationForBackground() }
                    NavigationLink("Border") { illustrationForBorder() }
                    if theme.charts != nil {
                        NavigationLink("Chart") { illustrationForChart() }
                    }
                    NavigationLink("Content") { illustrationForContent() }
                    NavigationLink("Overlay") { illustrationForOverlay() }
                    NavigationLink("Surface") { illustrationForSurface() }
                    NavigationLink("Opacity") { illustrationForOpacity() }
                    NavigationLink("Repository") { illustrationForRepository() }
                }
                .padding()
            }
            .navigationTitle("Colors")
        }
    }

    // MARK: - Helpers

    @ViewBuilder
    private func illustrationForAction() -> some View {
        TVGridLayout(count: 4) {
            ForEach(NamedColor.Action.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue).focusable()
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForAlways() -> some View {
        TVGridLayout(count: 4) {
            ForEach(NamedColor.Always.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).isForbiddenValueColor() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue).focusable()
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForBackground() -> some View {
        TVGridLayout(count: 4) {
            ForEach(NamedColor.Background.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue).focusable()
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForChart() -> some View {
        TVGridLayout(count: 4) {
            ForEach(NamedColor.Chart.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue).focusable()
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForBorder() -> some View {
        TVGridLayout(count: 4) {
            ForEach(NamedColor.Border.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue).focusable()
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForContent() -> some View {
        TVGridLayout(count: 4) {
            ForEach(NamedColor.Content.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue).focusable()
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForOverlay() -> some View {
        TVGridLayout(count: 4) {
            ForEach(NamedColor.Overlay.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue).focusable()
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForSurface() -> some View {
        TVGridLayout(count: 4) {
            ForEach(NamedColor.Surface.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue).focusable()
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForOpacity() -> some View {
        TVGridLayout(count: 4) {
            ForEach(NamedColor.Opacity.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue).focusable()
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
                        style: theme.borders.styleDefault,
                        width: theme.borders.widthThin,
                        radius: theme.borders.radiusNone,
                        color: theme.colors.borderDefault)
            }
        }
    }

    #if !os(tvOS) // Supposed to be watchOS
    @ViewBuilder
    private func illustrationForRepository() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(NamedColor.Repository.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).isForbiddenValueColor() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                        .focusable()
                }
            }
        }
    }
    #else

    // MARK: - Specific for repository colors (tvOS)

    @ViewBuilder
    private func illustrationForRepository() -> some View {
        NavigationLink("Colors") {
            ColorCategoriesView()
        }

        NavigationLink("Opacity Colors") {
            OpacityCategoriesView()
        }

        NavigationLink("Neutral Colors") {
            NeutralCategoriesView()
        }
    }

    // MARK: Colors wrappers views

    private struct ColorCategoriesView: View {

        @Environment(\.theme) private var theme

        private let colorCategories = [
            ("Accent", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Accent") && !$0.rawValue.contains("Opacity") }),
            ("Primary", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Primary") && !$0.rawValue.contains("Opacity") }),
            ("Secondary", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Secondary") }),
            ("Tertiary", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Tertiary") }),
            ("Info", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Info") && !$0.rawValue.contains("Opacity") }),
            ("Positive", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Positive") && !$0.rawValue.contains("Opacity") }),
            ("Negative", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Negative") && !$0.rawValue.contains("Opacity") }),
            ("Warning", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Warning") && !$0.rawValue.contains("Opacity") }),
        ]

        var body: some View {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), alignment: .top), count: 4), spacing: theme.spaces.paddingBlock4xlarge) {
                    ForEach(colorCategories, id: \.0) { category, colors in
                        NavigationLink(category) {
                            ColorDetailView(title: category, colors: colors)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Color Categories")
        }
    }

    private struct OpacityCategoriesView: View {

        @Environment(\.theme) private var theme

        private let opacityCategories = [
            ("Black Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityBlack") }),
            ("White Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityWhite") }),
            ("Primary Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityPrimary") }),
            ("Accent Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityAccent") }),
            ("Info Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityInfo") }),
            ("Positive Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityPositive") }),
            ("Negative Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityNegative") }),
            ("Warning Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityWarning") }),
        ]

        var body: some View {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), alignment: .top), count: 4), spacing: theme.spaces.paddingBlock4xlarge) {
                    ForEach(opacityCategories, id: \.0) { category, colors in
                        NavigationLink(category) {
                            ColorDetailView(title: category, colors: colors)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Opacity Categories")
        }
    }

    private struct NeutralCategoriesView: View {
        let neutralColors = NamedColor.Repository.allCases.filter {
            $0.rawValue.contains("NeutralEmphasized") || $0.rawValue.contains("NeutralMuted")
        }

        var body: some View {
            ColorDetailView(title: "Neutral Colors", colors: neutralColors)
        }
    }

    private struct ColorDetailView: View {

        let title: String
        let colors: [NamedColor.Repository]

        @Environment(\.theme) private var theme

        var body: some View {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), alignment: .top), count: 5), spacing: theme.spaces.paddingBlock4xlarge) {
                    ForEach(colors, id: \.self) { color in
                        if !color.token(from: theme).isForbiddenValueColor() {
                            Illustration(token: color.token(from: theme), name: color.rawValue)
                                .focusable(true)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(title)
        }
    }
    #endif
}

// swiftlint:enable type_body_length
