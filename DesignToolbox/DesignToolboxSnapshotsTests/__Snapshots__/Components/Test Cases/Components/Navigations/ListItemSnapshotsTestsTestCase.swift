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
// swiftlint:disable type_body_length

// MARK: - Test Cases

/// Tests the UI rendering of `OUDSStaticListItem` and `OUDSNavigationListItem` for selected parameter combinations.
///
/// The full combinatoric space is intentionally not covered. Instead, interesting cases are picked
/// along each axis:
/// - **Style**: outlined, standard (divider only, background only, both)
/// - **Alignment**: top, center
/// - **Size**: standard, small
/// - **Rounded media**: enabled/disabled (on image leading/trailing)
/// - **Leading elements**: none, icon (neutral), icon (negative), image, flag, avatar (icon / initials / image)
/// - **Trailing elements**: none, text (label / labelStrong / labelAndExtraLabel), badge, tag, icon, image, flag, avatar
/// - **Text cases**: label only / label+overline+extraLabel+description / full / label+helperText
/// - **Bold label**: always tested both ways for each text case
open class ListItemSnapshotsTestsTestCase: XCTestCase {

    // MARK: - Text case helper

    /// The set of text configurations to exercise on every test dimension.
    enum TextCase: String, CaseIterable {
        /// Only the mandatory label is provided.
        case labelOnly
        /// Label with overline, extraLabel, and description (no helper text).
        case fullWithoutHelper
        /// All text fields provided (label + overline + extraLabel + description + helperText).
        case full
        /// Label with helper text only.
        case labelAndHelper

        var data: OUDSListItemData {
            switch self {
            case .labelOnly:
                OUDSListItemData(label: "Label")
            case .fullWithoutHelper:
                OUDSListItemData(
                    label: "Label",
                    description: "Description",
                    overline: "Overline",
                    extraLabel: "Extra label")
            case .full:
                OUDSListItemData(
                    label: "Label",
                    description: "Description",
                    overline: "Overline",
                    extraLabel: "Extra label",
                    helperText: "Helper text")
            case .labelAndHelper:
                OUDSListItemData(
                    label: "Label",
                    helperText: "Helper text")
            }
        }

        func boldData() -> OUDSListItemData {
            OUDSListItemData(
                label: "Label",
                hasBoldLabel: true,
                description: data.description,
                overline: data.overline,
                extraLabel: data.extraLabel,
                helperText: data.helperText)
        }
    }

    // MARK: - Style tests

    /// Tests all content styles (outlined and standard variants) with both component types,
    /// all text cases, and both label weight variants.
    ///
    /// Other parameters are fixed: alignment=center, size=standard, no leading, no trailing.
    ///
    /// - Parameters:
    ///   - theme: The theme to apply.
    ///   - interfaceStyle: The color scheme (light or dark).
    @MainActor func testAllStyles(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let styles: [(OUDSListItemContentStyle, String)] = [
            (.card(.outlined), "card_outlined"),
            (.card(.outlinedOnInteractionOnly), "card_outlinedOnInteractionOnly"),
            (.card(.background(withDivider: true)), "card_backgroundWithDivider"),
            (.card(.background(withDivider: false)), "card_backgroundWithoutDivider"),
            (.card(.backgroundOnInteractionOnly(withDivider: true)), "card_backgroundOnInteractionOnlyWithDivider"),
            (.card(.backgroundOnInteractionOnly(withDivider: false)), "card_backgroundOnInteractionOnlyWithoutDivider"),
            (.standard(.background(withDivider: false)), "stabdard_backgroundWithoutDivider"),
            (.standard(.backgroundOnInteractionOnly(withDivider: true)), "standard_backgroundOnInteractionOnlyWithDivider"),
        ]
        for (style, styleName) in styles {
            for textCase in TextCase.allCases {
                for isBold in [false, true] {
                    let data = isBold ? textCase.boldData() : textCase.data
                    let boldSuffix = isBold ? "_Bold" : ""
                    testListItem(
                        theme: theme,
                        interfaceStyle: interfaceStyle,
                        style: style,
                        alignment: .center,
                        size: .standard,
                        rounded: false,
                        data: data,
                        leading: nil,
                        trailing: nil,
                        name: "static_\(styleName)_center_standard_\(textCase.rawValue)\(boldSuffix)")
                    testNavigationListItem(
                        theme: theme,
                        interfaceStyle: interfaceStyle,
                        style: style,
                        alignment: .center,
                        size: .standard,
                        rounded: false,
                        data: data,
                        leading: nil,
                        trailing: nil,
                        name: "navigation_\(styleName)_center_standard_\(textCase.rawValue)\(boldSuffix)")
                }
            }
        }
    }

    // MARK: - Alignment tests

    /// Tests top and center alignment with both component types, all text cases, and both label
    /// weight variants.
    ///
    /// Other parameters are fixed: style=outlined, size=standard, leading=icon(neutral), trailing=text(.label).
    ///
    /// - Parameters:
    ///   - theme: The theme to apply.
    ///   - interfaceStyle: The color scheme (light or dark).
    @MainActor func testAllAlignments(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let alignments: [(OUDSListItemContainersAlignment, String)] = [
            (.top, "top"),
            (.center, "center"),
        ]
        let leading = OUDSListItemLeading.icon(OUDSListItemIcon(status: .neutral(asset: Image(decorative: "ic_heart")), description: ""))
        let trailing = OUDSListItemTrailing.text(.label("Label"))
        for (alignment, alignmentName) in alignments {
            for textCase in TextCase.allCases {
                for isBold in [false, true] {
                    let data = isBold ? textCase.boldData() : textCase.data
                    let boldSuffix = isBold ? "_Bold" : ""
                    testListItem(
                        theme: theme,
                        interfaceStyle: interfaceStyle,
                        style: .card(.outlined),
                        alignment: alignment,
                        size: .standard,
                        rounded: false,
                        data: data,
                        leading: leading,
                        trailing: trailing,
                        name: "static_outlined_\(alignmentName)_standard_\(textCase.rawValue)\(boldSuffix)")
                    testNavigationListItem(
                        theme: theme,
                        interfaceStyle: interfaceStyle,
                        style: .card(.outlined),
                        alignment: alignment,
                        size: .standard,
                        rounded: false,
                        data: data,
                        leading: leading,
                        trailing: trailing,
                        name: "navigation_outlined_\(alignmentName)_standard_\(textCase.rawValue)\(boldSuffix)")
                }
            }
        }
    }

    // MARK: - Size tests

    /// Tests standard and small sizes with both component types, all text cases, and both label weight variants.
    ///
    /// Note: in `.small` size, `overline` and `extraLabel` are automatically hidden by the component.
    ///
    /// Other parameters are fixed: style=outlined, alignment=center, no leading, no trailing.
    ///
    /// - Parameters:
    ///   - theme: The theme to apply.
    ///   - interfaceStyle: The color scheme (light or dark).
    @MainActor func testAllSizes(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let sizes: [(OUDSListItemSize, String)] = [
            (.standard, "standard"),
            (.small, "small"),
        ]
        for (size, sizeName) in sizes {
            for textCase in TextCase.allCases {
                for isBold in [false, true] {
                    let data = isBold ? textCase.boldData() : textCase.data
                    let boldSuffix = isBold ? "_Bold" : ""
                    testListItem(
                        theme: theme,
                        interfaceStyle: interfaceStyle,
                        style: .card(.outlined),
                        alignment: .center,
                        size: size,
                        rounded: false,
                        data: data,
                        leading: nil,
                        trailing: nil,
                        name: "static_outlined_center_\(sizeName)_\(textCase.rawValue)\(boldSuffix)")
                    testNavigationListItem(
                        theme: theme,
                        interfaceStyle: interfaceStyle,
                        style: .card(.outlined),
                        alignment: .center,
                        size: size,
                        rounded: false,
                        data: data,
                        leading: nil,
                        trailing: nil,
                        name: "navigation_outlined_center_\(sizeName)_\(textCase.rawValue)\(boldSuffix)")
                }
            }
        }
    }

    // MARK: - Rounded media tests

    /// Tests rounded media flag (true/false) with image as leading and trailing elements.
    ///
    /// Other parameters are fixed: style=outlined, alignment=center, size=standard, full text case, bold=false.
    ///
    /// - Parameters:
    ///   - theme: The theme to apply.
    ///   - interfaceStyle: The color scheme (light or dark).
    @MainActor func testRoundedMedia(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let image = Image(decorative: "ic_heart")
        let leading = OUDSListItemLeading.image(.init(asset: image))
        let trailing = OUDSListItemTrailing.image(.init(asset: image))
        let data = TextCase.full.data
        for rounded in [false, true] {
            let roundedSuffix = rounded ? "_RoundedMedia" : ""
            testListItem(
                theme: theme,
                interfaceStyle: interfaceStyle,
                style: .card(.outlined),
                alignment: .center,
                size: .standard,
                rounded: rounded,
                data: data,
                leading: leading,
                trailing: trailing,
                name: "static_outlined_center_standard_full\(roundedSuffix)")
            testNavigationListItem(
                theme: theme,
                interfaceStyle: interfaceStyle,
                style: .card(.outlined),
                alignment: .center,
                size: .standard,
                rounded: rounded,
                data: data,
                leading: leading,
                trailing: trailing,
                name: "navigation_outlined_center_standard_full\(roundedSuffix)")
        }
    }

    // MARK: - Leading tests

    /// Tests all leading elements with both component types, all text cases, and both label weight variants.
    ///
    /// Other parameters are fixed: style=outlined, alignment=center, size=standard, no trailing.
    ///
    /// - Parameters:
    ///   - theme: The theme to apply.
    ///   - interfaceStyle: The color scheme (light or dark).
    @MainActor func testAllLeadings(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let image = Image(decorative: "ic_heart")
        let leadings: [(OUDSListItemLeading?, String)] = [
            (nil, "none"),
            (.icon(OUDSListItemIcon(status: .neutral(asset: image), description: "icon_neutral")), "icon_neutral"),
            (.icon(OUDSListItemIcon(status: .negative, description: "icon_negative")), "icon_negative"),
            (.image(.init(asset: image)), "image"),
            (.flag(.init(asset: image)), "flag"),
            (.avatar(OUDSListItemAvatar(type: .icon, size: .medium)), "avatar_icon"),
            (.avatar(OUDSListItemAvatar(type: .initials("MT"), size: .medium)), "avatar_initials"),
            (.avatar(OUDSListItemAvatar(type: .image(image), size: .medium)), "avatar_image"),
        ]
        for (leading, leadingName) in leadings {
            for textCase in TextCase.allCases {
                for isBold in [false, true] {
                    let data = isBold ? textCase.boldData() : textCase.data
                    let boldSuffix = isBold ? "_Bold" : ""
                    testListItem(
                        theme: theme,
                        interfaceStyle: interfaceStyle,
                        style: .card(.outlined),
                        alignment: .center,
                        size: .standard,
                        rounded: false,
                        data: data,
                        leading: leading,
                        trailing: nil,
                        name: "static_outlined_center_standard_\(textCase.rawValue)_Leading_\(leadingName)\(boldSuffix)")
                    testNavigationListItem(
                        theme: theme,
                        interfaceStyle: interfaceStyle,
                        style: .card(.outlined),
                        alignment: .center,
                        size: .standard,
                        rounded: false,
                        data: data,
                        leading: leading,
                        trailing: nil,
                        name: "navigation_outlined_center_standard_\(textCase.rawValue)_Leading_\(leadingName)\(boldSuffix)")
                }
            }
        }
    }

    // MARK: - Trailing tests

    /// Tests all trailing elements with both component types, all text cases, and both label weight variants.
    ///
    /// Other parameters are fixed: style=outlined, alignment=center, size=standard, no leading.
    ///
    /// - Parameters:
    ///   - theme: The theme to apply.
    ///   - interfaceStyle: The color scheme (light or dark).
    @MainActor func testAllTrailings(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let image = Image(decorative: "ic_heart")
        let trailings: [(OUDSListItemTrailing?, String)] = [
            (nil, "none"),
            (.text(.label("Label")), "text_label"),
            (.text(.labelStrong("Label")), "text_labelStrong"),
            (.text(.labelAndExtraLabel("Label", "Extra")), "text_labelAndExtraLabel"),
            (.badge(.standard(OUDSBadgeStandard(accessibilityLabel: "", status: .negative, size: .small))), "badge"),
            (.tag(OUDSTag(label: "Tag")), "tag"),
            (.icon(OUDSListItemIcon(status: .neutral(asset: image), description: "icon_neutral")), "icon_neutral"),
            (.image(.init(asset: image)), "image"),
            (.flag(.init(asset: image)), "flag"),
            (.avatar(OUDSListItemAvatar(type: .icon, size: .medium)), "avatar_icon"),
        ]
        for (trailing, trailingName) in trailings {
            for textCase in TextCase.allCases {
                for isBold in [false, true] {
                    let data = isBold ? textCase.boldData() : textCase.data
                    let boldSuffix = isBold ? "_Bold" : ""
                    testListItem(
                        theme: theme,
                        interfaceStyle: interfaceStyle,
                        style: .card(.outlined),
                        alignment: .center,
                        size: .standard,
                        rounded: false,
                        data: data,
                        leading: nil,
                        trailing: trailing,
                        name: "static_outlined_center_standard_\(textCase.rawValue)_Trailing_\(trailingName)\(boldSuffix)")
                    testNavigationListItem(
                        theme: theme,
                        interfaceStyle: interfaceStyle,
                        style: .card(.outlined),
                        alignment: .center,
                        size: .standard,
                        rounded: false,
                        data: data,
                        leading: nil,
                        trailing: trailing,
                        name: "navigation_outlined_center_standard_\(textCase.rawValue)_Trailing_\(trailingName)\(boldSuffix)")
                }
            }
        }
    }

    // MARK: - Private helpers

    // swiftlint:disable function_parameter_count
    @MainActor private func testListItem(
        theme: OUDSTheme,
        interfaceStyle: UIUserInterfaceStyle,
        style: OUDSListItemContentStyle,
        alignment: OUDSListItemContainersAlignment,
        size: OUDSListItemSize,
        rounded: Bool,
        data: OUDSListItemData,
        leading: OUDSListItemLeading?,
        trailing: OUDSListItemTrailing?,
        name: String)
    {
        let colorScheme: ColorScheme = interfaceStyle == .light ? .light : .dark
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSStaticListItem(data: data, leading: leading, trailing: trailing)
                .oudsListItemStyle(style)
                .oudsListItemContainerAlignment(alignment)
                .oudsListItemSize(size)
                .oudsListItemRoundedMedia(rounded)
                .background(theme.colors.bgPrimary.color(for: colorScheme))
        }
        let testName = "testListItem_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    @MainActor private func testNavigationListItem(
        theme: OUDSTheme,
        interfaceStyle: UIUserInterfaceStyle,
        style: OUDSListItemContentStyle,
        alignment: OUDSListItemContainersAlignment,
        size: OUDSListItemSize,
        rounded: Bool,
        data: OUDSListItemData,
        leading: OUDSListItemLeading?,
        trailing: OUDSListItemTrailing?,
        name: String)
    {
        let colorScheme: ColorScheme = interfaceStyle == .light ? .light : .dark
        let illustration = OUDSThemeableView(theme: theme) {
            OUDSNavigationListItem(data: data, indicatorType: .next, leading: leading, trailing: trailing)
                .oudsListItemStyle(style)
                .oudsListItemContainerAlignment(alignment)
                .oudsListItemSize(size)
                .oudsListItemRoundedMedia(rounded)
                .background(theme.colors.bgPrimary.color(for: colorScheme))
        }
        let testName = "testListItem_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }
    // swiftlint:enable function_parameter_count
}

// swiftlint:enable type_body_length
// swiftlint:enable required_deinit
