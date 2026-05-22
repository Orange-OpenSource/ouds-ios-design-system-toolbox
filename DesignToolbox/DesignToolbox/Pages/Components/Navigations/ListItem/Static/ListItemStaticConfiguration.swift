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

// MARK: - ListItem Configuration Model

final class ListItemStaticConfigurationModel: ListItemConfigurationModel {

    // MARK: - Code generation

    override func updateCode() {
        code = """
               let data = \(dataPattern)

               OUDSListItem(data: data)
               \(styleModifierPettern)
               \(sizeModifierPattern)
               """
    }

    private var dataPattern: String {
        "OUDSListItemData(\(labelPattern)\(isBoldLabelPattern)\(descriptionPattern)\(overlinePattern)\(extraLabelPattern)\(helperTextPattern))"
    }
}

// MARK: - ListItem Configuration

struct ListItemStaticConfiguration: View {

    @ObservedObject var configurationModel: ListItemStaticConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                ListItemCommonConfiguration(configurationModel: configurationModel)
            }

            ListItemTextsConfiguration(configurationModel: configurationModel)
        }
    }
}
