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

import SwiftUI

// MARK: - Color Scheme Mode

enum ColorSchemeMode: String, CustomStringConvertible {
    case light
    case dark
    case auto

    var next: ColorSchemeMode {
        switch self {
        case .light:
            .dark
        case .dark:
            .auto
        case .auto:
            .light
        }
    }

    var imageName: String {
        switch self {
        case .light:
            "ic_theme_light"
        case .dark:
            "ic_theme_dark"
        case .auto:
            "ic_theme_system"
        }
    }

    var description: String {
        switch self {
        case .light:
            "Light"
        case .dark:
            "Dark"
        case .auto:
            "Automatique"
        }
    }
}

// MARK: - Color Scheme Selection Button

struct ColorSchemeSelectionButton: View {
    @AppStorage("colorSchemeMode") private var mode = ColorSchemeMode.auto

    var body: some View {
        Button(action: {
            mode = mode.next
        }, label: {
            Image(decorative: mode.imageName)
                .scaledToFit()
        })
        .accessibilityLabel("app_topBar_mode_button_a11y")
        .accessibilityHint("app_topBar_mode_button_hint_a11y")
        .accessibilityValue(mode.description)
    }
}
