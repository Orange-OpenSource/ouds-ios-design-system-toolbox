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

import Foundation

extension Bundle {

    // MARK: API

    /// Marketing version in semantic versioning, for example "0.15.0".
    /// Mapped to field *CFBundleShortVersionString* in project settings.
    var marketingVersion: String {
        string(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "0.0.0"
    }

    /// Incremental build number, for example timestamp or manualy defined value.
    /// Mapped to value *kCFBundleVersionKey* in project settings.
    var buildNumber: String {
        string(forInfoDictionaryKey: kCFBundleVersionKey as String) ?? "-1"
    }

    /// Type of build. Should be within (see Fastfile):
    /// - "debug" for developers builds
    /// - "alpha" for features tests (CI/CD builds)
    /// - "beta" for develop branch (CI/CD builds nightly builds)
    /// - "stable" for main releases (CI/CD builds)
    var buildType: String {
        #if DEBUG
        "debug"
        #else
        string(forInfoDictionaryKey: "OUDSBuildType")
        #endif
    }

    /// A value filled outside the app (e.g. by the CI/CD chain) for debug purposes to help to match the current app codebase to some CI/CD build tag.
    /// For example, tag suffix for CI and TestFlight Git tags with hash of commits.
    var buildTag: String? {
        #if DEBUG
        nil
        #else
        string(forInfoDictionaryKey: "OUDSBuildTag")
        #endif
    }

    /// A value filled outside the app (e.g. by the CI/CD chain) for debug purposes to help to match the current app codebase to some issues to test.
    /// For example, contains the issues numbers.
    var buildDetails: String? {
        #if DEBUG
        nil
        #else
        string(forInfoDictionaryKey: "OUDSBuildDetails")
        #endif
    }

    /// A value filled outside the app (e.g. by the CI/CD chain) to indicate the version of the OUDS iOS Swift Package in use
    /// For example, contains a tag or a branch or a commit hash
    var sdkVersion: String? {
        #if DEBUG
        nil
        #else
        string(forInfoDictionaryKey: "OUDSSDKVersion")
        #endif
    }

    var fullBuildType: String {
        var tag = ""
        if let buildTag, !buildTag.isEmpty {
            tag = " (\(buildTag))"
        }
        return "\(buildType)\(tag)"
    }

    // WARNING: Do not change this value below as automatically parsed by script
    var tokensLibraryVersion: String {
        "Tokens version: 0.11.0"
    }

    /// URL to the CHANGELOG to open depending to what the CI/CD defines
    var changelogURL: URL? {
        #if DEBUG
        nil
        #else
        URL(string: string(forInfoDictionaryKey: "OUDSSDKChangelog"))
        #endif
    }

    // MARK: Private Implementation

    private func string(forInfoDictionaryKey key: String) -> String? {
        object(forInfoDictionaryKey: key) as? String
    }
}
