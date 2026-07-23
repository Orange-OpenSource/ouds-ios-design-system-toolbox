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

struct NavigationListItemView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Navigation List Item",
                              layout: { watchOSLayout })
    }

    // MARK: - watchOS

    private var watchOSLayout: some View {
        WatchVerticalLayout {
            Text("Label only").font(.headline)

            OUDSNavigationListItem(data: OUDSListItemData(label: "Label"))

            Text("More textual").font(.headline)

            let data = OUDSListItemData(
                label: "Label",
                description: "Description",
                overline: "Overline",
                extraLabel: "Extra Label")
            OUDSNavigationListItem(data: data, indicatorType: .external)

            Text("Leading icon, trailing badge").font(.headline)

            let icon = OUDSListItemIcon(type: .info, size: .medium)
            let badge = OUDSBadgeCount(3, accessibilityLabel: "3 notifications", status: .negative, size: .medium)

            OUDSNavigationListItem(
                data: OUDSListItemData(label: "Label"),
                indicatorType: .next,
                leading: .icon(icon),
                trailing: .badge(.count(badge)))

            Text("Leading avatar, trailing text").font(.headline)

            let avatar = OUDSListItemAvatar(type: .icon, size: .medium)

            OUDSNavigationListItem(
                data: OUDSListItemData(label: "Label", description: "Description"),
                indicatorType: .previous,
                leading: .avatar(avatar),
                trailing: .text(.label("Info")))
        }
    }
}
