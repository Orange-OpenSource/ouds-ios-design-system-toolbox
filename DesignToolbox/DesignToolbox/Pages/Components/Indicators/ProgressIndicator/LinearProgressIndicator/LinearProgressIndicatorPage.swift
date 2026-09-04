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

import OUDSComponents
import OUDSSwiftUI
import SwiftUI

// MARK: - Linear Progress Indicator Page

struct LinearProgressIndicatorPage: View {

    @StateObject private var configurationModel: LinearProgressIndicatorConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: LinearProgressIndicatorConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            LinearProgressIndicatorDemo(configurationModel: configurationModel)
        } configurationView: {
            LinearProgressIndicatorConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Linear Progress Indicator Demo

struct LinearProgressIndicatorDemo: View {

    @StateObject var configurationModel: LinearProgressIndicatorConfigurationModel

    var body: some View {
        Group {
            switch configurationModel.variant {
            case .determinate:
                OUDSLinearProgressIndicator(progress: configurationModel.progress,
                                            status: configurationModel.status,
                                            track: configurationModel.track,
                                            stopIndicator: configurationModel.stopIndicator,
                                            helperText: configurationModel.determinateHelperTextValue,
                                            gapSize: configurationModel.gapSize,
                                            animated: configurationModel.animated,
                                            accessibility: configurationModel.accessibilityConfiguration)
            case .indeterminate:
                OUDSLinearProgressIndicator(status: configurationModel.status,
                                            track: configurationModel.track,
                                            helperText: configurationModel.helperTextValue,
                                            helperTextAlignment: configurationModel.helperTextAlignment,
                                            gapSize: configurationModel.gapSize,
                                            accessibility: configurationModel.accessibilityConfiguration)
            }
        }
    }
}
