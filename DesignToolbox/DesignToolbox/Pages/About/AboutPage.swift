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

    #if DEBUG
    /// DEBUG-only flag persisting whether the sandbox tab must be displayed.
    /// Toggled by the "Bac à sable" switch item at the bottom of the About page
    /// and observed by ``MainView`` to conditionally insert the Debug tab.
    @AppStorage(SandboxUserDefaultsKeys.sandboxEnabled) private var sandboxEnabled: Bool = false
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
        NavigationView {
            listBody
                .navigationBarTitleDisplayMode(.inline)
                .accentColor(theme.bar.colorAccent)
        }
        .navigationViewStyle(.stack)
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
           legalView
            versionsView
            buildView
            linksView
        }
        .oudsScreenTitle("app_bottomBar_about_label")
    }

    // MARK: - Views

    #if os(iOS)
    @ViewBuilder
    private var legalView: some View {
        link(title: "app_about_privacyPolicy_label", forWebview: privacyPolicyUrl)
        link(title: "app_about_legalInformation_label", forWebview: legalInformationUrl)
        link(title: "app_about_accessibilityStatement_label", forView: AccessibilityStatementPage())
    }

    #elseif os(macOS)
    @ViewBuilder
    private var legalView: some View {
        link(title: "app_about_privacyPolicy_label", forWebview: privacyPolicyUrl)
        link(title: "app_about_legalInformation_label", forWebview: legalInformationUrl)
    }
    #else
    @ViewBuilder
    private var legalView: some View {
        EmptyView()
    }
    #endif

    @ViewBuilder
    private var versionsView: some View {

        VersionItem(title: "app_about_details_themeCoreVersion",
                    version: OUDSVersions.themeCoreVersion)

        VersionItem(title: "app_about_details_themeOrangeCoreVersion",
                    version: OUDSVersions.themeOrangeCoreVersion)

        VersionItem(title: "app_about_details_themeSoshCoreVersion",
                    version: OUDSVersions.themeSoshCoreVersion)

        VersionItem(title: "app_about_details_themeWireframeCoreVersion",
                    version: OUDSVersions.themeWireframeCoreVersion)

        VersionItem(title: "app_about_details_themeOrangeBrandVersion",
                    version: OUDSVersions.themeOrangeBrandVersion)

        VersionItem(title: "app_about_details_themeSoshBrandVersion",
                    version: OUDSVersions.themeSoshBrandVersion)

        VersionItem(title: "app_about_details_themeOrangeCompactBrandVersion",
                    version: OUDSVersions.themeOrangeCompactBrandVersion)

        VersionItem(title: "app_about_details_themeWireframeBrandVersion",
                    version: OUDSVersions.themeWireframeBrandVersion)
    }

    @ViewBuilder
    private var buildView: some View {

        LiquidGlassStateItem()

        if Bundle.main.fullBuildType == "stable" {
            OpenableText("app_about_details_appVersion_stable" <- Bundle.main.marketingVersion,
                         anchor: Bundle.main.marketingVersion,
                         type: .githubRelease)
                .modifier(CopyableTextViewModifier(Bundle.main.marketingVersion))
        } else {
            VersionItem(title: "app_about_details_appVersion", version: Bundle.main.marketingVersion)
        }

        VersionItem(title: "app_about_details_buildNumber", version: Bundle.main.buildNumber)

        OpenableText("app_about_details_buildType" <- Bundle.main.fullBuildType, anchor: Bundle.main.fullBuildType, type: .githubBuild)
            .modifier(CopyableTextViewModifier(Bundle.main.fullBuildType))

        if let sdkVersion = Bundle.main.sdkVersion, !sdkVersion.isEmpty {
            OpenableText("app_about_details_sdkVersion" <- sdkVersion, anchor: sdkVersion, type: .githubVersion)
                .modifier(CopyableTextViewModifier(sdkVersion))
        }

        if let buildDetails = Bundle.main.buildDetails {
            OpenableText("app_about_details_githubBuildDetails" <- buildDetails, anchor: buildDetails, type: .githubIssue)
                .modifier(CopyableTextViewModifier(buildDetails.leadingColumnFragment))
        }
    }

    @ViewBuilder
    private var linksView: some View {
        #if os(iOS)
        // swiftlint:disable accessibility_label_for_image
        OUDSNavigationListItem(data: .init(key: "app_about_appSettings_label"),
                               indicatorType: .external,
                               leading: .image(.init(asset: Image(systemName: "gear"))))
        {
            OSUtilities.open(url: appSettingsUrl)
        }
        .oudsListItemStandardStyle(.backgroundOnInteractionOnly(withDivider: false))
        .oudsListItemSize(.small)
        // swiftlint:enable accessibility_label_for_image
        #endif

        if let changelogURL = Bundle.main.changelogURL {
            link(changelogURL, label: "app_about_changelog_label", assetName: "text.pad.header")
        }
        link(appSourcesUrl, label: "app_about_appSources_label", assetName: "apple.terminal")
        link(bugReportUrl, label: "app_about_bugReport_label", assetName: "ant.fill")
        link(designSystemUrl, label: "app_about_designSystem_label", assetName: "paintpalette.fill")
    }

    #if !os(visionOS) && !os(tvOS)
    @ViewBuilder private func link(title: LocalizedStringKey, forWebview url: URL) -> some View {
        OUDSNavigationLink(title, style: .standard(.backgroundOnInteractionOnly(withDivider: false))) {
            WebView(from: url)
        }
        .oudsListItemSize(.small)
    }

    @ViewBuilder private func link(title: LocalizedStringKey, forView view: some View) -> some View {
        OUDSNavigationLink(title, style: .standard(.backgroundOnInteractionOnly(withDivider: false))) {
            view
        }
        .oudsListItemSize(.small)
    }
    #endif

    @ViewBuilder
    private func link(_ url: URL, label: LocalizedStringKey, assetName: String) -> some View {
        // swiftlint:disable accessibility_label_for_image
        OUDSNavigationListItem(data: .init(key: label),
                               indicatorType: .external,
                               leading: .image(.init(asset: Image(systemName: assetName))))
        {
            openURL.callAsFunction(url)
        }
        .oudsListItemStandardStyle(.backgroundOnInteractionOnly(withDivider: false))
        .oudsListItemSize(.small)
        // swiftlint:enable accessibility_label_for_image
    }

    // swiftlint:disable accessibility_label_for_image
    /// DEBUG-only switch item displayed at the very bottom of the About list.
    /// Enabling it makes ``MainView`` add a "Debug" tab in first position.
    @ViewBuilder
    private var debugSandboxView: some View {
        #if DEBUG
        OUDSSwitchItem("app_about_sandbox_label",
                       isOn: $sandboxEnabled,
                       description: "app_about_sandbox_description".localized(),
                       image: .init(asset: Image(systemName: "hammer")))
        #else
        EmptyView()
        #endif
    }
    // swiftlint:enable accessibility_label_for_image
}

// MARK: - State Item

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

        let tag = OUDSTag(label: wording,
                          status: status,
                          appearance: appearance,
                          shape: .rounded,
                          size: .small,
                          hasLoader: false)

        OUDSStaticListItem(data: .init(key: "app_about_isLiquidGlass_disabled"), trailing: .tag(tag))
            .oudsListItemStandardStyle(.backgroundOnInteractionOnly(withDivider: false))
            .oudsListItemSize(.small)
    }
}

// MARK: - Version Item

private struct VersionItem: View {

    let title: LocalizedStringKey
    let version: String

    var body: some View {
        let tag = OUDSTag(label: version,
                          status: .info(leading: .none),
                          appearance: .muted,
                          shape: .rounded,
                          size: .small,
                          hasLoader: false)

        OUDSStaticListItem(data: .init(key: title), trailing: .tag(tag))
            .oudsListItemStandardStyle(.backgroundOnInteractionOnly(withDivider: false))
            .oudsListItemSize(.small)
            .modifier(CopyableTextViewModifier(version))
    }
}
