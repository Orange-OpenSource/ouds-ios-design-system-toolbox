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

import SwiftUI

/// A `Text` view with a contenu menu allowing user to copy in clipboard some content.
/// Useful for example to allow users to copy some build details or long values.
struct DesignToolboxCopyableText: View {

    let title: String
    let copyable: String

    init(_ title: String, _ copyable: String) {
        self.title = title
        self.copyable = copyable
    }

    var body: some View {
        Text(title)
            .contextMenu {
                Button(action: {
                    UIPasteboard.general.string = copyable
                }, label: {
                    Text("app_common_copy")
                    Image(systemName: "doc.on.doc").accessibilityHidden(true)
                })
            }
    }
}
