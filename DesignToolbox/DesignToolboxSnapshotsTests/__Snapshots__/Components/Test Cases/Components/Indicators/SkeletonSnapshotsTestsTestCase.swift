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
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSSkeleton` for each parameter.
///
/// **The shimmer animation is disabled for the tests (`isAnimated: false`) to make snapshots deterministic.**
@available(iOS 16.0, *) // <--- available iOS 16+ because of AnyShape
open class SkeletonSnapshotsTestsTestCase: XCTestCase {

    /// This function tests all skeletons with all security margins and shapes for the given theme and color scheme.
    ///
    /// It iterates through the `securityMargin` flag, and the `Rectangle`, `RoundedRectangle` (with a corner radius
    /// of `0` and `.infinity`) and `Circle` shapes, unified through `AnyShape`.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllSkeletons(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        for securityMargin in [true, false] {
            let shapes: [(name: String, shape: AnyShape)] = [
                ("Rectangle", AnyShape(Rectangle())),
                ("RoundedRectangle_radius0", AnyShape(RoundedRectangle(cornerRadius: 0))),
                ("RoundedRectangle_radiusInfinity", AnyShape(RoundedRectangle(cornerRadius: .infinity))),
                ("Circle", AnyShape(Circle())),
            ]

            for (shapeName, shape) in shapes {
                testSkeleton(theme: theme,
                             interfaceStyle: interfaceStyle,
                             securityMargin: securityMargin,
                             shapeName: shapeName,
                             shape: shape)
            }
        }
    }

    /// This function tests `OUDSSkeleton` according to the given parameters for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// - Parameters:
    ///   - theme: The theme (`OUDSTheme`)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - securityMargin: Whether to apply vertical padding to the skeleton.
    ///   - shapeName: The technical name of the shape used, for the snapshot file name.
    ///   - shape: The shape applied on the skeleton.
    @MainActor func testSkeleton(theme: OUDSTheme,
                                 interfaceStyle: UIUserInterfaceStyle,
                                 securityMargin: Bool,
                                 shapeName: String,
                                 shape: AnyShape)
    {
        // Generate the illustration for the specified configuration
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSSkeleton(securityMargin: securityMargin, shape: shape)
                .frame(width: 200, height: 62, alignment: .center)
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<shapeName><securityMarginPattern>
        let testName = "testSkeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let securityMarginPattern = securityMargin ? ".securityMargin" : ".noSecurityMargin"
        let name = "\(shapeName)\(securityMarginPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
