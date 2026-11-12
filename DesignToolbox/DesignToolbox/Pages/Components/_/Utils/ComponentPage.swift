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

import Combine
import OUDSSwiftUI
import SwiftUI

// MARK: - Component Configuration

/// The common class used to define the configuration of each component.
open class ComponentConfiguration: ObservableObject {

    /// Flag to rise of the component to show must not be duplicated with forced color scheme
    /// like for tab bars
    let useOneColorSchemedDemo: Bool

    /// Flag to show the component view edge to edge (i.e. no gridMargin is applied)
    @Published var isEdgeToEdgeComponent: Bool {
        didSet { codeDidChange.send() }
    }

    @Published var code: String = "" {
        didSet { codeDidChange.send() }
    }

    @Published var onColoredSurface: Bool = false {
        didSet { updateCode() }
    }

    /// Emitted **after** `code` has actually been updated with its new value.
    /// Used instead of `objectWillChange` by `register(_:)` so that parent configurations
    /// always read an up to date `code` from their registered sub configurations, avoiding
    /// the one step lag caused by `objectWillChange` firing before `@Published` properties
    /// are actually mutated (its `willSet` semantics).
    let codeDidChange = PassthroughSubject<Void, Never>()

    private var cancellables = Set<AnyCancellable>()

    init() {
        useOneColorSchemedDemo = false
        isEdgeToEdgeComponent = false
        updateCode()
    }

    init(useOneColorSchemedDemo: Bool = false, isEdgeToEdgeComponent: Bool = false) {
        self.useOneColorSchemedDemo = useOneColorSchemedDemo
        self.isEdgeToEdgeComponent = isEdgeToEdgeComponent
        updateCode()
    }

    deinit {}

    // Override this function and update code when configuration changed
    func updateCode() {}

    // Use to registrar sub configuration model
    func register(_ model: ComponentConfiguration) {
        model
            .codeDidChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
                self?.updateCode()
            }
            .store(in: &cancellables)
    }
}

// MARK: - Component Configuration View

/// Used to create an area with `Component` updated according to the `configuration`
/// modified by user using elements presented in `Configuration` view.
struct ComponentConfigurationView<Component, Configuration>: View where Component: View, Configuration: View {

    /// The configuration shared between configuration view and component illustration view.
    @ObservedObject var configuration: ComponentConfiguration

    /// The illustration displaying the component according to the configuration.
    @ViewBuilder let componentView: () -> Component

    /// The view used to change the configuration.
    @ViewBuilder let configurationView: () -> Configuration

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            ComponentShowcases(onColoredSurface: configuration.onColoredSurface, useOneColorSchemedDemo: configuration.useOneColorSchemedDemo) {
                componentView()
                    .frame(maxWidth: .infinity,
                           minHeight: theme.spaces.fixedLarge,
                           alignment: .center)
                    .padding(.vertical, theme.spaces.fixedMedium)
                    .modifier(ComponentEdgeToEdgeModifier(isEdgeToEdge: configuration.isEdgeToEdgeComponent))
            }

            // Keep configuration area edge to edge because
            // contains chips pickers which are edge to edge
            DesignToolboxConfiguration {
                configurationView()
            }

            Group {
                OUDSHorizontalDivider()

                DesignToolboxCode(code: configuration.code, titleText: "app_components_common_viewCodeExample_label")

                OUDSHorizontalDivider()
            }
            .gridMargin(.horizontal)
        }
    }
}

// MARK: - Component Edge to Edge Modifier

private struct ComponentEdgeToEdgeModifier: ViewModifier {

    let isEdgeToEdge: Bool

    func body(content: Content) -> some View {
        if isEdgeToEdge {
            content
        } else {
            content.gridMargin(.horizontal)
        }
    }
}

// MARK: - Component Illustration

/// Used to show the Demo of the `Component` on a colored surface or on
/// standard background (color background primary)
private struct ComponentShowcases<ComponentDemo>: View where ComponentDemo: View {

    /// Flag to indicates if component is demonstrated on a colored surface
    let onColoredSurface: Bool

    /// Flag to rise to display only one component without forced color scheme
    let useOneColorSchemedDemo: Bool

    /// The view of the component in the desired configuration.
    @ViewBuilder var componentDemo: () -> ComponentDemo

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if onColoredSurface {
                componentDemo()
                    .modifier(DesignToolboxColoredSurfaceModifier(coloredSurface: true))
            } else {
                if useOneColorSchemedDemo {
                    componentDemo()
                        .modifier(DesignToolboxColoredSurfaceModifier(coloredSurface: false))
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
        // Make the whole showcases region focusable on tvOS so it becomes an
        // intermediate focus target between the top controls and the
        // configuration panel: swiping up from the config will focus (and thus
        // scroll into view) the demo instead of jumping straight to the header.
        .tvOSFocusableRow()
    }
}
