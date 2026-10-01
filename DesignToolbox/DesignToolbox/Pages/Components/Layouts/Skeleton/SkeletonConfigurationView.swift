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

// MARK: - Skeleton Configuration Model

/// The model shared between `SkeletonPageConfiguration` view and `SkeletonPageComponent` view.
final class SkeletonConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var isAnimated: Bool {
        didSet { updateCode() }
    }

    @Published var securityMargin: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        isAnimated = true
        securityMargin = false
        super.init()
    }

    deinit {}


    // MARK: Component Configuration

    override func updateCode() {
        code = "OUDSSkeleton()"
    }
}

// MARK: - Skeleton Configuration View

struct SkeletonConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: SkeletonConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            OUDSSwitchItem("app_components_skeleton_securityMargin_tech",
                           isOn: $configurationModel.securityMargin)

            OUDSSwitchItem("app_components_common_animated_tech",
                           isOn: $configurationModel.isAnimated)
        }
    }
}
