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
import Testing

/// Some tests on String boilerpaltes
struct StringTests {

    @Test func toGitHubRelease() {
        #expect("".toGitHubRelease() == "https://github.com/Orange-OpenSource/ouds-ios/releases")
        #expect("123".toGitHubRelease() == "https://github.com/Orange-OpenSource/ouds-ios/releases")
        #expect("4.5.6".toGitHubRelease() == "https://github.com/Orange-OpenSource/ouds-ios/releases/tag/4.5.6")
    }

    @Test func toGitHubBuild() {
        #expect("".toGitHubBuild() == "https://github.com/Orange-OpenSource/ouds-ios")
        #expect("stable".toGitHubBuild() == "https://github.com/Orange-OpenSource/ouds-ios/tree/main")
        #expect("beta (nightly) (abcdefg)".toGitHubBuild() == "https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/commit/abcdefg")
        #expect("alpha (abcdefg)".toGitHubBuild() == "https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/commit/abcdefg")
    }

    @Test func toGitHubIssues() {
        #expect("123".toGitHubIssues()[0] == "https://github.com/Orange-OpenSource/ouds-ios/issues/123")
        #expect("123, 456, 789".toGitHubIssues()[0] == "https://github.com/Orange-OpenSource/ouds-ios/issues/123")
        #expect("123, 456, 789".toGitHubIssues()[1] == "https://github.com/Orange-OpenSource/ouds-ios/issues/456")
        #expect("123, 456, 789".toGitHubIssues()[2] == "https://github.com/Orange-OpenSource/ouds-ios/issues/789")
    }

    @Test func toGitHubIssue() {
        #expect("123".toGitHubIssue() == "https://github.com/Orange-OpenSource/ouds-ios/issues/123")
        #expect("".toGitHubIssue() == "https://github.com/Orange-OpenSource/ouds-ios/issues/")
    }

    @Test func toGitHubVersion() {
        #expect("407-foo-bar-wizz".toGitHubVersion() == "https://github.com/Orange-OpenSource/ouds-ios/tree/407-foo-bar-wizz")
        #expect("develop".toGitHubVersion() == "https://github.com/Orange-OpenSource/ouds-ios/tree/develop")
        #expect("some (abcdefg)".toGitHubVersion() == "https://github.com/Orange-OpenSource/ouds-ios/commit/abcdefg")
        #expect("".toGitHubVersion() == "https://github.com/Orange-OpenSource/ouds-ios/tree/main")
    }
}
