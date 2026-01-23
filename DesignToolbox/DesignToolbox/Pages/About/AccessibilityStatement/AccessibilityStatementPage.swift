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

// NOTE: Seen as unused but are used
// This is a false positive in Periphy
// See https://github.com/peripheryapp/periphery/issues/908

#if os(iOS)
import DeclarationAccessibility
import OUDSSwiftUI
import SwiftUI

struct AccessibilityStatementPage: View {

    let detailsPageURL: URL
    @Environment(\.theme) var theme

    init() {
        guard let detailsPageURL = Bundle.main.url(forResource: "accessibility_detail", withExtension: "html") else {
            OL.fatal("Unable to find accessibility_detail.html in resources")
        }

        self.detailsPageURL = detailsPageURL
    }

    var body: some View {
        VStack {
            StatementView(xmlFile: "accessibility_result", localUrl: detailsPageURL.absoluteString, theme: theme)
        }
    }
}
#endif
