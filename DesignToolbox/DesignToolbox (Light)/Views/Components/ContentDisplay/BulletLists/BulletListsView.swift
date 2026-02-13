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
        WatchAndTVLayoutsView(title: "Bullet List",
                              watchLayout: { watchOSVerticalLayout },
                              tvLayout: { tvOSGridLayout })
    }

    // MARK: - watchOS

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

    // MARK: - tvOS

    private var tvOSGridLayout: some View {
        TVGridLayout(count: 3) {

            // Column n°1: bare list
            VStack(spacing: theme.spaces.paddingBlockLarge) {
                Text("Bare").font(.headline)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                bulletListSection(title: "Body Large") {
                    OUDSBulletList(type: .bare) {
                        OUDSBulletList.Item("Label") {
                            OUDSBulletList.Item("Label") {
                                OUDSBulletList.Item("Label")
                            }
                        }
                    }
                }

                bulletListSection(title: "Body Medium") {
                    OUDSBulletList(type: .bare, textStyle: .bodyMedium) {
                        OUDSBulletList.Item("Label") {
                            OUDSBulletList.Item("Label") {
                                OUDSBulletList.Item("Label")
                            }
                        }
                    }
                }
            }
            .padding()

            // Column n°2: ordered list
            VStack(spacing: theme.spaces.paddingBlockLarge) {
                Text("Ordered").font(.headline)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                bulletListSection(title: "Body Large") {
                    OUDSBulletList(type: .ordered) {
                        OUDSBulletList.Item("Label") {
                            OUDSBulletList.Item("Label") {
                                OUDSBulletList.Item("Label")
                            }
                        }
                    }
                }

                bulletListSection(title: "Body Medium") {
                    OUDSBulletList(type: .ordered, textStyle: .bodyMedium) {
                        OUDSBulletList.Item("Label") {
                            OUDSBulletList.Item("Label") {
                                OUDSBulletList.Item("Label")
                            }
                        }
                    }
                }
            }
            .padding()

            // Column n°3: unordered list
            VStack(spacing: theme.spaces.paddingBlockLarge) {
                Text("Unordered").font(.headline)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, theme.spaces.paddingBlockSmall)

                bulletListSection(title: "Body Large") {
                    OUDSBulletList {
                        OUDSBulletList.Item("Label") {
                            OUDSBulletList.Item("Label") {
                                OUDSBulletList.Item("Label")
                            }
                        }
                    }
                }

                bulletListSection(title: "Body Medium") {
                    OUDSBulletList(textStyle: .bodyMedium) {
                        OUDSBulletList.Item("Label") {
                            OUDSBulletList.Item("Label") {
                                OUDSBulletList.Item("Label")
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .padding()
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
