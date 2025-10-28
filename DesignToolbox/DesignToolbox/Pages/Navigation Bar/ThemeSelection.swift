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
import OUDSThemesOrange
import OUDSThemesOrangeBusinessTools
import OUDSThemesSosh
import OUDSThemesWireframe
import SwiftUI

// MARK: - Extensions of OUDSTheme

extension OUDSTheme: @retroactive Equatable {

    // MARK: Equtabable

    public static func == (lhs: OUDSTheme, rhs: OUDSTheme) -> Bool {
        lhs.id == rhs.id
    }
}

/// Extension of the `OUDSTheme` to add both `Identifiable` and `Hashable`.
/// An `OUDSTheme` must be `Identifiable` to be enumerated like in `ForEach`(e.g. used to build the list of elements in picker).
/// It must be `Hashable` because it is used in a picker than need `Hashable` element.
extension OUDSTheme: @retroactive Identifiable, @retroactive Hashable {

    /// The text displayed in submenus of the theme selector
    var description: String {
        if self is SoshTheme {
            return "Sosh"
        }
        if self is WireframeTheme {
            return "Wireframe"
        }
        if tuning == Tuning.OrangeFrance {
            return "Orange France"
        }
        if tuning == Tuning.MaxIt {
            return "Max it"
        }
        if tuning == Tuning.OrangeBusiness {
            return "Orange Business"
        }
        return "Default"
    }

    // MARK: Identifiable

    /// The unique identifier to store the selected theme
    public var id: String {
        var constructedId = String(describing: Self.self)
        if self is OrangeTheme {
            constructedId = "Orange"
        }
        if self is OrangeBusinessToolsTheme {
            constructedId = "Orange Business Tools"
        }
        if self is SoshTheme {
            constructedId = "Sosh"
        }
        if self is WireframeTheme {
            constructedId = "Wireframe"
        }
        if tuning == Tuning.OrangeFrance {
            constructedId += constructedId + " (Orange France)"
        }
        if tuning == Tuning.MaxIt {
            constructedId += constructedId + " (Max It)"
        }
        if tuning == Tuning.OrangeBusiness {
            constructedId += constructedId + " (Orange Business)"
        }
        return constructedId
    }

    // MARK: Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Theme Provider

/// Theme provider that proposes all supported themes for the demo application.
/// It also stores the current theme, selected by user.
@MainActor final class ThemeProvider: ObservableObject {

    let orangeThemes: [OUDSTheme]
    let orangeBusinessToolsThemes: [OUDSTheme]
    let otherThemes: [OUDSTheme]

    let allThemes: [OUDSTheme]

    var hotSwitchWarning: HotSwitchWarning

    @UserDefaultsWrapper(key: "com.orange.ouds.demoapp.theme", defaultValue: "Orange")
    private static var currentTheme

    @Published var currentTheme: OUDSTheme {
        didSet {
            ThemeProvider.currentTheme = currentTheme.id
            if currentTheme != oldValue {
                hotSwitchWarning.showAlert = true
            }
        }
    }

    init() {

        // Init all themes

        let orangeFranceOrangeTheme = OrangeTheme(family: Self.localizedHelveticaFont(), tuning: Tuning.OrangeFrance)
        let orangeBusinessOrangeTheme = OrangeTheme(family: Self.localizedHelveticaFont(), tuning: Tuning.OrangeBusiness)
        let maxItOrangeTheme = OrangeTheme(family: Self.localizedHelveticaFont(), tuning: Tuning.MaxIt)

        let orangeFranceOrangeBusinessToolsTheme = OrangeBusinessToolsTheme(family: Self.localizedHelveticaFont(), tuning: Tuning.OrangeFrance)
        let orangeBusinessOrangeBusinessToolsTheme = OrangeBusinessToolsTheme(family: Self.localizedHelveticaFont(), tuning: Tuning.OrangeBusiness)
        let maxItOrangeBusinessToolsTheme = OrangeBusinessToolsTheme(family: Self.localizedHelveticaFont(), tuning: Tuning.MaxIt)

        let soshTheme = SoshTheme()
        let wireframeTheme = WireframeTheme()

        let defaultTheme = orangeFranceOrangeTheme

        // Fill arrays for menus

        orangeThemes = [orangeFranceOrangeTheme, orangeBusinessOrangeTheme, maxItOrangeTheme]
        orangeBusinessToolsThemes = [orangeFranceOrangeBusinessToolsTheme, orangeBusinessOrangeBusinessToolsTheme, maxItOrangeBusinessToolsTheme]
        otherThemes = [soshTheme, wireframeTheme]
        allThemes = orangeThemes + orangeBusinessToolsThemes + otherThemes

        if let theme = allThemes.first(where: { $0.id == ThemeProvider.currentTheme }) {
            currentTheme = theme
        } else {
            currentTheme = defaultTheme
        }

        hotSwitchWarning = HotSwitchWarning()
        #if USE_INTERNAL_FONTS
        registerInternalFonts()
        #endif
    }

    deinit {}

    #if USE_INTERNAL_FONTS
    private static var fontsAlreadyRegistered = false

    /// Fonts are defined in Resources/Fonts in TTF files.
    /// Needed for Helvetica Neue Arabic
    private func registerInternalFonts() {
        if !Self.fontsAlreadyRegistered {
            let fonts = Bundle.main.urls(forResourcesWithExtension: "ttf", subdirectory: nil)
            fonts?.forEach { CTFontManagerRegisterFontsForURL($0 as CFURL, .process, nil) }
            Self.fontsAlreadyRegistered = true
        }
    }

    private static func localizedHelveticaFont() -> String {
        guard let preferredLanguage = Locale.preferredLanguages.first else {
            return "Helvetica Neue"
        }
        if preferredLanguage.hasPrefix("ar") || Locale.current.languageCode == "ar" {
            return "Helvetica Neue Arabic"
        } else {
            return "Helvetica Neue"
        }
    }
    #else
    private static func localizedHelveticaFont() -> String {
        "Helvetica Neue"
    }
    #endif
}

// MARK: - Theme Selection Button

/// Button to make the user change the current theme.
struct ThemeSelectionButton: View {

    @EnvironmentObject private var themeProvider: ThemeProvider

    var body: some View {
        Menu {
            // Orange theme and tunings
            Menu("Orange") {
                Picker(selection: $themeProvider.currentTheme, label: EmptyView()) {
                    ForEach(themeProvider.orangeThemes, id: \.id) { theme in
                        Text(theme.description).tag(theme)
                    }
                }
                .pickerStyle(.automatic)
            }

            // Orange Business Tools theme and tunings
            Menu("Orange Business Tools") {
                Picker(selection: $themeProvider.currentTheme, label: EmptyView()) {
                    ForEach(themeProvider.orangeBusinessToolsThemes, id: \.id) { theme in
                        Text(theme.description).tag(theme)
                    }
                }
                .pickerStyle(.automatic)
            }

            // Sosh and Wireframe themes (which do not have tunings)
            Picker(selection: $themeProvider.currentTheme, label: EmptyView()) {
                ForEach(themeProvider.otherThemes, id: \.id) { theme in
                    Text(theme.description).tag(theme)
                    Divider()
                }
            }
            .pickerStyle(.automatic)
        } label: {
            Image(decorative: "ic_theme")
                .scaledToFit()
        }
        .oudsForegroundColor(themeProvider.currentTheme.colors.contentBrandPrimary)
        .modifier(HotSwitchWarningModifier(hotSwitchWarningIndicator: themeProvider.hotSwitchWarning))
        .accessibilityLabel("app_topBar_theme_button_a11y")
        .accessibilityHint("app_topBar_theme_button_hint_a11y")
    }
}

// MARK: - Hot Switch

final class HotSwitchWarning: ObservableObject {
    @Published var showAlert: Bool = false

    deinit {}
}

/// `ViewModifier` displaying an alert (if set in app settings) notifying the user if it wants to restart the app
/// if the theme changed. If so, kills the app. If not, let iy as is.
/// Thus if the app is killed or if the user restarts it, we won't be in unstable cases like the one explained in issue 850:
/// a situation where an unexisting token is used but with the bad theme.
///
/// See https://github.com/Orange-OpenSource/ouds-ios/issues/850
struct HotSwitchWarningModifier: ViewModifier {

    @ObservedObject var hotSwitchWarningIndicator: HotSwitchWarning

    @UserDefaultsWrapper(key: "com.orange.ouds.demoapp.askToRestartIfThemeChanged", defaultValue: false) // Defined in Settings.bundle
    private var askToRestart: Bool

    @ViewBuilder
    func body(content: Content) -> some View {
        if askToRestart {
            content
                .alert(isPresented: $hotSwitchWarningIndicator.showAlert) {
                    Alert(
                        title: Text("app_settings_themeSwitch_title"),
                        message: Text("app_settings_themeSwitch_description"),
                        primaryButton: .destructive(Text("app_settings_themeSwitch_restart")) {
                            exit(0) // ( ˶°ㅁ°) !! BOOM
                        },
                        secondaryButton: .cancel(Text("app_settings_themeSwitch_cancel")))
                }
        } else {
            content
        }
    }
}
