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

#if os(iOS)
import OUDSSwiftUI
import SwiftUI

// NOTE: Temporary hack until OUDS provide suitable init
// See https://github.com/Orange-OpenSource/ouds-ios/issues/1452

extension View {

    /// Reproduces the OUDS `TabBarViewModifier` styling for the native iOS 26  native `TabView`.
    /// Uses the same tokens and branching logic as the internal `TabBarViewModifier` in the OUDS library.
    func applyOUDSTabBarAppearance(_ colorScheme: ColorScheme, _ theme: OUDSTheme) {

        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()

        // MARK: Badge color

        let badgeColor = theme.colors.surfaceStatusNegativeEmphasized.color(for: colorScheme).uiColor
        tabBarItemAppearance.normal.badgeBackgroundColor = badgeColor
        tabBarItemAppearance.selected.badgeBackgroundColor = badgeColor
        tabBarItemAppearance.focused.badgeBackgroundColor = badgeColor

        // MARK: Background

        tabBarAppearance.configureWithTransparentBackground()
        tabBarAppearance.backgroundEffect = UIBlurEffect(style: .regular)
        tabBarAppearance.backgroundColor = theme.bar.colorBgTranslucent.color(for: colorScheme).uiColor

        // MARK: Fonts

        let fontSize: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 13 : 10
        var normalFont: UIFont, selectedFont: UIFont
        if let fontFamily = theme.fontFamily {
            let normalFontName = kApplePostScriptFontNames[orKey: PSFNMK(fontFamily, Font.Weight.regular)]
            let selectedFontName = kApplePostScriptFontNames[orKey: PSFNMK(fontFamily, Font.Weight.bold)]
            normalFont = UIFont(name: normalFontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
            selectedFont = UIFont(name: selectedFontName, size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
        } else {
            normalFont = UIFont.systemFont(ofSize: fontSize)
            selectedFont = UIFont.boldSystemFont(ofSize: fontSize)
        }

        // MARK: Unselected item

        tabBarItemAppearance.normal.titleTextAttributes = [
            .font: normalFont,
        ]

        // MARK: Selected item

        let selectedUIColor = theme.colors.actionAccent.color(for: colorScheme).uiColor
        tabBarItemAppearance.selected.iconColor = selectedUIColor
        tabBarItemAppearance.selected.titleTextAttributes = [
            .foregroundColor: selectedUIColor,
            .font: selectedFont,
        ]

        // MARK: Focused item

        let focusedColor = theme.bar.colorContentSelectedFocus.color(for: colorScheme).uiColor
        tabBarItemAppearance.focused.iconColor = focusedColor
        tabBarItemAppearance.focused.titleTextAttributes = [
            .foregroundColor: focusedColor,
            .font: selectedFont,
        ]

        // MARK: Apply to all layout variants

        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.inlineLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.compactInlineLayoutAppearance = tabBarItemAppearance

        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance

        // Force-update any live tab bars already on screen
        DispatchQueue.main.async {
            let windowScenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
            for windowScene in windowScenes {
                for window in windowScene.windows {
                    applyAppearanceRecursively(tabBarAppearance, to: window.rootViewController)
                }
            }
        }
    }

    private func applyAppearanceRecursively(_ appearance: UITabBarAppearance, to viewController: UIViewController?) {
        guard let viewController else { return }
        if let tabBarController = viewController as? UITabBarController {
            tabBarController.tabBar.standardAppearance = appearance
            tabBarController.tabBar.scrollEdgeAppearance = appearance
            tabBarController.tabBar.setNeedsLayout()
            tabBarController.tabBar.layoutIfNeeded()
        }
        for child in viewController.children {
            applyAppearanceRecursively(appearance, to: child)
        }
        if let presented = viewController.presentedViewController {
            applyAppearanceRecursively(appearance, to: presented)
        }
    }
}

#endif
