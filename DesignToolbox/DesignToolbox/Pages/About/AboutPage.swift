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

    // NOTE: "unused" false-positive for periphery (https://github.com/peripheryapp/periphery/issues/993)
    @Environment(\.layoutDirection) private var layoutDirection
    @Environment(\.theme) private var theme

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
        }
        .navigationViewStyle(.stack)
        #else
        NavigationView {
            listBody
        }
        .navigationViewStyle(.automatic)
        #endif
    }

    private var listBody: some View {
        List {
            legalView
            buildView
            linksView
        }
        .oudsNavigationTitle("app_bottomBar_about_label")
    }

    // MARK: - Views

    #if os(iOS)
    @ViewBuilder
    private var legalView: some View {
        NavigationLink {
            WebView(from: privacyPolicyUrl)
                .navigationTitle("app_about_privacyPolicy_label")
        } label: {
            Text("app_about_privacyPolicy_label")
        }

        NavigationLink {
            WebView(from: legalInformationUrl)
                .navigationTitle("app_about_legalInformation_label")
        } label: {
            Text("app_about_legalInformation_label")
        }

        NavigationLink {
            AccessibilityStatementPage()
                .navigationTitle("app_about_accessibilityStatement_label")
        } label: {
            Text("app_about_accessibilityStatement_label")
        }
    }

    #elseif os(macOS)
    @ViewBuilder
    private var legalView: some View {
        NavigationLink {
            WebView(from: privacyPolicyUrl)
        } label: {
            Text("app_about_privacyPolicy_label")
        }

        NavigationLink {
            WebView(from: legalInformationUrl)
        } label: {
            Text("app_about_legalInformation_label")
        }
    }
    #else
    @ViewBuilder
    private var legalView: some View {
        EmptyView()
    }
    #endif

    @ViewBuilder
    private var buildView: some View {

        if Bundle.main.fullBuildType == "stable" {
            OpenableText("app_about_details_appVersion" <- Bundle.main.marketingVersion, anchor: Bundle.main.marketingVersion, type: .githubRelease)
                .modifier(CopyableTextViewModifier(Bundle.main.marketingVersion))
        } else {
            VersionItem(title: "app_about_details_appVersion", version: Bundle.main.marketingVersion)
        }

        VersionItem(title: "app_about_details_buildNumber", version:Bundle.main.buildNumber)

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

        VersionItem(title: "app_about_details_themeOrangeBusinessToolsBrandVersion",
                    version: OUDSVersions.themeOrangeBusinessToolsBrandVersion)

        VersionItem(title: "app_about_details_themeWireframeBrandVersion",
                    version:  OUDSVersions.themeWireframeBrandVersion)
    }

    @ViewBuilder
    private var linksView: some View {
        #if os(iOS)
        Button {
            OSUtilities.open(url: appSettingsUrl)
        } label: {
            HStack {
                Text("app_about_appSettings_label")
                Spacer()
                Image(systemName: "gear").accessibilityHidden(true)
            }
        }.accessibilityHint("app_about_appSettings_hint_a11y")
        #endif

        if let changelogURL = Bundle.main.changelogURL {
            link(changelogURL, label: "app_about_changelog_label", hint: "app_about_changelog_hint_a11y")
        }
        link(appSourcesUrl, label: "app_about_appSources_label", hint: "app_about_appSources_hint_a11y")
        link(bugReportUrl, label: "app_about_bugReport_label", hint: "app_about_bugReport_hint_a11y")
        link(designSystemUrl, label: "app_about_designSystem_label", hint: "app_about_designSystem_hint_a11y")
    }

    @ViewBuilder
    private func link(_ url: URL, label: String, hint: String) -> some View {
        Link(destination: url) {
            HStack {
                Text(label.localized())
                Spacer()
                if layoutDirection == .leftToRight {
                    Image(systemName: "arrow.up.right.square").accessibilityHidden(true)
                } else {
                    Image(systemName: "arrow.up.left.square").accessibilityHidden(true)
                }
            }
        }
        .accessibilityHint(hint.localized())
        .accessibilityRemoveTraits([.isButton]) // Has also link trait
    }
}


struct VersionItem: View {
    
    // MARK: Properties

    let title: String
    let version: String
    @Environment(\.theme) var theme
    
    // MARK: Body
    
    var body: some View {
        HStack(alignment: .center, spacing: theme.spaces.fixedXsmall) {
            Text(title.localized())
                .oudsForegroundColor(theme.colors.contentDefault)

            Spacer()

            OUDSTag(label: version,
                    status: .info(leading: .none),
                    appearance: .muted,
                    shape: .rounded,
                    size: .small,
                    hasLoader: false)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .modifier(CopyableTextViewModifier(version))
    }
}
