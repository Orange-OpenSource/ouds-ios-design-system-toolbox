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

// swiftlint:disable closure_body_length

struct BulletListsView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Bullet List",
                              layout: { watchOSVerticalLayout })
    }

    private var watchOSVerticalLayout: some View {
        WatchVerticalLayout {
            Text("Bare").font(.headline)

            Text("Body Large").font(.subheadline)
            OUDSBulletList(type: .bare) {
                OUDSBulletList.Item("Label") {
                    OUDSBulletList.Item("Label") {
                        OUDSBulletList.Item("Label")
                    }
                }
            }

            Text("Body Medium").font(.subheadline)
            OUDSBulletList(type: .bare, textStyle: .bodyMedium) {
                OUDSBulletList.Item("Label") {
                    OUDSBulletList.Item("Label") {
                        OUDSBulletList.Item("Label")
                    }
                }
            }

            Text("Ordered").font(.headline)

            Text("Body Large").font(.subheadline)
            OUDSBulletList(type: .ordered) {
                OUDSBulletList.Item("Label") {
                    OUDSBulletList.Item("Label") {
                        OUDSBulletList.Item("Label")
                    }
                }
            }

            Text("Body Medium").font(.subheadline)
            OUDSBulletList(type: .ordered, textStyle: .bodyMedium) {
                OUDSBulletList.Item("Label") {
                    OUDSBulletList.Item("Label") {
                        OUDSBulletList.Item("Label")
                    }
                }
            }

            Text("Unordered (bullet)").font(.headline)

            Text("Body Large").font(.subheadline)
            OUDSBulletList {
                OUDSBulletList.Item("Label") {
                    OUDSBulletList.Item("Label") {
                        OUDSBulletList.Item("Label")
                    }
                }
            }

            Text("Body Medium").font(.subheadline)
            OUDSBulletList(textStyle: .bodyMedium) {
                OUDSBulletList.Item("Label") {
                    OUDSBulletList.Item("Label") {
                        OUDSBulletList.Item("Label")
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func bulletListSection(title: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(spacing: theme.spaces.paddingBlockMedium) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            VStack(spacing: theme.spaces.paddingBlockXsmall) {
                content()
            }
        }
        .padding()
    }
}

// swiftlint:enable closure_body_length
