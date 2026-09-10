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

#if !os(tvOS)

import OUDSSwiftUI
import SwiftUI

/// A `View` with a very long text block
struct ToolBarCommonContentView: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.presentationMode) private var presentationMode

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: theme.spaces.fixedLarge) {
                let link = OUDSAlertMessage.Link(text: "app_components_toolbar_demo_backToConfiguration_label",
                                                 position: .bottom)
                {
                    presentationMode.wrappedValue.dismiss()
                }

                OUDSAlertMessage(label: "app_components_toolbar_demo_content_label".localized(),
                                 status: .warning,
                                 link: link)

                OUDSLabel("app_common_loremIpsum_tech", size: .large, weight: .default)
                    .gridMargin(.horizontal)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 20)
        }
    }
}

#endif
