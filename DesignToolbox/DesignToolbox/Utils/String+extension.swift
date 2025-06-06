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
}
