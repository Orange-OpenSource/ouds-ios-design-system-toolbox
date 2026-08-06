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

// MARK: - Circular Progress Indicator Page

struct CircularProgressIndicatorPage: View {

    @StateObject private var configurationModel: CircularProgressIndicatorConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CircularProgressIndicatorConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CircularProgressIndicatorDemo(configurationModel: configurationModel)
        } configurationView: {
            CircularProgressIndicatorConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Circular Progress Indicator Demo

struct CircularProgressIndicatorDemo: View {

    @StateObject var configurationModel: CircularProgressIndicatorConfigurationModel

    var body: some View {
        Group {
            switch configurationModel.variant {
            case .determinate:
                OUDSCircularProgressIndicator(progress: configurationModel.progress,
                                              status: configurationModel.status,
                                              track: configurationModel.track,
                                              gapSize: configurationModel.gapSize,
                                              animated: configurationModel.animated)
            case .indeterminate:
                OUDSCircularProgressIndicator(status: configurationModel.status,
                                              track: configurationModel.track,
                                              gapSize: configurationModel.gapSize)
            }
        }
    }
}
