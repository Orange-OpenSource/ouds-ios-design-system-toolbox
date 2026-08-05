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

// swiftlint:disable type_name

// MARK: - Assistant Circular Progress Indicator Configuration Model

final class AssistantCircularProgressIndicatorConfigurationModel: ComponentConfiguration {

    // MARK: Initializer

    override init() {
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        OUDSAssistantCircularProgressIndicator()\(coloredSurfacePattern)
        """
    }

    private var coloredSurfacePattern: String {
        onColoredSurface ? "\n    .coloredSurface(theme.colorModes.onBrandPrimary)" : ""
    }
}

// MARK: - Assistant Circular Progress Indicator Configuration View

struct AssistantCircularProgressIndicatorConfigurationView: View {

    // MARK: Properties

    @StateObject var configurationModel: AssistantCircularProgressIndicatorConfigurationModel

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            OUDSSwitchItem("app_components_common_onColoredSurface_tech",
                           isOn: $configurationModel.onColoredSurface)
        }
    }
}

// swiftlint:enable type_name
