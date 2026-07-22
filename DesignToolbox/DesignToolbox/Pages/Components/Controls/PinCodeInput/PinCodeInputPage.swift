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


#if !os(tvOS)

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
        let length: OUDSPinCodeInput.Length = switch configurationModel.length {
        case .four:
            .four
        case .six:
            .six
        case .eight:
            .eight
        }

        // Do not give the length to the same view as index out of bound error will occur in component
        // from the UIKit bridge
        switch configurationModel.textMode {
        case .rich:
            if length == .eight, UIDevice.current.userInterfaceIdiom == .phone { // For iPad we have enough space, not for iPhone
                ScrollView(.horizontal) {
                    OUDSPinCodeInput($configurationModel.value,
                                     length: length,
                                     helperText: configurationModel.richHelperText,
                                     isOutlined: configurationModel.isOutlined,
                                     status: configurationModel.status)
                }
            } else {
                OUDSPinCodeInput($configurationModel.value,
                                 length: length,
                                 helperText: configurationModel.richHelperText,
                                 isOutlined: configurationModel.isOutlined,
                                 status: configurationModel.status)
            }
        case .raw:
            if length == .eight, UIDevice.current.userInterfaceIdiom == .phone { // For iPad we have enough space, not for iPhone
                ScrollView(.horizontal) {
                    OUDSPinCodeInput($configurationModel.value,
                                     length: length,
                                     helperText: configurationModel.helperText,
                                     isOutlined: configurationModel.isOutlined,
                                     status: configurationModel.status)
                }
            } else {
                OUDSPinCodeInput($configurationModel.value,
                                 length: length,
                                 helperText: configurationModel.helperText,
                                 isOutlined: configurationModel.isOutlined,
                                 status: configurationModel.status)
            }
        }
    }
}

#endif
