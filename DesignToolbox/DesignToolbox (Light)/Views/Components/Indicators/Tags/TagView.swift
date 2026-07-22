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

    private static let allTagAppearances: [OUDSTag.Appearance] = [.emphasized, .muted]
    private static let allTagShapes: [OUDSTag.Shape] = [.rounded, .square]
    private static let allBadgeSizes: [OUDSTag.Size] = [.default, .small]
    private static let allTagStatus: [OUDSTag.Status] = [
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
        OUDSTag.Status.neutral(image: OUDSImage(asset: Image(systemName: "sun.min.fill"))),
        OUDSTag.Status.accent(bullet: false),
        OUDSTag.Status.accent(bullet: true),
        OUDSTag.Status.accent(image: OUDSImage(asset: Image(systemName: "sun.min.fill"))),
    ]

    @State private var isSelected: Bool = true

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Tag") {
            watchOSLayout
        }
    }

    private var watchOSLayout: some View {
        WatchVerticalLayout {
            ForEach(Self.allTagStatus.indices, id: \.self) { statusIndex in
                Text("Status " + Self.description(for: statusIndex)).font(.headline)
                let status = Self.allTagStatus[statusIndex]
                ForEach(Self.allBadgeSizes, id: \.self) { size in
                    Text("Size \(String(describing: size))").font(.subheadline)
                    ForEach(Self.allTagShapes, id: \.self) { shape in
                        Text("Shape \(String(describing: shape))").font(.callout)
                        ForEach(Self.allTagAppearances, id: \.self) { appearance in
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
}

// swiftlint:enable accessibility_label_for_image
