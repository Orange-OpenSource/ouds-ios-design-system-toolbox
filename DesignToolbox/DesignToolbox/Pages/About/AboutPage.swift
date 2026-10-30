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

// MARK: - About Page

// NOTE: Several items below are seen as unused but are used
// This is a false positive in Periphy
// See https://github.com/peripheryapp/periphery/issues/908

struct AboutPage: View {

    // MARK: Properties

    private let privacyPolicyUrl: URL
    private let legalInformationUrl: URL
    private let appSourcesUrl: URL
    private let bugReportUrl: URL
    private let designSystemUrl: URL

    #if os(iOS)
    private let appSettingsUrl: URL
    #endif

    @Environment(\.theme) private var theme
    @Environment(\.openURL) private var openURL

    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif

    // MARK: Initializer

    init() {
        guard let privacyNoticeUrl = Bundle.main.url(forResource: "about_privacy_policy", withExtension: "html") else {
            OL.fatal("Unable to find about_privacy_policy.html in resources")
        }

        guard let legalInformationUrl = Bundle.main.url(forResource: "about_legal_information", withExtension: "html") else {
            OL.fatal("Unable to find about_legal_information.html in resources")
        }

        guard let appSourcesUrl = URL(string: "https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox") else {
            OL.fatal("Unable to forge app sources URL")
        }

        guard let bugReportUrl = URL(string: "https://github.com/Orange-OpenSource/ouds-ios/issues/new/choose") else {
            OL.fatal("Unable to forge bug report URL")
        }

        guard let designSystemUrl = URL(string: "https://unified-design-system.orange.com") else {
            OL.fatal("Unable to forge design system URL")
        }

        privacyPolicyUrl = privacyNoticeUrl
        self.legalInformationUrl = legalInformationUrl
        self.appSourcesUrl = appSourcesUrl
        self.bugReportUrl = bugReportUrl
        self.designSystemUrl = designSystemUrl
        #if os(iOS)
        guard let appSettingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            OL.fatal("Unable to find app settings URL")
        }
        self.appSettingsUrl = appSettingsUrl
        #endif
    }

    // MARK: Body

    var body: some View {
        #if os(iOS)
        if #available(iOS 27.1, *) {
            NavigationStack {
                GeometryReader { geometry in
                    // If e.g. iPhone Duo unfolded in landscape mode
                    if horizontalSizeClass == .regular, geometry.size.width > geometry.size.height {
                        ArrangementView {
                            List {
                                AboutSection("app_about_versions_title", coloredText: "techniques") {
                                    AboutTechnicalDetails()
                                }
                            }
                            .scrollContentBackground(.hidden)
                            .background(theme.colors.bgPrimary)
                            .padding(.trailing, theme.spaces.fixedMedium)
                        } secondary: {
                            List {
                                AboutSection("app_about_legal_title", coloredText: "légales") {
                                    legalView
                                }
                                AboutSection("app_about_links_title", coloredText: "utiles") {
                                    linksView
                                }
                                #if DEBUG
                                AboutDebugSection()
                                #endif
                            }
                            .scrollContentBackground(.hidden)
                            .background(theme.colors.bgPrimary)
                            .padding(.leading, theme.spaces.fixedMedium)
                        }
                        .arrangementViewStyle(.split.axes(.horizontal))
                        .background(theme.colors.bgPrimary)
                        .oudsScreenTitle("app_bottomBar_about_label")
                    } else {
                        listBody
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .accentColor(theme.bar.colorAccent)
            }
            .oudsNavigationBarAppearance()
        } else { // iOS < 27.1
            NavigationView {
                listBody
                    .navigationBarTitleDisplayMode(.inline)
                    .accentColor(theme.bar.colorAccent)
            }
            .navigationViewStyle(.stack)
        }
        #elseif os(tvOS)
        // tvOS: use `NavigationStack` for consistency with the rest of the app and
        // render the theme / color-scheme controls in a visible focusable header
        // (they cannot be rendered inside a nav bar because tvOS has none).
        NavigationStack {
            VStack(spacing: 0) {
                TVOSTopControlsBar()
                listBody
                    .accentColor(theme.bar.colorAccent)
            }
            .background(theme.colors.bgPrimary)
        }
        #else
        NavigationView {
            listBody
                .accentColor(theme.bar.colorAccent)
        }
        .navigationViewStyle(.automatic)
        #endif
    }

    private var listBody: some View {
        List {
            if theme.name != SoshTheme.name {
                #if !os(tvOS) && !os(visionOS)
                Section(header: OUDSHeading("app_about_legal_title", hasMarker: true)) {
                    legalView
                }
                #endif
                Section(header: OUDSHeading("app_about_versions_title", hasMarker: true)) {
                    AboutTechnicalDetails()
                }
                Section(header: OUDSHeading("app_about_links_title", hasMarker: true)) {
                    linksView
                }
            } else {
                #if !os(tvOS) && !os(visionOS)
                Section(header: OUDSHeading("app_about_legal_title", coloredText: "légales")) {
                    legalView
                }
                #endif
                Section(header: OUDSHeading("app_about_versions_title", coloredText: "techniques")) {
                    AboutTechnicalDetails()
                }
                Section(header: OUDSHeading("app_about_links_title", coloredText: "utiles")) {
                    linksView
                }
            }
            #if DEBUG
            AboutDebugSection()
            #endif
        }
        .oudsScreenTitle("app_bottomBar_about_label")
    }

    // MARK: - Views

    #if os(iOS) || os(macOS)
    @ViewBuilder
    private var legalView: some View {
        Group {
            OUDSNavigationLink("app_about_privacyPolicy_label", style: .item(divider: false, background: false)) {
                WebView(from: privacyPolicyUrl)
                    .navigationTitle("app_about_privacyPolicy_label")
            }

            OUDSNavigationLink("app_about_legalInformation_label", style: .item(divider: false, background: false)) {
                WebView(from: legalInformationUrl)
                    .navigationTitle("app_about_legalInformation_label")
            }

            #if !os(macOS)
            OUDSNavigationLink("app_about_accessibilityStatement_label", style: .item(divider: false, background: false)) {
                AccessibilityStatementPage()
                    .navigationTitle("app_about_accessibilityStatement_label")
            }
            #endif
        }
        .oudsListItemStyle(divider: false)
        .oudsListItemSize(.small)
    }
    #endif

    @ViewBuilder
    private var linksView: some View {
        if let changelogURL = Bundle.main.changelogURL {
            link(changelogURL, label: "app_about_changelog_label", hint: "app_about_changelog_hint_a11y")
        }
        link(appSourcesUrl, label: "app_about_appSources_label", hint: "app_about_appSources_hint_a11y")
        link(bugReportUrl, label: "app_about_bugReport_label", hint: "app_about_bugReport_hint_a11y")
        link(designSystemUrl, label: "app_about_designSystem_label", hint: "app_about_designSystem_hint_a11y")

        #if os(iOS)
        Button {
            OSUtilities.open(url: appSettingsUrl)
        } label: {
            HStack {
                OUDSLabel("app_about_appSettings_label", size: .large, weight: .strong)
                Spacer()
                Image(systemName: "gear").accessibilityHidden(true)
            }
        }.accessibilityHint("app_about_appSettings_hint_a11y")
        #endif
    }

    @ViewBuilder
    private func link(_ url: URL, label: String, hint: String) -> some View {
        OUDSLink(text: label.localized(), indicator: .external, isFullWidth: true) {
            openURL.callAsFunction(url)
        }
        .accessibilityHint(hint.localized())
    }
}

// MARK: - About Section View

private struct AboutSection<Content: View>: View {

    let title: LocalizedStringKey
    let coloredText: String
    @ViewBuilder let content: () -> Content

    @Environment(\.theme) private var theme

    init(_ title: LocalizedStringKey, coloredText: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.coloredText = coloredText
        self.content = content
    }

    var body: some View {
        Section {
            content()
        } header: {
            if theme.name == SoshTheme.name {
                OUDSHeading(title, coloredText: coloredText)
            } else {
                OUDSHeading(title, hasMarker: true)
            }
        }
    }
}

// MARK: - About Technical Details View

private struct AboutTechnicalDetails: View {

    var body: some View {
        if Bundle.main.fullBuildType == "stable" {
            OpenableText("app_about_details_appVersion_stable" <- Bundle.main.marketingVersion, anchor: Bundle.main.marketingVersion, type: .githubRelease)
                .modifier(CopyableTextViewModifier(Bundle.main.marketingVersion))
        } else {
            VersionItem(title: "app_about_details_appVersion", version: Bundle.main.marketingVersion)
        }

        VersionItem(title: "app_about_details_buildNumber", version: Bundle.main.buildNumber)

        OpenableText("app_about_details_buildType" <- Bundle.main.fullBuildType, anchor: Bundle.main.fullBuildType, type: .githubBuild)
            .modifier(CopyableTextViewModifier(Bundle.main.fullBuildType))

        if let buildDetails = Bundle.main.buildDetails {
            OpenableText("app_about_details_githubBuildDetails" <- buildDetails, anchor: buildDetails, type: .githubIssue)
                .modifier(CopyableTextViewModifier(buildDetails.leadingColumnFragment))
        }

        if let sdkVersion = Bundle.main.sdkVersion, !sdkVersion.isEmpty {
            OpenableText("app_about_details_sdkVersion" <- sdkVersion, anchor: sdkVersion, type: .githubVersion)
                .modifier(CopyableTextViewModifier(sdkVersion))
        }

        LiquidGlassStateItem()

        VersionItem(title: "app_about_details_themeCoreVersion", version: OUDSVersions.themeCoreVersion)
        VersionItem(title: "app_about_details_themeOrangeCoreVersion", version: OUDSVersions.themeOrangeCoreVersion)
        VersionItem(title: "app_about_details_themeSoshCoreVersion", version: OUDSVersions.themeSoshCoreVersion)
        VersionItem(title: "app_about_details_themeWireframeCoreVersion", version: OUDSVersions.themeWireframeCoreVersion)
        VersionItem(title: "app_about_details_themeOrangeBrandVersion", version: OUDSVersions.themeOrangeBrandVersion)
        VersionItem(title: "app_about_details_themeSoshBrandVersion", version: OUDSVersions.themeSoshBrandVersion)
        VersionItem(title: "app_about_details_themeOrangeCompactBrandVersion", version: OUDSVersions.themeOrangeCompactBrandVersion)
        VersionItem(title: "app_about_details_themeWireframeBrandVersion", version: OUDSVersions.themeWireframeBrandVersion)
    }
}

#if DEBUG
// MARK: - About Debug Section View

private struct AboutDebugSection: View {

    /// Also observed by MainView to conditionally insert the sandbox tab.
    @AppStorage(SandboxUserDefaultsKeys.sandboxEnabled) private var sandboxEnabled: Bool = false

    var body: some View {
        Section(header: OUDSHeading("app_about_debug_title", hasMarker: true)) {
            // swiftlint:disable accessibility_label_for_image
            OUDSSwitchItem("app_about_sandbox_label",
                           isOn: $sandboxEnabled,
                           description: "app_about_sandbox_description".localized(),
                           image: .init(asset: Image(systemName: "hammer")))
            // swiftlint:enable accessibility_label_for_image
            OUDSButton("app_about_debug_clearCache_label", appearance: .negative) {
                OUDSAsyncImageCache.shared.clearCache()
            }
        }
    }
}
#endif

// MARK: - Liquid Glass State Item

private struct LiquidGlassStateItem: View {

    @Environment(\.isLiquidGlassDisabled) private var isLiquidGlassDisabled
    @Environment(\.forceOUDSLegacyLayout) private var forceOUDSLegacyLayout

    private var status: OUDSTag.Status {
        if #available(iOS 26, *) {
            if forceOUDSLegacyLayout || isLiquidGlassDisabled { return .negative(leading: .none) }
            return .positive(leading: .none)
        } else {
            return .warning(leading: .none)
        }
    }

    private var appearance: OUDSTag.Appearance {
        if #available(iOS 26, *) {
            if forceOUDSLegacyLayout || isLiquidGlassDisabled { return .emphasized }
            return .muted
        } else {
            return .muted
        }
    }

    private var wording: String {
        if #available(iOS 26, *) {
            if forceOUDSLegacyLayout { return "app_common_forced_tech".localized() + " " + "app_common_disabled_tech".localized() }
            if isLiquidGlassDisabled { return "app_common_disabled_tech".localized() }
            return "app_common_enabled_tech".localized()
        } else {
            return "app_common_unavailable_tech".localized()
        }
    }

    var body: some View {
        let versionTag = OUDSTag(label: wording,
                                 status: status,
                                 appearance: appearance,
                                 shape: .rounded,
                                 size: .small)

        OUDSStaticListItem(data: .init(label: .textual(.localized("app_about_isLiquidGlass_disabled"))),
                           trailing: .tag(versionTag))
            .oudsListItemStyle(divider: false)
            .oudsListItemSize(.small)
    }
}

// MARK: - Version Item View

private struct VersionItem: View {

    let title: String
    let version: String

    var body: some View {
        let versionTag = OUDSTag(label: version,
                                 status: .info(leading: .none),
                                 appearance: .muted,
                                 shape: .rounded,
                                 size: .small)

        OUDSStaticListItem(data: .init(label: .textual(.raw(title.localized()))),
                           trailing: .tag(versionTag))
            .oudsListItemStyle(divider: false)
            .oudsListItemSize(.small)
            .modifier(CopyableTextViewModifier(version))
    }
}
