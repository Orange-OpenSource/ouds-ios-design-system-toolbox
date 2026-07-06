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
struct InlineAlertMessageView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchAndTVLayoutsView(title: "Inline Alert",
                              watchLayout: { watchVerticalLayout },
                              tvLayout: { tvVerticalLayout })
    }

    private var watchVerticalLayout: some View {
        WatchVerticalLayout {
            OUDSInlineAlert(label: "This is a neutral alert", status: .neutral())
            OUDSInlineAlert(label: "This is also a neutral alert", status: .neutral(image: OUDSImage(asset: Image(systemName: "figure.handball"))))
            OUDSInlineAlert(label: "This is an accent alert", status: .accent())
            OUDSInlineAlert(label: "This is also a accent alert", status: .neutral(image: OUDSImage(asset: Image(systemName: "figure.handball"))))
            OUDSInlineAlert(label: "This is a positive alert", status: .positive)
            OUDSInlineAlert(label: "This is a info alert", status: .info)
            OUDSInlineAlert(label: "This is a warning alert", status: .warning)
            OUDSInlineAlert(label: "This is a negative alert", status: .negative)
        }
    }

    private var tvVerticalLayout: some View {
        TVVerticalLayout {
            OUDSInlineAlert(label: "This is a neutral alert", status: .neutral())
            OUDSInlineAlert(label: "This is also a neutral alert", status: .neutral(image: OUDSImage(asset: Image(systemName: "figure.handball"))))
            OUDSInlineAlert(label: "This is an accent alert", status: .accent())
            OUDSInlineAlert(label: "This is also a accent alert", status: .neutral(image: OUDSImage(asset: Image(systemName: "figure.handball"))))
            OUDSInlineAlert(label: "This is a positive alert", status: .positive)
            OUDSInlineAlert(label: "This is a info alert", status: .info)
            OUDSInlineAlert(label: "This is a warning alert", status: .warning)
            OUDSInlineAlert(label: "This is a negative alert", status: .negative)
        }
    }
}

// swiftlint:enable accessibility_label_for_image
