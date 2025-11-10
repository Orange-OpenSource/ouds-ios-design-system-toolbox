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
                    NavigationLink("Action") { TVGridLayout(count: 4) { illustrationForAction() } }
                    NavigationLink("Always") { TVGridLayout(count: 4) { illustrationForAlways() } }
                    NavigationLink("Background") { TVGridLayout(count: 4) { illustrationForBackground() } }
                    NavigationLink("Border") { TVGridLayout(count: 4) { illustrationForBorder() } }
                    if theme.charts != nil {
                        NavigationLink("Chart") { TVGridLayout(count: 4) { illustrationForChart() } }
                    }
                    NavigationLink("Content") { TVGridLayout(count: 4) { illustrationForContent() } }
                    NavigationLink("Overlay") { TVGridLayout(count: 4) { illustrationForOverlay() } }
                    NavigationLink("Surface") { TVGridLayout(count: 4) { illustrationForSurface() } }
                    NavigationLink("Opacity") { TVGridLayout(count: 4) { illustrationForOpacity() } }
                    NavigationLink("Repository") { TVGridLayout(count: 3) { illustrationForRepository() } }
                }
                .padding()
            }
            .navigationTitle("Illustrations")
        }
    }

    // MARK: - Helpers

    @ViewBuilder
    private func illustrationForAction() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(NamedColor.Action.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForAlways() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(NamedColor.Always.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).isForbiddenValueColor() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForBackground() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(NamedColor.Background.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForChart() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(NamedColor.Chart.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForBorder() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(NamedColor.Border.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForContent() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(NamedColor.Content.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForOverlay() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(NamedColor.Overlay.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForSurface() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(NamedColor.Surface.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
                    Illustration(token: namedColorToken.token(from: theme), name: namedColorToken.rawValue)
                }
            }
        }
    }

    @ViewBuilder
    private func illustrationForOpacity() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(NamedColor.Opacity.allCases, id: \.rawValue) { namedColorToken in
                if !namedColorToken.token(from: theme).hasForbiddenColorValue() {
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

    struct ColorCategoriesView: View {
        let colorCategories = [
            ("Accent", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Accent") && !$0.rawValue.contains("Opacity") }),
            ("Primary", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Primary") && !$0.rawValue.contains("Opacity") }),
            ("Secondary", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Secondary") }),
            ("Tertiary", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Tertiary") }),
            ("Info", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Info") && !$0.rawValue.contains("Opacity") }),
            ("Positive", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Positive") && !$0.rawValue.contains("Opacity") }),
            ("Negative", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Negative") && !$0.rawValue.contains("Opacity") }),
            ("Warning", NamedColor.Repository.allCases.filter { $0.rawValue.contains("Warning") && !$0.rawValue.contains("Opacity") }),
        ]

        let columns = [
            GridItem(.flexible(), spacing: 30),
            GridItem(.flexible(), spacing: 30),
            GridItem(.flexible(), spacing: 30),
            GridItem(.flexible(), spacing: 30),
        ]

        var body: some View {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: columns, spacing: 40) {
                    ForEach(colorCategories, id: \.0) { category, colors in
                        NavigationLink(category) {
                            ColorDetailView(title: category, colors: colors)
                        }
                    }
                }
                .padding(60)
            }
            .navigationTitle("Color Categories")
        }
    }

    struct OpacityCategoriesView: View {
        let opacityCategories = [
            ("Black Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityBlack") }),
            ("White Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityWhite") }),
            ("Primary Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityPrimary") }),
            ("Accent Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityAccent") }),
            ("Info Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityInfo") }),
            ("Positive Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityPositive") }),
            ("Negative Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityNegative") }),
            ("Warning Opacity", NamedColor.Repository.allCases.filter { $0.rawValue.contains("OpacityWarning") }),
        ]

        let columns = [
            GridItem(.flexible(), spacing: 30),
            GridItem(.flexible(), spacing: 30),
            GridItem(.flexible(), spacing: 30),
            GridItem(.flexible(), spacing: 30),
        ]

        var body: some View {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: columns, spacing: 40) {
                    ForEach(opacityCategories, id: \.0) { category, colors in
                        NavigationLink(category) {
                            ColorDetailView(title: category, colors: colors)
                        }
                    }
                }
                .padding(60)
            }
            .navigationTitle("Opacity Categories")
        }
    }

    struct NeutralCategoriesView: View {
        let neutralColors = NamedColor.Repository.allCases.filter {
            $0.rawValue.contains("NeutralEmphasized") || $0.rawValue.contains("NeutralMuted")
        }

        var body: some View {
            ColorDetailView(title: "Neutral Colors", colors: neutralColors)
        }
    }

    struct ColorDetailView: View {
        let title: String
        let colors: [NamedColor.Repository]
        @Environment(\.theme) private var theme

        let columns = [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20),
        ]

        var body: some View {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(colors, id: \.self) { color in
                        if !color.token(from: theme).isForbiddenValueColor() {
                            Illustration(token: color.token(from: theme), name: color.rawValue)
                                .focusable(true)
                        }
                    }
                }
                .padding(40)
            }
            .navigationTitle(title)
        }
    }
    #endif
}
