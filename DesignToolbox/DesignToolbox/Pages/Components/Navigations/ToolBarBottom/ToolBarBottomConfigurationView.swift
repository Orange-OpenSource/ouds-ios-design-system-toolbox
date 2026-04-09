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

// MARK: - ToolBarBottom Configuration Model

/// The model shared between `ToolBarBottomPageConfiguration` view and `ToolBarBottomPageComponent` view.
final class ToolBarBottomConfigurationModel: ToolBarConfigurationModel {

    // MARK: Properties
    @Published var groupedItems: Bool {
        didSet { updateCode() }
    }

    @Published var showDemo: Bool = false

    // MARK: Initializer

    override init() {
        groupedItems = false

        super.init()

        leading = .icon
        numberOfLeading = 1
        isLeadingEnabled = true
        isLeadingEmphasized = false

        trailing = .label
        numberOfTrailing = 1
        isTrailingEnabled = true
        isTrailingEmphasized = false

        ios26ButtonStyle = .default
    }

    deinit {}

    // MARK: Component configuration

    private var items: String {
        if groupedItems {
            return "groupedItem: \(leadingItemsPattern)"
        } else {
            let leading = leadingItemsPattern.isEmpty ? "" :
                """
                , leadingItems: {
                  \(leadingItemsPattern)
                }
                """
            let trailing = leadingItemsPattern.isEmpty ? "" :
                """
                , trailingItems: {
                   \(trailingItemPattern)
                }
                """
            return "\(leading)\(trailing)"
        }
    }

    override func updateCode() {
        code = """
        SomeView()
        .oudsToolBarBottom(\(items))
        """
    }
}

// MARK: - ToolBarBottom Configuration View

struct ToolBarBottomConfiguration: View {

    // MARK: Stored properties

    @StateObject var configurationModel: ToolBarBottomConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                OUDSSwitchItem("Grouped Items", isOn: $configurationModel.groupedItems)

                ToolBarLeadingConfiguration(configurationModel: configurationModel)

                if !configurationModel.groupedItems {
                    ToolBarTrailingConfiguration(configurationModel: configurationModel)
                }

                ToolBarItemStyle(configurationModel: configurationModel)
            }
        }
    }
}
