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

// MARK: - Label Configuration Model

/// The model shared between `LabelPage` and `LabelConfigurationView` views.
final class LabelConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var size: OUDSLabel.Size {
        didSet { updateCode() }
    }

    @Published var weight: OUDSLabel.Weight {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        text = String(localized: "app_components_common_label_label")
        size = .medium
        weight = .default
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    private var sizePattern: String {
        "size: \(size.technicalDescription)"
    }

    private var weightPattern: String {
        "weight: \(weight.technicalDescription)"
    }

    override func updateCode() {
        code = """
        OUDSLabel(text: "\(text)", \(sizePattern), \(weightPattern))
        """
    }
}

// MARK: - Label Configuration View

struct LabelConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: LabelConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSChipPicker(title: "app_components_common_size_tech",
                               selection: $configurationModel.size,
                               chips: OUDSLabel.Size.chips)

                OUDSChipPicker(title: "app_components_common_weight_tech",
                               selection: $configurationModel.weight,
                               chips: OUDSLabel.Weight.chips)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
            }
        }
    }
}

// MARK: - Label Size extension

extension OUDSLabel.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSLabel.Size] = [.xLarge, .large, .medium, .small]
}

// MARK: - Label Weight extension

extension OUDSLabel.Weight: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSLabel.Weight] = [.default, .moderate, .strong]
}
