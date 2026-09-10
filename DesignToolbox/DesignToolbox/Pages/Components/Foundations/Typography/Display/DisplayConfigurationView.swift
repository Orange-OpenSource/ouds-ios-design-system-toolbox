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

// MARK: - Display Configuration Model

/// The model shared between `DisplayPage` and `DisplayConfigurationView` views.
final class DisplayConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var size: OUDSDisplay.Size {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        text = String(localized: "app_components_common_label_label")
        size = .large
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    private var sizePattern: String {
        "size: \(size.technicalDescription)"
    }

    override func updateCode() {
        code = """
        OUDSDisplay(text: "\(text)", \(sizePattern))
        """
    }
}

// MARK: - Display Configuration View

struct DisplayConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: DisplayConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSChipPicker(title: "app_components_common_size_tech",
                               selection: $configurationModel.size,
                               chips: OUDSDisplay.Size.chips)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
            }
        }
    }
}

// MARK: - Display Size extension

extension OUDSDisplay.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSDisplay.Size] = [.large, .medium, .small]
}
