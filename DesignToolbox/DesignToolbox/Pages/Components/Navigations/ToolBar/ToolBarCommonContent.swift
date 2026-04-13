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

// swiftlint:disable line_length

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

                Text("""
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.

                Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.

                Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
                """)
                .labelDefaultLarge(theme)
                .gridMargin(.horizontal)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 20)
        }
    }
}

// swiftlint:enable line_length
