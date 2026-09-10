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

// MARK: - Body Configuration Model

/// The model shared between `BodyPage` and `BodyConfigurationView` views.
final class BodyConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var size: OUDSBody.Size {
        didSet { updateCode() }
    }

    @Published var weight: OUDSBody.Weight {
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
        OUDSBody(text: "\(text)", \(sizePattern), \(weightPattern))
        """
    }
}

// MARK: - Body Configuration View

struct BodyConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: BodyConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSChipPicker(title: "app_components_common_size_tech",
                               selection: $configurationModel.size,
                               chips: OUDSBody.Size.chips)

                OUDSChipPicker(title: "app_components_common_weight_tech",
                               selection: $configurationModel.weight,
                               chips: OUDSBody.Weight.chips)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
            }
        }
    }
}

// MARK: - Body Size extension

extension OUDSBody.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSBody.Size] = [.large, .medium, .small]
}

// MARK: - Body Weight extension

extension OUDSBody.Weight: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSBody.Weight] = [.default, .moderate, .strong]
}
