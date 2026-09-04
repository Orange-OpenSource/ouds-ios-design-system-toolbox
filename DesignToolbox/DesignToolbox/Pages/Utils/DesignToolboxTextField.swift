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

struct DesignToolboxTextField: View {

    let text: Binding<String>
    let prompt: String
    let label: String

    @Environment(\.theme) private var theme

    init(text: Binding<String>, label: String, prompt: String = "app_components_common_enterText_prompt") {
        self.label = label.localized()
        self.text = text
        self.prompt = prompt.localized()
    }

    var body: some View {
        #if os(tvOS)
        // `OUDSTextInput` is not shipped on tvOS. Fall back to the native SwiftUI
        // `TextField`, which triggers the full-screen tvOS keyboard on focus.
        VStack(alignment: .leading, spacing: 4) {
            Text(label).font(.subheadline)
            TextField(prompt, text: text)
                .textFieldStyle(.plain)
                .accessibilityIdentifier(A11YIdentifiers.configurationTextField)
        }
        #else
        OUDSTextInput(label: label, text: text, placeholder: prompt, trailingAction: deleteAction)
            .accessibilityIdentifier(A11YIdentifiers.configurationTextField)
        #endif
    }

    #if !os(tvOS)
    private var deleteAction: OUDSTextInput.TrailingAction? {
        guard !text.wrappedValue.isEmpty else {
            return nil
        }

        return .init(image: OUDSImage(asset: Image(decorative: "Component-tag-close", bundle: theme.resourcesBundle)),
                     actionHint: "app_components_common_textInputClearIcon_a11y")
        {
            text.wrappedValue = ""
        }
    }
    #endif
}
