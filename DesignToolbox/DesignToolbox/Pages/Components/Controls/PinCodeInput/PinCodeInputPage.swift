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

// MARK: Pin Code Input Page

struct PinCodeInputPage: View {

    @StateObject private var configurationModel: PinCodeInputConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: PinCodeInputConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            PinCodeInputDemo(configurationModel: configurationModel)
        } configurationView: {
            PinCodeInputConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Pin Code Input Demo

struct PinCodeInputDemo: View {

    // MARK: - Stored properties

    @StateObject var configurationModel: PinCodeInputConfigurationModel

    // MARK: - Body

    var body: some View {
        // FIXME: #988
        // Do not give the length to the same view as index out of bound error will occur in component
        // from the UIKit brige
        switch configurationModel.length {
        case .four:
            OUDSPinCodeInput($configurationModel.value,
                             length: .four,
                             helperText: configurationModel.helperText,
                             isOutlined: configurationModel.isOutlined,
                             status: configurationModel.status)
        case .six:
            OUDSPinCodeInput($configurationModel.value,
                             length: .six,
                             helperText: configurationModel.helperText,
                             isOutlined: configurationModel.isOutlined,
                             status: configurationModel.status)
        case .eight:
            ScrollView(.horizontal) {
                OUDSPinCodeInput($configurationModel.value,
                                 length: .eight,
                                 helperText: configurationModel.helperText,
                                 isOutlined: configurationModel.isOutlined,
                                 status: configurationModel.status)
            }
        }
    }
}
