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

struct DesignToolboxEditContentDisclosure<Content>: View where Content: View {

    // MARK: - Properties

    private let title: String
    @ViewBuilder private let content: () -> Content
    @State private var isContentVisible = false

    @Environment(\.theme) private var theme

    // MARK: - Initializer

    init(_ title: String = "app_components_common_editContent_label",
         isContentVisible: Bool = false,
         @ViewBuilder content: @escaping () -> Content)
    {
        self.title = title.localized()
        self.isContentVisible = isContentVisible
        self.content = content
    }

    // MARK: - Body

    var body: some View {
        DesignToolboxDisclosureGroup(isExpanded: $isContentVisible, accessibilityLabel: "", content: content) {
            OUDSHeading(text: title, size: .small)
                .foregroundStyle(theme.colors.contentDefault)
                .accessibilityAddTraits([.isButton])
        }
        .padding(.horizontal, theme.spaces.fixedMedium)
    }
}
