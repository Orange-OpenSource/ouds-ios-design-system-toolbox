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

// MARK: - ActionCard Configuration Model

/// The model shared between `ActionCardPageConfiguration` view and `ActionCardPageComponent` view.
final class ActionCardConfigurationModel: CardConfigurationModel {

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

    @Published var hasBackground: Bool {
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
        hasBackground = true
        contentExample = .simple

        super.init()
    }

    deinit {}

    var cardStyle: OUDSCardStyle {
        switch style {
        case .filled:
            .filled(divider: hasDivider, useDefaultBackground: hasBackground)
        case .outlined:
            .outlined
        case .elevated:
            .elevated(useDefaultBackground: hasBackground)
        }
    }

    // MARK: Component Configuration

    override func updateCode() {
        code = "OUDSCard(\(stylePattern)\(backgroundPattern)"
    }

    private var stylePattern: String {
        switch style {
        case .filled:
            "style: .filled(divider: \(hasDivider)"
        case .outlined:
            "style: .outlined"
        case .elevated:
            "style: .elevated"
        }
    }

    private var backgroundPattern: String {
        ", background: \(hasBackground)"
    }
}

// MARK: - Card Configuration View

struct ActionCardConfigurationView: View {

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
                    OUDSSwitchItem("app_components_common_background_tech", isOn: $configurationModel.hasBackground)
                }

                OUDSChipPicker(title: "app_components_common_content_example_tech",
                               selection: $configurationModel.contentExample,
                               chips: ContentExample.chips)
            }
        }
    }
}
