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

import OUDS
import OUDSTokensSemantic
import SwiftUI
import OUDSComponents

struct DesignToolboxTextField: View {

    @Environment(\.theme) private var theme

    let text: Binding<String>
    let prompt: String
    let label: String

    init(text: Binding<String>, prompt: String = "app_components_common_enterText_prompt", label: String) {
        self.label = label.localized()
        self.text = text
        self.prompt = prompt.localized()
    }

    var body: some View {
            OUDSTextInput(label: label, text: text, placeholder: prompt, trailingAction: deleteAction)
            .accessibilityIdentifier(A11YIdentifiers.configurationTextField)
    }
    
    private var deleteAction: OUDSTextInput.TrailingAction? {
        guard !text.wrappedValue.isEmpty else {
            return nil
        }
        
        return .init(icon: Image("ic_delete", bundle: theme.resourcesBundle), actionHint: "") {
            text.wrappedValue = ""
        }
    }
}
