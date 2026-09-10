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

// MARK: - Code Configuration Model

/// The model shared between `CodePage` and `CodeConfigurationView` views.
///
/// `OUDSCode` only defines a single (medium) typography style, so the only configurable
/// parameter here is the text content itself.
final class CodeConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var text: String {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        text = String(localized: "app_components_common_label_label")
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        OUDSCode(text: "\(text)")
        """
    }
}

// MARK: - Code Configuration View

struct CodeConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: CodeConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
            }
        }
    }
}
