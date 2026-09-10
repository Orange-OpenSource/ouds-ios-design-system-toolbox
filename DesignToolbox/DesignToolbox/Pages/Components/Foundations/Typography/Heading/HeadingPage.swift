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

// MARK: Heading Page

struct HeadingPage: View {

    @StateObject private var configurationModel: HeadingConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: HeadingConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            HeadingDemo(configurationModel: configurationModel)
        } configurationView: {
            HeadingConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Heading Demo

private struct HeadingDemo: View {

    @StateObject var configurationModel: HeadingConfigurationModel

    var body: some View {
        if configurationModel.hasColoredSubstring {
            OUDSHeading(text: configurationModel.text, coloredText: configurationModel.coloredText)
        } else {
            OUDSHeading(text: configurationModel.text, size: configurationModel.size, hasMarker: configurationModel.hasMarker)
        }
    }
}
