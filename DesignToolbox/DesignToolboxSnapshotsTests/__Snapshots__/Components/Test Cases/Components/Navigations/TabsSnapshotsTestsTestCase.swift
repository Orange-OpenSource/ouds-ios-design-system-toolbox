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
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

/// Shared coverage for both justified variants. Four-cell grids cover interaction,
/// reading direction and trailing indicators without multiplying reference images.
open class TabsSnapshotsTestsTestCase: XCTestCase {
    @MainActor func testTabs(theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let layouts: [OUDSTabsLayout] = [.textOnly, .textAndLeadingAsset, .textAndTopAsset, .assetOnly]
        for contained in [false, true] {
            for (layoutIndex, layout) in layouts.enumerated() {
                let cells = (0 ..< 4).map { index in
                    let disabled = index >= 2
                    let rtl = index % 2 == 1
                    return SnapshotGridCell(caption: "\(disabled ? "Disabled" : "Enabled") / \(rtl ? "RTL" : "LTR") / indicator \(index)") {
                        AnyView(self.tabs(contained: contained, layout: layout, indicator: index, strong: !rtl)
                            .disabled(disabled)
                            .environment(\.layoutDirection, rtl ? .rightToLeft : .leftToRight))
                    }
                }
                assertGrid(cells, name: "\(contained ? "Contained" : "Line")_Layout\(layoutIndex)", theme: theme, interfaceStyle: interfaceStyle)
            }
            let cells = (0 ..< 4).map { index in
                SnapshotGridCell(caption: ["Grid", "Centered / no divider", "Sticky", "Skeleton"][index]) {
                    AnyView(self.tabs(
                        contained: contained,
                        layout: .textOnly,
                        indicator: 2,
                        gridMargin: index != 1,
                        divider: index != 1,
                        sticky: index == 2)
                        .showSkeleton(isVisible: index == 3))
                }
            }
            assertGrid(cells, name: "\(contained ? "Contained" : "Line")_Container", theme: theme, interfaceStyle: interfaceStyle)
        }
    }

    @MainActor private func assertGrid(_ cells: [SnapshotGridCell<AnyView>], name: String, theme: OUDSTheme, interfaceStyle: UIUserInterfaceStyle) {
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let illustration = OUDSThemeableView(theme: theme) {
            SnapshotGrid(columns: 2, cellSize: CGSize(width: 390, height: 220), cells: cells, title: "\(testName).\(name)")
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }
        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    @MainActor @ViewBuilder private func tabs(
        contained: Bool,
        layout: OUDSTabsLayout,
        indicator: Int,
        strong: Bool = true,
        gridMargin: Bool = true,
        divider: Bool = true,
        sticky: Bool = false) -> some View
    {
        let trailing: OUDSTabItemTrailing? = switch indicator {
        case 1:
            .badge(.standard(accessibilityLabel: "New", status: .negative))
        case 2:
            .badge(.count(3, accessibilityLabel: "3 notifications", status: .negative))
        case 3:
            .tag(OUDSTag(label: "New", size: .small))
        default:
            nil
        }
        let image = layout == .textOnly ? nil : OUDSImage(asset: Image(decorative: "ic_heart"))
        let items = [
            OUDSTabItem(
                tag: 0,
                label: .rich(AttributedString.from(text: "Tab 1", foregroundColor: .blue)),
                description: layout == .assetOnly ? nil : "Description",
                image: image,
                trailing: trailing),
            OUDSTabItem(tag: 1, label: "Tab 2", image: image),
            OUDSTabItem(tag: 2, label: "Tab 3", image: image, isEnabled: false),
        ]
        if contained {
            OUDSContainedTabs(
                selection: .constant(0),
                layout: layout,
                hasDivider: divider,
                hasStrongLabel: strong,
                hasGridMargin: gridMargin,
                hasStickyBackground: sticky)
            {
                items
            }
        } else {
            OUDSLineTabs(
                selection: .constant(0),
                layout: layout,
                hasDivider: divider,
                hasStrongLabel: strong,
                hasGridMargin: gridMargin,
                hasStickyBackground: sticky)
            {
                items
            }
        }
    }
}

// swiftlint:enable required_deinit
