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

/// Holds information about an available App Store update.
struct AppStoreUpdateInfo {

    /// The version string available on the App Store (e.g. "2.3.0").
    let version: String

    /// The release notes returned by the iTunes lookup API (may be nil or empty).
    let releaseNotes: String?

    /// The direct App Store URL to open when the user taps the dedicated button.
    let appStoreURL: URL
}
