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

typealias ACDC = AppTestCase.DocumentationCaptures // ⚡

/// ## Device for test
///
/// Use the iPhone you want, in english mode.
/// Configuration with current values is;
/// - iPhone 12 Pro
/// - portrait mode
/// - english app
/// - no increased text
///
/// **Beware, values are for iPhone 12 Pro in portrait mode and only to make screenshots for documentations, so only one device is enough**
extension AppTestCase {

    enum DocumentationCaptures {

        // MARK: - Devices sizes

        static let iPhone12ProPortraitWidth = 1_170

        // MARK: - Coordinates in device grid

        static let screenStartX = 0
        static let deviceWidth = iPhone12ProPortraitWidth

        // MARK: - Actions - Button

        static let buttonX = screenStartX
        static let buttonY = 500
        static let buttonWidth = deviceWidth
        static let buttonHeight = 510

        // MARK: - Controls - Checkbox

        static let checkboxX = screenStartX
        static let checkboxY = 520
        static let checkboxWidth = deviceWidth
        static let checkboxHeight = 500

        // MARK: - Controls - Checkbox item

        static let checkboxItemX = screenStartX
        static let checkboxItemY = 520
        static let checkboxItemWidth = deviceWidth
        static let checkboxItemHeight = 570

        // MARK: - Controls - Checkbox picker

        static let checkboxPickerX = screenStartX
        static let checkboxPickerY = 470
        static let checkboxPickerWidth = deviceWidth
        static let checkboxPickerHeight = 1_180

        // MARK: - Controls - Radio

        static let radioX = screenStartX
        static let radioY = 550
        static let radioWidth = deviceWidth
        static let radioHeight = 500

        // MARK: - Controls - Radio item

        static let radioItemX = screenStartX
        static let radioItemY = 520
        static let radioItemWidth = deviceWidth
        static let radioItemHeight = 570

        // MARK: - Controls - Radio picker

        static let radioPickerX = screenStartX
        static let radioPickerY = 440
        static let radioPickerWidth = deviceWidth
        static let radioPickerHeight = 1_180

        // MARK: - Controls - Switch

        static let switchX = screenStartX
        static let switchY = 460
        static let switchWidth = deviceWidth
        static let switchHeight = 400

        // MARK: - Controls - Switch item

        static let switchItemX = screenStartX
        static let switchItemY = 460
        static let switchItemWidth = deviceWidth
        static let switchItemHeight = 570

        // MARK: - Indicators - Badge

        static let badgeX = screenStartX
        static let badgeY = 620
        static let badgeWidth = deviceWidth
        static let badgeHeight = 350

        // MARK: - Indicators - Tag

        static let tagX = screenStartX
        static let tagY = 520
        static let tagWidth = deviceWidth
        static let tagHeight = 400
    }
}
