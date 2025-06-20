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

// MARK: - Radio Item Page

struct RadioItemPage: View {

    @StateObject private var configuration: RadioItemConfigurationModel

    init() {
        _configuration = StateObject(wrappedValue: RadioItemConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(
            configuration: configuration,
            componentView: componentView,
            configurationView: configurationView)
    }

    @ViewBuilder
    private func componentView(with configuration: ComponentConfiguration) -> some View {
        if let model = configuration as? RadioItemConfigurationModel {
            RadioItemIllustration(model: model)
        }
    }

    @ViewBuilder
    private func configurationView(with configuration: ComponentConfiguration) -> some View {
        if let model = configuration as? RadioItemConfigurationModel {
            RadioItemConfiguration(model: model)
        }
    }
}

// MARK: - Radio Item Illustration

private struct RadioItemIllustration: View {

    let model: RadioItemConfigurationModel

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(alignment: .center) {
            // TODO: Build a modifier to inverse colorscheme or force to a colorscheme
            RadioItemDemo(model: model)
            RadioItemDemo(model: model)
                .colorScheme(colorScheme == .dark ? .light : .dark)
        }
    }
}

// MARK: - Radio Item Demo

private struct RadioItemDemo: View {

    @ObservedObject var model: RadioItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        OUDSRadioItem(isOn: $model.selection,
                      label: model.labelText,
                      additionalLabel: model.additionalLabelText,
                      helper: model.helperText,
                      icon: icon,
                      flipIcon: model.flipIcon,
                      isOutlined: model.outlined,
                      isReversed: model.isReversed,
                      isError: model.isError,
                      isReadOnly: model.isReadOnly,
                      hasDivider: model.divider)
            .disabled(!model.enabled)
            .padding(.all, theme.spaces.spaceFixedMedium)
            .designToolboxColoredSurface(false)
    }

    // Need here that system name, a11y managed in component
    // swiftlint:disable accessibility_label_for_image
    private var icon: Image? {
        model.icon ? Image(systemName: "figure.handball") : nil
    }
    // swiftlint:enable accessibility_label_for_image
}
