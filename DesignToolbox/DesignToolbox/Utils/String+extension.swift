//
// Software Name: OUDSThemesContract iOS
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

// MARK: - Operators

infix operator <-

// MARK: - String extension

extension String {

    // MARK: - Sugar

    // swiftlint:disable force_unwrapping
    var leadingColumnFragment: String {
        components(separatedBy: ":").last!.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    // swiftlint:enable force_unwrapping

    // MARK: - L10N

    /// Just an operator to inject as `String` one argument in a localizable
    /// - Parameters:
    ///    - lhs: The localizable value to update
    ///    - rhs: The value as String to inject in `lhs`
    /// - Returns String: The final result
    static func <- (lhs: String, rhs: String) -> String {
        String(format: lhs.localized(), rhs)
    }

    /// Just an operator to inject as `Double` one argument in a localizable
    /// - Parameters:
    ///    - lhs: The localizable value to update
    ///    - rhs: The value as Double to inject in `lhs`
    /// - Returns String: The final result
    static func <- (lhs: String, rhs: Double) -> String {
        String(format: lhs.localized(), rhs)
    }

    /// Just an operator to inject as `Int` one argument in a localizable
    /// - Parameters:
    ///    - lhs: The localizable value to update
    ///    - rhs: The value as Int to inject in `lhs`
    /// - Returns String: The final result
    static func <- (lhs: String, rhs: Int) -> String {
        String(format: lhs.localized(), rhs)
    }

    // MARK: - Localized

    // swiftlint:disable nslocalizedstring_key
    /// Returns the localized result string using `self` as key.
    /// - Returns String: The conversion of `self` as `NSLocalizedString`
    func localized() -> String {
        NSLocalizedString(self, bundle: Bundle.main, comment: "")
    }

    // swiftlint:enable nslocalizedstring_key

    // MARK: - GitHub boilerplates

    /// - Returns: The URL for the given GitHub release
    public func toGitHubRelease() -> String {
        let pattern = #"^\d+(\.\d+){2}$"#
        let regex = try? NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: utf16.count)
        guard regex?.firstMatch(in: self, options: [], range: range) != nil else {
            return "https://github.com/Orange-OpenSource/ouds-ios/releases" // Default fallback
        }
        return "https://github.com/Orange-OpenSource/ouds-ios/releases/tag/\(self)"
    }

    /// - Returns: The URL for the given GitHub build
    public func toGitHubBuild() -> String {
        if self == "stable" {
            return "https://github.com/Orange-OpenSource/ouds-ios/tree/main"
        }

        if contains("beta (nightly)") || contains("alpha"), let parts = components(separatedBy: "(").last {
            let commitHash = parts.trimmingCharacters(in: CharacterSet(charactersIn: ")"))
            return "https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/commit/\(commitHash)"
        }

        return "https://github.com/Orange-OpenSource/ouds-ios"
    }

    /// - Returns: An array of URL of GitHub issues
    public func toGitHubIssues() -> [String] {
        if !contains(",") { // Supposing here the CI/CD defined in Info.plist one issue number
            return ["https://github.com/Orange-OpenSource/ouds-ios/issues/\(self)"]
        }
        let issues = components(separatedBy: ",")
        return issues.compactMap {
            $0.trimmingCharacters(in: .whitespacesAndNewlines).toGitHubIssue()
        }
    }

    /// - Returns: The URL for the given GitHub issue
    public func toGitHubIssue() -> String {
        "https://github.com/Orange-OpenSource/ouds-ios/issues/\(self)"
    }

    /// - Returns: The URL for the given GitHub version
    public func toGitHubVersion() -> String {
        if isEmpty {
            return "https://github.com/Orange-OpenSource/ouds-ios/tree/main"
        }
        // Version is based on a feature branch, i.e. alpha builds
        let versionBranchRegexp = #"^\d+-"#
        if range(of: versionBranchRegexp, options: .regularExpression) != nil {
            let branch = components(separatedBy: " ").first ?? ""
            return "https://github.com/Orange-OpenSource/ouds-ios/tree/\(branch)"
        }
        // Version is based on develop branch, i.e. beta builds
        if starts(with: "develop") {
            return "https://github.com/Orange-OpenSource/ouds-ios/tree/develop"
        }
        // Version is stable, i.e. tag
        if let part = components(separatedBy: "(").last {
            let commitHash = part.trimmingCharacters(in: CharacterSet(charactersIn: ")"))
            return "https://github.com/Orange-OpenSource/ouds-ios/commit/\(commitHash)"
        }
        return "https://github.com/Orange-OpenSource/ouds-ios/tree/main"
    }
}
