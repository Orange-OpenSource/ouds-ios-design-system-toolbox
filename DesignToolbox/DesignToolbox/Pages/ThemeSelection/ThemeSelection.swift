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
import SwiftUI

// MARK: - Extensions of OUDSTheme

extension OUDSTheme: @retroactive Equatable {

    // MARK: Equtabable

    public static func == (lhs: OUDSTheme, rhs: OUDSTheme) -> Bool {
        lhs.name == rhs.name
    }
}

/// Extension of the `OUDSTheme` to add both `Identifiable` and `Hashable`.
/// An `OUDSTheme` must be `Identifiable` to be enumerated like in `ForEach`(e.g. used to build the list of elements in picker).
/// It must be `Hashable` because it is used in a picker than need `Hashable` element.
extension OUDSTheme: @retroactive Identifiable, @retroactive Hashable {

    var name: String {
        if self is OrangeTheme {
            return "Orange"
        }
        if self is OrangeBusinessToolsTheme {
            return "Orange Business Tools"
        }
        if self is SoshTheme {
            return "Sosh"
        }
        return String(describing: Self.self)
    }

    // MARK: Identifiable

    public var id: String {
        name
    }

    // MARK: Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

// MARK: - Theme Provider

/// Theme provider that proposes all supported themes for the demo application.
/// It also stores the current theme, selected by user.
@MainActor final class ThemeProvider: ObservableObject {

    let themes: [OUDSTheme]
    var hotSwitchWarning: HotSwitchWarning

    @UserDefaultsWrapper(key: "com.orange.ouds.demoapp.themeName", defaultValue: "Orange")
    private static var currentThemeName

    @Published var currentTheme: OUDSTheme {
        didSet {
            ThemeProvider.currentThemeName = currentTheme.name
            if currentTheme != oldValue {
                hotSwitchWarning.showAlert = true
            }
        }
    }

    init() {
        let orangeTheme = OrangeTheme()
        let soshTheme = SoshTheme()
        let defaultTheme = orangeTheme
        themes = [orangeTheme, soshTheme]

        if let theme = themes.first(where: { $0.name == ThemeProvider.currentThemeName }) {
            currentTheme = theme
        } else {
            currentTheme = defaultTheme
        }

        hotSwitchWarning = HotSwitchWarning()
    }

    deinit {}
}

// MARK: - Theme Selection Button

extension View {

    /// To add a `ThemeSelectionButton` in the toolbar
    func navigationbarMenuForThemeSelection() -> some View {
        toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                ThemeSelectionButton()
            }
        }
    }
}

/// Button to make the user change the current theme.
struct ThemeSelectionButton: View {

    @EnvironmentObject private var themeProvider: ThemeProvider

    var body: some View {
        Menu {
            Picker(selection: $themeProvider.currentTheme, label: EmptyView()) {
                ForEach(themeProvider.themes, id: \.id) { theme in
                    Text(theme.name).tag(theme)
                }
            }
            .pickerStyle(.automatic)
        } label: {
            Image(systemName: "paintpalette")
                .accessibilityLabel("app_topBar_theme_button_a11y")
                .accessibilityHint("app_topBar_theme_button_hint_a11y")
        }
        .oudsForegroundColor(themeProvider.currentTheme.colors.colorContentBrandPrimary)
        .modifier(HotSwitchWarningModifier(hotSwitchWarningIndicator: themeProvider.hotSwitchWarning))
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
