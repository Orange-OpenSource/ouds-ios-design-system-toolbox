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

        // Offsets to apply if, for example, use another device almost with same diemsnsions as iPhone 12 Pro
        // Prevents to change all values
        // Feel free to update and precise which device you use!
        private static let offsetX = 0
        private static let offsetY = 0
        private static let offsetWidth = 0
        private static let offsetHeight = 0

        // MARK: - Coordinates in device grid

        static let screenStartX = 0
        static let deviceWidth = iPhone12ProPortraitWidth

        // MARK: - Actions - Button

        static let buttonX = screenStartX + offsetX
        static let buttonY = 500 + offsetY
        static let buttonWidth = deviceWidth + offsetWidth
        static let buttonHeight = 510 + offsetHeight

        // MARK: - Controls - Checkbox

        static let checkboxX = screenStartX + offsetX
        static let checkboxY = 520 + offsetY
        static let checkboxWidth = deviceWidth + offsetWidth
        static let checkboxHeight = 500 + offsetHeight

        // MARK: - Controls - Checkbox item

        static let checkboxItemX = screenStartX + offsetX
        static let checkboxItemY = 520 + offsetY
        static let checkboxItemWidth = deviceWidth + offsetWidth
        static let checkboxItemHeight = 570 + offsetHeight

        // MARK: - Controls - Checkbox picker

        static let checkboxPickerX = screenStartX + offsetX
        static let checkboxPickerY = 470 + offsetY
        static let checkboxPickerWidth = deviceWidth + offsetWidth
        static let checkboxPickerHeight = 1_180 + offsetHeight

        // MARK: - Controls - Radio

        static let radioX = screenStartX + offsetX
        static let radioY = 550 + offsetY
        static let radioWidth = deviceWidth + offsetWidth
        static let radioHeight = 500 + offsetHeight

        // MARK: - Controls - Radio item

        static let radioItemX = screenStartX + offsetX
        static let radioItemY = 520 + offsetY
        static let radioItemWidth = deviceWidth + offsetWidth
        static let radioItemHeight = 570 + offsetHeight

        // MARK: - Controls - Radio picker

        static let radioPickerX = screenStartX + offsetX
        static let radioPickerY = 440 + offsetY
        static let radioPickerWidth = deviceWidth + offsetWidth
        static let radioPickerHeight = 1_180 + offsetHeight

        // MARK: - Controls - Switch

        static let switchX = screenStartX + offsetX
        static let switchY = 460 + offsetY
        static let switchWidth = deviceWidth + offsetWidth
        static let switchHeight = 400 + offsetHeight

        // MARK: - Controls - Switch item

        static let switchItemX = screenStartX + offsetX
        static let switchItemY = 460 + offsetY
        static let switchItemWidth = deviceWidth + offsetWidth
        static let switchItemHeight = 570 + offsetHeight

        // MARK: - Controls - Suggestion chip

        static let suggestionChipX = screenStartX + offsetX
        static let suggestionChipY = 840 + offsetY
        static let suggestionChipWidth = deviceWidth + offsetWidth
        static let suggestionChipHeight = 450 + offsetHeight

        // MARK: - Controls - Filter chip

        static let filterChipX = screenStartX + offsetX
        static let filterChipY = 700 + offsetY
        static let filterChipWidth = deviceWidth + offsetWidth
        static let filterChipHeight = 400 + offsetHeight

        // MARK: - Controls - Chip picker

        static let chipPickerX = screenStartX + offsetX
        static let chipPickerY = 450 + offsetY
        static let chipPickerWidth = deviceWidth + offsetWidth
        static let chipPickerHeight = 550 + offsetHeight

        // MARK: - Indicators - Badge

        static let badgeX = screenStartX + offsetX
        static let badgeY = 620 + offsetY
        static let badgeWidth = deviceWidth + offsetWidth
        static let badgeHeight = 350 + offsetHeight

        // MARK: - Indicators - Tag

        static let tagX = screenStartX + offsetX
        static let tagY = 520 + offsetY
        static let tagWidth = deviceWidth + offsetWidth
        static let tagHeight = 400 + offsetHeight

        // MARK: - Layouts - Horizontal Divider

        static let horizontalDividerX = screenStartX + offsetX
        static let horizontalDividerY = 500 + offsetY
        static let horizontalDividerWidth = deviceWidth + offsetWidth
        static let horizontalDividerHeight = 200 + offsetHeight

        // MARK: - Layouts - Vertical Divider

        static let verticalDividerX = screenStartX + offsetX
        static let verticalDividerY = 500 + offsetY
        static let verticalDividerWidth = deviceWidth + offsetWidth
        static let verticalDividerHeight = 200 + offsetHeight

        // MARK: - Layouts - Colored surface

        static let coloredSurfaceX = screenStartX + offsetX
        static let coloredSurfaceY = 500 + offsetY
        static let coloredSurfaceWidth = deviceWidth + offsetWidth
        static let coloredSurfaceHeight = 200 + offsetHeight

        // MARK: - Navigations - Link

        static let linkX = screenStartX + offsetX
        static let linkY = 600 + offsetY
        static let linkWidth = deviceWidth + offsetWidth
        static let linkHeight = 480 + offsetHeight
    }
}
