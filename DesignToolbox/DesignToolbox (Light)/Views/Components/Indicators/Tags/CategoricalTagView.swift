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

struct CategoricalTagView: View {

    var body: some View {
        WatchScrollLayoutView(layout: { WatchVerticalLayout { layout } })
    }

    @ViewBuilder
    private var layout: some View {
        Text("Category 1").font(.headline)
        tags(with: "One", category: .category1)

        Text("Category 2").font(.headline)
        tags(with: "Two", category: .category2)

        Text("Category 3").font(.headline)
        tags(with: "Three", category: .category3)

        Text("Category 4").font(.headline)
        tags(with: "Four", category: .category4)

        Text("Category 5").font(.headline)
        tags(with: "Five", category: .category5)
    }

    // swiftlint:disable accessibility_label_for_image
    @ViewBuilder
    private func tags(with label: String, category: OUDSCategoricalTag.Category) -> some View {
        Text("None").font(.subheadline)
        OUDSCategoricalTag(label: label, category: category, leading: .none, shape: .rounded, size: .default)
        OUDSCategoricalTag(label: label, category: category, leading: .none, shape: .rounded, size: .small)
        OUDSCategoricalTag(label: label, category: category, leading: .none, shape: .square, size: .default)
        OUDSCategoricalTag(label: label, category: category, leading: .none, shape: .square, size: .small)

        Text("Bullet").font(.subheadline)
        OUDSCategoricalTag(label: label, category: category, leading: .bullet, shape: .rounded, size: .default)
        OUDSCategoricalTag(label: label, category: category, leading: .bullet, shape: .rounded, size: .small)
        OUDSCategoricalTag(label: label, category: category, leading: .bullet, shape: .square, size: .default)
        OUDSCategoricalTag(label: label, category: category, leading: .bullet, shape: .square, size: .small)

        Text("Image").font(.subheadline)
        OUDSCategoricalTag(label: label, category: category, leading: .icon(OUDSImage(asset: Image(systemName: "sun.min.fill"))), shape: .rounded, size: .default)
        OUDSCategoricalTag(label: label, category: category, leading: .icon(OUDSImage(asset: Image(systemName: "sun.min.fill"))), shape: .rounded, size: .small)
        OUDSCategoricalTag(label: label, category: category, leading: .icon(OUDSImage(asset: Image(systemName: "sun.min.fill"))), shape: .square, size: .default)
        OUDSCategoricalTag(label: label, category: category, leading: .icon(OUDSImage(asset: Image(systemName: "sun.min.fill"))), shape: .square, size: .small)
    }
    // swiftlint:enable accessibility_label_for_image
}
