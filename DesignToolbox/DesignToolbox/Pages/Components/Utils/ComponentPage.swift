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

import OUDS
import OUDSComponents
import SwiftUI

// MARK: - Component Configuration

/// The common class used to define the configuration of each component.
open class ComponentConfiguration: ObservableObject {

    @Published var code: String = ""

    @Published var onColoredSurface: Bool = false {
        didSet { updateCode() }
    }

    init() {
        updateCode()
    }

    deinit {}

    // Overwride this function and update code when configuration changed
    func updateCode() {}
}

// MARK: - Component Configuration View

/// Used to create an area with `Component` updated according to the `configuration`
/// modified by user using elements presented in `Configuration` view.
struct ComponentConfigurationView<Component, Configuration>: View where Component: View, Configuration: View {

    @Environment(\.theme) private var theme

    // MARK: Stored properties

    /// The configuration shared between configuration view and component illustration view.
    @ObservedObject var configuration: ComponentConfiguration

    /// The illustration displaying the component according to the configuration.
    @ViewBuilder let componentView: () -> Component

    /// The view used to change the configuration.
    @ViewBuilder let configurationView: () -> Configuration

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.spaceFixedMd) {
            ComponentShowcases(onColoredSurface: configuration.onColoredSurface, componentDemo: componentView)
            // No padding here, the component area keeps all the frame horizontaly

            DesignToolboxConfiguration {
                configurationView()
            }
            .padding(.horizontal, theme.spaces.spaceFixedMd)

            DesignToolboxCode(code: configuration.code, titleText: "app_components_common_viewCodeExample_label")
                .padding(.horizontal, theme.spaces.spaceFixedMd)
        }
        .padding(.bottom, theme.spaces.spaceFixedMd)
    }
}

// MARK: - Component Illustration

/// Used to show the Demo of the `Component` on a colored surface or on
/// standard background (color background primary)
private struct ComponentShowcases<ComponentDemo>: View where ComponentDemo: View {

    @Environment(\.colorScheme) private var colorScheme

    // MARK: Stored properties

    /// Flag to indicates if component is demonstrated on a colored surface
    var onColoredSurface: Bool

    /// The view of the component in the desired configuration.
    @ViewBuilder var componentDemo: () -> ComponentDemo

    // MARK: Body

    var body: some View {
        VStack(alignment: .center) {
            if onColoredSurface {
                componentDemo()
                    .modifier(DesignToolboxColoredSurfaceModifier(coloredSurface: true))
            } else {
                componentDemo()
                    .modifier(DesignToolboxColoredSurfaceModifier(coloredSurface: false))

                // TODO: Build a modifier to inverse colorscheme or force to a colorscheme
                componentDemo()
                    .modifier(DesignToolboxColoredSurfaceModifier(coloredSurface: false))
                    .colorScheme(colorScheme == .dark ? .light : .dark)
            }
        }
    }
}
