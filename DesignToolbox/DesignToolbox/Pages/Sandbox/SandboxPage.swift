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

#if DEBUG
import OUDSSwiftUI
import SwiftUI

/// DEBUG-only sandbox page displayed as the first tab of the tab bar when the
/// user has enabled the sandbox from the About page.
///
/// - When ``kSandboxContainsThings`` is `false`, a placeholder is displayed
///   (icon + title + description) prompting the maintainer to add their
///   experimentations here.
/// - When ``kSandboxContainsThings`` is `true`, the sandbox loads
///   ``SandboxTestView`` which is the actual surface to pimp with debug
///   helpers, experiments, and prototypes.
struct SandboxPage: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - Body

    var body: some View {
        #if os(iOS)
        NavigationView {
            content
                .background(theme.colors.bgPrimary)
                .navigationBarTitleDisplayMode(.inline)
                .accentColor(theme.bar.colorAccent)
                .oudsScreenTitle("app_sandbox_navigation_title")
                .navigationBarMenus(title: "app_sandbox_navigation_title")
        }
        .navigationViewStyle(.stack)
        #elseif os(tvOS)
        // tvOS has no navigation bar: render the theme / color-scheme controls
        // in the same focusable header used by the About page for consistency.
        NavigationStack {
            VStack(spacing: 0) {
                TVOSTopControlsBar()
                content
                    .accentColor(theme.bar.colorAccent)
                    .oudsScreenTitle("app_sandbox_navigation_title")
            }
            .background(theme.colors.bgPrimary)
        }
        #else
        NavigationView {
            content
                .background(theme.colors.bgPrimary)
                .accentColor(theme.bar.colorAccent)
                .oudsScreenTitle("app_sandbox_navigation_title")
                .navigationBarMenus(title: "app_sandbox_navigation_title")
        }
        .navigationViewStyle(.automatic)
        #endif
    }

    // MARK: - Views

    @ViewBuilder
    private var content: some View {
        if kSandboxContainsThings {
            SandboxTestView()
        } else {
            placeholderView
        }
    }

    /// Placeholder shown when the sandbox has no experimentation attached yet.
    private var placeholderView: some View {
        VStack(spacing: theme.spaces.fixedMedium) {
            Spacer()
            Image(systemName: "hammer")
                .font(.system(size: 64, weight: .light))
                .foregroundStyle(theme.colors.contentDefault)
                .accessibilityHidden(true)
            OUDSHeading("app_sandbox_placeholder_title", size: .medium)
                .foregroundStyle(theme.colors.contentDefault)
                .multilineTextAlignment(.center)
            OUDSBody("app_sandbox_placeholder_description", size: .medium, weight: .default)
                .foregroundStyle(theme.colors.contentDefault)
                .multilineTextAlignment(.center)
                .padding(.horizontal, theme.spaces.fixedMedium)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
#endif
