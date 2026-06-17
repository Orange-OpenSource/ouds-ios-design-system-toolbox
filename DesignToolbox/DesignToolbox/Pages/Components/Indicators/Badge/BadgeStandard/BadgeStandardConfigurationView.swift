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

// MARK: - Badge Standard Configuration Model

/// The model shared between `BadgeStandardPageConfiguration` view and `BadgeStandardPageComponent` view.
final class BadgeStandardConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var standardSize: OUDSBadgeStandard.Size {
        didSet { updateCode() }
    }

    @Published var status: OUDSBadgeStandard.Status {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        standardSize = .medium
        status = .neutral
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        OUDSBadgeStandard(accessibilityLabel: someLabel, \(statusPattern), \(sizePattern))
        \(disablePattern)
        """
    }

    private var disablePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var statusPattern: String {
        "status: \(status.technicalDescription)"
    }

    private var sizePattern: String {
        "size: \(standardSize.technicalDescription)"
    }
}

// MARK: - Badge Standard Configuration View

struct BadgeStandardConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: BadgeStandardConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            OUDSSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

            OUDSChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.standardSize,
                           chips: OUDSBadgeStandard.Size.chips)

            OUDSChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.status,
                           chips: OUDSBadgeStandard.Status.chips)
        }
    }
}

extension OUDSBadgeStandard.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSBadgeStandard.Size] = [.extraSmall, .small, .medium, .large]
}

extension OUDSBadgeStandard.Status: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSBadgeStandard.Status] = [.neutral, .accent, .positive, .info, .warning, .negative]
}
