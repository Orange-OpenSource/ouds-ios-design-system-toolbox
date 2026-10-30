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

// MARK: - Color Token Page View

struct ColorTokenPage: View {

    let category: ColorTokenCategory

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        Group {
            Section {
                DesignToolboxCode(code: "theme.colors.bgPrimary.color(for: colorScheme)", titleText: "app_tokens_common_viewCodeExample_label")
            }
            if category == .ai {
                Section { illustrationForAI() } header: { header("AI") }
            }
            if category == .action {
                Section { illustrationForAction() } header: { header("Action") }
            }
            if category == .always {
                Section { illustrationForAlways() } header: { header("Always") }
            }
            if category == .background {
                Section { illustrationForBackground() } header: { header("Background") }
            }
            if category == .border {
                Section { illustrationForBorder() } header: { header("Border") }
            }
            if category == .chart, theme.colorsCharts != nil {
                Section { illustrationForChart() } header: { header("Chart") }
            }
            if category == .content {
                Section { illustrationForContent() } header: { header("Content") }
            }
            if category == .decorative, theme.colorsDecorative != nil {
                Section { illustrationForDecorative() } header: { header("Decorative") }
            }
            if category == .opacity {
                Section { illustrationForOpacity() } header: { header("Opacity") }
            }
            if category == .overlay {
                Section { illustrationForOverlay() } header: { header("Overlay") }
            }
            if category == .repository {
                Section { illustrationForRepository() } header: { header("Repository") }
            }
            if category == .surface {
                Section { illustrationForSurface() } header: { header("Surface") }
            }
        }
        .gridMargin(.horizontal)
    }

    private func header(_ text: String) -> some View {
        OUDSHeading(text: text, size: .large, hasMarker: true)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func illustrationForAI() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Ai.allCases, id: \.rawValue) { namedColorToken in
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

    private func illustrationForBackground() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Background.allCases, id: \.rawValue) { namedColorToken in
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

    private func illustrationForChart() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Chart.allCases, id: \.rawValue) { namedColorToken in
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

    private func illustrationForDecorative() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedColor.Decorative.allCases, id: \.rawValue) { namedColorToken in
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

    // MARK: Illustration

    struct Illustration: View {

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

        init(token: MultipleColorSemanticToken, name: String) {
            self.name = name

            if token.hasForbiddenColorValue() {
                lightValue = nil
                darkValue = nil
            } else {
                lightValue = token.light
                darkValue = token.dark
            }
        }

        // swiftlint:disable force_unwrapping
        var body: some View {
            let colorRawToken = colorScheme == .dark ? darkValue : lightValue
            let value: String = colorRawToken ?? "app_tokens_color_unspecified_label".localized()
            DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
                Group {
                    if let colorRawToken {
                        Rectangle().fill(Color(hexadecimalCode: colorRawToken)!)
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
                .border(
                    style: theme.borders.styleDefault,
                    width: theme.borders.widthThin,
                    radius: theme.borders.radiusNone,
                    color: theme.colors.borderDefault)
            }
        }
        // swiftlint:enable force_unwrapping
    }
}

// MARK: - Color Token Category

enum ColorTokenCategory: String, CaseIterable, Identifiable {
    case ai = "AI"
    case action = "Action"
    case always = "Always"
    case background = "Background"
    case border = "Border"
    case chart = "Chart"
    case content = "Content"
    case decorative = "Decorative"
    case opacity = "Opacity"
    case overlay = "Overlay"
    case repository = "Repository"
    case surface = "Surface"

    var id: String { rawValue }

    static func available(in theme: OUDSTheme) -> [Self] {
        allCases.filter { category in
            switch category {
            case .chart:
                theme.colorsCharts != nil
            case .decorative:
                theme.colorsDecorative != nil
            default:
                true
            }
        }
    }
}

#if os(iOS)
// MARK: - Color Token Browser Page View

@available(iOS 17, *)
struct ColorTokenBrowserPage: View {

    let illustration: AnyView

    @State private var selectedCategory: ColorTokenCategory?
    @AccessibilityFocusState private var requestFocus: Bool

    @Environment(\.theme) private var theme
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        let categories = ColorTokenCategory.available(in: theme)

        Group {
            if horizontalSizeClass == .regular {
                NavigationSplitView {
                    ColorTokenFamilyList(illustration: illustration,
                                         categories: categories,
                                         selection: $selectedCategory,
                                         focus: $requestFocus,
                                         usesSplitNavigation: true)
                        .navigationBarMenus(title: "app_tokens_color_tech".localized(),
                                            showsThemeControls: selectedCategory == nil)
                } detail: {
                    ColorTokenFamilyDetail(category: selectedCategory)
                }
                .navigationSplitViewStyle(.balanced)
                .oudsNavigationBarAppearance()
            } else {
                ColorTokenFamilyList(illustration: illustration,
                                     categories: categories,
                                     selection: $selectedCategory,
                                     focus: $requestFocus,
                                     usesSplitNavigation: false)
                    .navigationBarMenus(title: "app_tokens_color_tech".localized())
            }
        }
        .requestAccessibleFocus(_requestFocus)
        .onChange(of: categories) { _, availableCategories in
            if let selectedCategory, !availableCategories.contains(selectedCategory) {
                self.selectedCategory = nil
            }
        }
    }
}

// MARK: - Color Token Family List

@available(iOS 17, *)
private struct ColorTokenFamilyList: View {

    let illustration: AnyView
    let categories: [ColorTokenCategory]
    @Binding var selection: ColorTokenCategory?
    let focus: AccessibilityFocusState<Bool>.Binding
    let usesSplitNavigation: Bool

    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            DesignToolboxElementIntroduction(illustration: illustration,
                                             description: "app_tokens_color_description_text",
                                             focus: focus)

            ForEach(categories) { category in
                if usesSplitNavigation {
                    OUDSNavigationListItem(data: .init(label: .textual(.raw(category.rawValue), isBold: true)),
                                           indicatorType: .next)
                    {
                        selection = category
                    }
                    .oudsListItemStyle(divider: true, background: false)
                    .accessibilityAddTraits(selection == category ? .isSelected : [])
                } else {
                    OUDSNavigationLink(title: category.rawValue, hasBoldLabel: true, indicatorType: .next) {
                        ColorTokenFamilyDetail(category: category, returnsToSplitOnExpansion: true)
                            .onAppear { selection = category }
                    }
                }
            }
            .oudsListItemSize(.small)
        }
        .background(theme.colors.bgPrimary)
    }
}

// MARK: - Color Token Family Detail View

@available(iOS 17, *)
private struct ColorTokenFamilyDetail: View {

    let category: ColorTokenCategory?
    var returnsToSplitOnExpansion: Bool = false

    @Environment(\.dismiss) private var dismiss
    @Environment(\.theme) private var theme
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        let categories = ColorTokenCategory.available(in: theme)

        Group {
            if let category, categories.contains(category) {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                        ColorTokenPage(category: category)
                    }
                }
                .background(theme.colors.bgPrimary)
                .navigationBarMenus(title: category.rawValue)
            } else {
                OUDSBody("app_common_select_element", size: .large)
                    .foregroundStyle(theme.colors.contentMuted)
                    .multilineTextAlignment(.center)
                    .padding(theme.spaces.fixedMedium)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(theme.colors.bgPrimary)
            }
        }
        .onChange(of: horizontalSizeClass) { _, sizeClass in
            if returnsToSplitOnExpansion, sizeClass == .regular {
                dismiss()
            }
        }
        .onChange(of: categories) { _, availableCategories in
            if returnsToSplitOnExpansion, let category, !availableCategories.contains(category) {
                dismiss()
            }
        }
    }
}
#endif
