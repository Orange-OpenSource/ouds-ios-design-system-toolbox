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
import OUDSFoundations

/// Fetches App Store metadata via the iTunes lookup API and compares it with the
/// current bundle version to determine whether an update is available.
enum AppStoreUpdateService {

    // MARK: - Constants

    /// The numeric App Store ID for the app (visible in the App Store URL).
    /// Using the numeric ID instead of the bundle ID allows lookup to work even
    /// for unlisted apps, which are not indexed by bundle ID.
    private static let appStoreID = "6743708286"

    /// iTunes lookup endpoint template.
    private static let lookupURLString = "https://itunes.apple.com/lookup?id=\(appStoreID)&t=\(Date().timeIntervalSince1970)"

    // MARK: - Public API

    /// Queries the iTunes lookup API and returns an ``AppStoreUpdateInfo`` when a newer
    /// version than the one currently installed is available.
    ///
    /// - Returns: An ``AppStoreUpdateInfo`` if an update is available, `nil` otherwise.
    /// - Throws: Never surfaces errors to callers — all network / parsing failures are
    ///   swallowed and treated as "no update available" so the app stays silent on error.
    static func checkForUpdate() async -> AppStoreUpdateInfo? {
        guard let url = URL(string: lookupURLString) else { return nil }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            // Ensure we received a valid 200 HTTP response.
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200
            else {
                OL.error("No data retrieved from iTunes lookup, impossible to check for updates")
                return nil
            }

            return parse(data: data)
        } catch {
            // Network unavailable or any URLSession error → silent failure.
            OL.error("No data retrieved from iTunes lookup, impossible to check for updates")
            return nil
        }
    }

    // MARK: - Private helpers

    /// Parses the raw iTunes lookup JSON payload.
    private static func parse(data: Data) -> AppStoreUpdateInfo? {
        // Step 1 — Deserialise the JSON envelope.
        guard
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let results = json["results"] as? [[String: Any]]
        else {
            OL.error("Failed to deserialise iTunes lookup response")
            return nil
        }

        // Step 2 — An empty results array is a valid API response meaning the app
        // is not (yet) listed on the public App Store. This is not an error.
        guard !results.isEmpty, let first = results.first else {
            OL.error("App not found on App Store, no update check possible")
            return nil
        }

        // Step 3 — Extract the required fields from the first result.
        guard
            let storeVersion = first["version"] as? String,
            let trackViewURL = first["trackViewUrl"] as? String,
            let appStoreURL = URL(string: trackViewURL)
        else {
            OL.error("Failed to parse App Store result fields (version or trackViewUrl missing)")
            return nil
        }

        let releaseNotes = first["releaseNotes"] as? String

        // Only report an update if the store version is strictly newer.
        guard isNewer(storeVersion: storeVersion, than: Bundle.main.marketingVersion) else {
            OL.log("No available update (\(Bundle.main.marketingVersion) > \(storeVersion))")
            return nil
        }

        OL.log("Update available (current \(Bundle.main.marketingVersion), App Store \(storeVersion))")
        return AppStoreUpdateInfo(
            version: storeVersion,
            releaseNotes: releaseNotes,
            appStoreURL: appStoreURL)
    }

    /// Returns `true` when `storeVersion` is strictly greater than `localVersion`
    /// using semantic versioning comparison via `compareVersion`.
    private static func isNewer(storeVersion: String, than localVersion: String) -> Bool {
        storeVersion.compareVersion(to: localVersion) == .orderedDescending
    }
}

// MARK: - String version comparison helper

extension String {

    /// Compares two dotted-decimal version strings (e.g. "2.3.0") and returns a
    /// `ComparisonResult` consistent with standard semantic version ordering.
    func compareVersion(to other: String) -> ComparisonResult {
        let lhs = versionComponents()
        let rhs = other.versionComponents()
        let maxLength = max(lhs.count, rhs.count)

        for index in 0 ..< maxLength {
            let lhsValue = index < lhs.count ? lhs[index] : 0
            let rhsValue = index < rhs.count ? rhs[index] : 0
            if lhsValue < rhsValue { return .orderedAscending }
            if lhsValue > rhsValue { return .orderedDescending }
        }
        return .orderedSame
    }

    private func versionComponents() -> [Int] {
        split(separator: ".").compactMap { Int($0) }
    }
}
