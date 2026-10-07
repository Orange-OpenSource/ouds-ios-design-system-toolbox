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

// MARK: Skeleton page

struct SkeletonPage: View {

    @StateObject private var configurationModel: SkeletonConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: SkeletonConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            SkeletonDemo(configurationModel: configurationModel)
        } configurationView: {
            SkeletonConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Skeleton Demo

struct SkeletonDemo: View {

    @StateObject var configurationModel: SkeletonConfigurationModel

    var body: some View {
        OUDSSkeleton(securityMargin: configurationModel.securityMargin)
            .frame(width: 200, height: 62, alignment: .center)
            .oudsSkeleton(isVisible: true, isAnimated: configurationModel.isAnimated)
    }
}
