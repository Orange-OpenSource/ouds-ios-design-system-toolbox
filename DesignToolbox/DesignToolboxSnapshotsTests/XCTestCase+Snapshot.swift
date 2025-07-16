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

import SnapshotTesting
import SwiftUI
import XCTest

/// Just to gather some utilities for UI tests
extension XCTestCase {

    /// Determines the percentage of pixels that must match exactly
    public static let precision: Float = 0.96

    /// Determines the percentage of pixels that must match
    /// but adjusted for minor visual differences that may not be noticeable to the human eye,
    /// thus reducing false positive
    public static let perceptualPrecision: Float = 0.97

    /// TImeout before failing the test
    private static let timeout: TimeInterval = 10

    // swiftlint:disable function_default_parameter_at_end
    /// Given the `UIHostingController` for a specific `UIUserInterfaceStyle`, make assertions on snapshots.
    /// Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name.
    ///
    /// - Parameters:
    ///    - illustration: A value to compare against a reference,  embeded inside a `UIHostingControler` as a root view
    ///    - uiStyle: The UI style to apply in `UITraitCollection` to compute the image, light mode or dark mode
    ///    - a11yContrast: The constrat mode, default set to normal
    ///    - named: Name of the snapshot image
    ///    - precision: Percentage of pixels that must match exactly
    ///    - perceptualPrecision: Percentage if pixels but adjusted for minor visual difference
    ///    - testName: Name for the tests
    @MainActor func assertIllustration(_ illustration: some View,
                                       on uiStyle: UIUserInterfaceStyle,
                                       a11yContrast: UIAccessibilityContrast = .normal,
                                       named: String,
                                       precision: Float = XCTestCase.precision,
                                       perceptualPrecision: Float = XCTestCase.perceptualPrecision,
                                       testName: String,
                                       fileID: StaticString = #fileID,
                                       file: StaticString = #filePath)
    {
        let hostingViewController = UIHostingController(rootView: illustration)
        assertSnapshot(of: hostingViewController,
                       as: .image(precision: precision,
                                  perceptualPrecision: perceptualPrecision,
                                  traits: UITraitCollection(traitsFrom: [UITraitCollection(userInterfaceStyle: uiStyle), UITraitCollection(accessibilityContrast: a11yContrast)])),
                       named: named,
                       timeout: Self.timeout,
                       fileID: fileID,
                       file: file,
                       testName: testName)
    }
    // swiftlint:enable function_default_parameter_at_end
}
