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

// swiftlint:disable accessibility_label_for_image

struct TagView: View {

    @State private var isSelected: Bool = true

    @Environment(\.theme) private var theme

    var body: some View {
        WatchAndTVLayoutsView(title: "Tag") {
            watchOSLayout
        } tvLayout: {
            tvOSLayout
        }
    }

    // MARK: - watchOS

    private var watchOSLayout: some View {
        WatchVerticalLayout {
            ForEach(Self.kAllTagStatus.indices, id: \.self) { statusIndex in
                Text("Status " + Self.description(for: statusIndex)).font(.headline)
                let status = Self.kAllTagStatus[statusIndex]
                ForEach(Self.kAllBadgeSizes, id: \.self) { size in
                    Text("Size \(String(describing: size))").font(.subheadline)
                    ForEach(Self.kAllTagShapes, id: \.self) { shape in
                        Text("Shape \(String(describing: shape))").font(.callout)
                        ForEach(Self.kAllTagAppearances, id: \.self) { appearance in
                            OUDSTag(label: "Tag",
                                    status: status,
                                    appearance: appearance,
                                    shape: shape,
                                    size: size,
                                    hasLoader: false)

                            OUDSTag(label: "Tag",
                                    status: status,
                                    appearance: appearance,
                                    shape: shape,
                                    size: size,
                                    hasLoader: true)
                        }
                    }
                }
            }
        }
    }

    // MARK: - tvOS

    private var tvOSLayout: some View {
        LazyVStack(spacing: theme.spaces.paddingBlock4xlarge) {
            ForEach(Self.kAllTagStatus.indices, id: \.self) { statusIndex in
                let status = Self.kAllTagStatus[statusIndex]

                VStack(spacing: theme.spaces.scaledMediumMobile) {
                    Text("Status " + Self.description(for: statusIndex))
                        .font(.title2)
                        .fontWeight(.bold)

                    VStack(spacing: theme.spaces.scaledMediumMobile) {
                        ForEach(Self.kAllBadgeSizes, id: \.self) { size in
                            HStack(spacing: theme.spaces.scaledMediumMobile) {
                                ForEach(Self.kAllTagShapes, id: \.self) { shape in
                                    ForEach(Self.kAllTagAppearances, id: \.self) { appearance in
                                        tagSection(
                                            title: "\(String(describing: size)) • \(String(describing: shape)) • \(String(describing: appearance))",
                                            status: status,
                                            appearance: appearance,
                                            shape: shape,
                                            size: size)
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                }
                .padding()
                .focusable()
            }
        }
        .padding()
    }

    // MARK: - Helpers

    @ViewBuilder
    private func tagSection(
        title: String,
        status: OUDSTag.Status,
        appearance: OUDSTag.Appearance,
        shape: OUDSTag.Shape,
        size: OUDSTag.Size) -> some View
    {
        VStack(spacing: theme.spaces.scaledSmallMobile) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            VStack(spacing: theme.spaces.scaledXsmallMobile) {
                OUDSTag(label: "Tag",
                        status: status,
                        appearance: appearance,
                        shape: shape,
                        size: size,
                        hasLoader: false)

                OUDSTag(label: "Tag",
                        status: status,
                        appearance: appearance,
                        shape: shape,
                        size: size,
                        hasLoader: true)
            }
        }
        .padding(theme.spaces.scaledSmallMobile)
        .frame(maxWidth: .infinity)
    }

    private static func description(for statusIndex: Int) -> String {
        if statusIndex <= 2 {
            return "positive"
        }
        if statusIndex <= 5 {
            return "negative"
        }
        if statusIndex <= 8 {
            return "warning"
        }
        if statusIndex <= 11 {
            return "info"
        }
        if statusIndex <= 14 {
            return "neutral"
        }
        if statusIndex <= 17 {
            return "accent"
        }
        return ""
    }

    private static let kAllTagAppearances: [OUDSTag.Appearance] = [.emphasized, .muted]
    private static let kAllTagShapes: [OUDSTag.Shape] = [.rounded, .square]
    private static let kAllBadgeSizes: [OUDSTag.Size] = [.default, .small]
    private static let kAllTagStatus: [OUDSTag.Status] = [
        OUDSTag.Status.positive(leading: .bullet),
        OUDSTag.Status.positive(leading: .icon),
        OUDSTag.Status.positive(leading: .none),
        OUDSTag.Status.negative(leading: .bullet),
        OUDSTag.Status.negative(leading: .icon),
        OUDSTag.Status.negative(leading: .none),
        OUDSTag.Status.warning(leading: .bullet),
        OUDSTag.Status.warning(leading: .icon),
        OUDSTag.Status.warning(leading: .none),
        OUDSTag.Status.info(leading: .bullet),
        OUDSTag.Status.info(leading: .icon),
        OUDSTag.Status.info(leading: .none),
        OUDSTag.Status.neutral(bullet: false),
        OUDSTag.Status.neutral(bullet: true),
        OUDSTag.Status.neutral(icon: Image(systemName: "sun.min.fill")),
        OUDSTag.Status.accent(bullet: false),
        OUDSTag.Status.accent(bullet: true),
        OUDSTag.Status.accent(icon: Image(systemName: "sun.min.fill")),
    ]
}

// swiftlint:enable accessibility_label_for_image
