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

import OUDSFoundations // NOTE: Seen as "unused" for Periphery (https://github.com/peripheryapp/periphery/issues/942)
import SwiftUI

struct AboutPage: View {

    // MARK: Stored properties

    private let privacyPolicyUrl: URL
    private let legalInformationUrl: URL
    private let appSettingsUrl: URL
    private let appSourcesUrl: URL
    private let bugReportUrl: URL
    private let designSystemUrl: URL
    private let changelogURL: URL

    @Environment(\.layoutDirection) private var layoutDirection

    // MARK: Initializer

    init() {
        guard let privacyNoticeUrl = Bundle.main.url(forResource: "about_privacy_policy", withExtension: "html") else {
            OL.fatal("Unable to find about_privacy_policy.html in resources")
        }

        guard let legalInformationUrl = Bundle.main.url(forResource: "about_legal_information", withExtension: "html") else {
            OL.fatal("Unable to find about_legal_information.html in resources")
        }

        guard let appSettingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            OL.fatal("Unable to find app settings URL")
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

        guard let changelogURL = URL(string: "https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/develop/CHANGELOG.md") else {
            OL.fatal("Unable to forge changelog URL")
        }

        privacyPolicyUrl = privacyNoticeUrl
        self.legalInformationUrl = legalInformationUrl
        self.appSettingsUrl = appSettingsUrl
        self.appSourcesUrl = appSourcesUrl
        self.bugReportUrl = bugReportUrl
        self.designSystemUrl = designSystemUrl
        self.changelogURL = changelogURL
    }

    // MARK: Body

    var body: some View {
        NavigationView {
            List {
                legalView
                buildView
                linksView
            }
            .oudsNavigationTitle("app_bottomBar_about_label")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }

    // MARK: - Views

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

    @ViewBuilder
    private var buildView: some View {
        // TODO: Only for debug purposes, should be displayed in another way
        DesignToolboxCopyableText("app_about_details_appVersion" <- Bundle.main.marketingVersion, Bundle.main.marketingVersion)
        DesignToolboxCopyableText("app_about_details_buildNumber" <- Bundle.main.buildNumber, Bundle.main.buildNumber)
        DesignToolboxCopyableText("app_about_details_buildType" <- Bundle.main.fullBuildType, Bundle.main.fullBuildType)
        if let buildDetails = Bundle.main.buildDetails {
            DesignToolboxCopyableText("app_about_details_githubBuildDetails" <- buildDetails,
                                      buildDetails.leadingColumnFragment)
        }
        if let sdkVersion = Bundle.main.sdkVersion, !sdkVersion.isEmpty {
            DesignToolboxCopyableText("app_about_details_sdkVersion" <- sdkVersion, sdkVersion)
        }
        DesignToolboxCopyableText("\(Bundle.main.tokensLibraryVersion.replacingOccurrences(of: ":", with: ""))",
                                  Bundle.main.tokensLibraryVersion.leadingColumnFragment)
    }

    @ViewBuilder
    private var linksView: some View {
        Button {
            UIApplication.shared.open(appSettingsUrl)
        } label: {
            HStack {
                Text("app_about_appSettings_label")
                Spacer()
                Image(systemName: "gear").accessibilityHidden(true)
            }
        }.accessibilityHint("app_about_appSettings_hint_a11y")

        link(changelogURL, label: "app_about_changelog_label", hint: "app_about_changelog_hint_a11y")
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
