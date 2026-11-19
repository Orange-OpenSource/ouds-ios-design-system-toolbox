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

// MARK: - Card Configuration Model

/// The model shared between `CardPageConfiguration` view and `CardPage` views.
class CardConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var style: CardStyle {
        didSet { updateCode() }
    }

    @Published var hasDivider: Bool {
        didSet { updateCode() }
    }

    @Published var useDefaultBackground: Bool {
        didSet { updateCode() }
    }

    @Published var showSkeleton: Bool {
        didSet { updateCode() }
    }

    @Published var contentExample: ContentExample {
        didSet { updateCode() }
    }

    // MARK: - Computed properties

    // MARK: Initializer

    override init() {
        enabled = true
        showSkeleton = false
        style = .outlined
        hasDivider = true
        useDefaultBackground = true
        contentExample = .simple

        super.init()
    }

    deinit {}

    var cardStyle: OUDSCardStyle {
        switch style {
        case .filled:
            .filled(divider: hasDivider, useDefaultBackground: useDefaultBackground)
        case .outlined:
            .outlined
        case .elevated:
            .elevated(useDefaultBackground: useDefaultBackground)
        }
    }

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        OUDSCard(\(stylePattern)) {
             CardContent()
        }
        \(disabledPattern)
        \(skeletonPattern)
        """
    }

    var stylePattern: String {
        switch style {
        case .filled:
            "style: .filled(divider: \(hasDivider), useDefaultBackground: \(useDefaultBackground)"
        case .outlined:
            "style: .outlined"
        case .elevated:
            "style: .elevated(useDefaultBackground: \(useDefaultBackground)"
        }
    }

    var disabledPattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    var skeletonPattern: String {
        showSkeleton ? ".showSkeleton(isVisible: true)" : ""
    }
}

// MARK: - Card Configuration View

struct CardConfigurationView: View {

    @StateObject var configurationModel: CardConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSSwitchItem("app_components_common_skeleton_tech", isOn: $configurationModel.showSkeleton)

                OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

                OUDSChipPicker(title: "app_components_common_style_tech",
                               selection: $configurationModel.style,
                               chips: CardStyle.chips)

                if configurationModel.style == .filled {
                    OUDSSwitchItem("app_components_divider_tech", isOn: $configurationModel.hasDivider)
                }

                if configurationModel.style == .filled || configurationModel.style == .elevated {
                    OUDSSwitchItem("app_components_common_background_tech", isOn: $configurationModel.useDefaultBackground)
                }

                OUDSChipPicker(title: "app_components_common_content_example_tech",
                               selection: $configurationModel.contentExample,
                               chips: ContentExample.chips)
            }
        }
    }
}

enum CardStyle: DesignToolboxEnumRepresentable {
    case filled, outlined, elevated
}

enum ContentExample: DesignToolboxEnumRepresentable {
    case simple, useCase
}
