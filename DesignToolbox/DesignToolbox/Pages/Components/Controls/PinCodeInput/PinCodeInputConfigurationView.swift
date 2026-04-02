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

// MARK: - Pin Code Input Configuration Model

/// The model shared between `PinCodeInputPageConfiguration` view and `PinCodeInputPageComponent` view.
final class PinCodeInputConfigurationModel: ComponentConfiguration {

    // MARK: Stored properties

    private static let defaultHelperText = ""
    private static let defaultErrorText = String(localized: "app_components_common_errorMessage_tech")

    // MARK: Published properties

    @Published var value: String {
        didSet { updateCode() }
    }

    @Published var length: OUDSPinCodeInput.Length {
        didSet { updateCode() }
    }

    @Published var helperText: String {
        didSet { updateCode() }
    }

    @Published var isOutlined: Bool {
        didSet { updateCode() }
    }

    @Published var statusKind: PinCodeInputStatusKind {
        didSet { updateCode() }
    }

    @Published var errorText: String {
        didSet { updateCode() }
    }

    /// The derived `OUDSPinCodeInput.Status` from the current `statusKind` and `errorText`.
    var status: OUDSPinCodeInput.Status {
        switch statusKind {
        case .enabled:
            .enabled
        case .error:
            .error(message: errorText)
        }
    }

    // MARK: Initializer

    override init() {
        value = ""
        length = .six
        helperText = Self.defaultHelperText
        errorText = Self.defaultErrorText
        isOutlined = false
        statusKind = .enabled
        super.init()
    }

    deinit {}

    // MARK: Code illustration

    override func updateCode() {
        code =
            """
            // Current value is: '\(value)'
            OUDSPinCodeInput($value, \(lengthPattern)\(helperTextPattern)\(isOutlinedPattern)\(statusPattern))
            """
    }

    private var lengthPattern: String {
        "length: .\(length)"
    }

    private var helperTextPattern: String {
        ", helperText: \"\(helperText)\""
    }

    private var isOutlinedPattern: String {
        !isOutlined ? "" : ", isOutlined: true"
    }

    private var statusPattern: String {
        switch statusKind {
        case .enabled:
            ""
        case .error:
            ", status: .error(message: \"\(errorText)\")"
        }
    }
}

// MARK: - Pin Code Input Configuration View

struct PinCodeInputConfigurationView: View {

    @StateObject var configurationModel: PinCodeInputConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                OUDSSwitchItem("app_components_common_outlined_tech", isOn: $configurationModel.isOutlined)

                OUDSChipPicker(title: "Length", // TODO: #988 - Wording
                               selection: $configurationModel.length,
                               chips: OUDSPinCodeInput.Length.chips)

                OUDSChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.statusKind,
                               chips: PinCodeInputStatusKind.chips)

                DesignToolboxEditContentDisclosure {
                    switch configurationModel.statusKind {
                    case .error:
                        DesignToolboxTextField(text: $configurationModel.errorText, label: "Error")
                    default:
                        DesignToolboxTextField(text: $configurationModel.helperText, label: "Helper")
                    }
                }
            }
        }
    }
}

// MARK: - extension of OUDS Pin Code Input Length

extension OUDSPinCodeInput.Length: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    nonisolated(unsafe) public static var allCases: [OUDSPinCodeInput.Length] =
        [.four, .six, .eight]

    public var description: String {
        switch self {
        case .four:
            "four"
        case .six:
            "six"
        case .eight:
            "eight"
        }
    }

    private var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description.localized()))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

// MARK: - Pin Code Input Status Kind

/// A simple enum representing the kind of status for the pin code input picker,
/// decoupled from the associated message in `OUDSPinCodeInput.Status`.
enum PinCodeInputStatusKind: CaseIterable, CustomStringConvertible, Hashable {
    case enabled
    case error

    var description: String {
        switch self {
        case .enabled:
            "enabled"
        case .error:
            "error"
        }
    }

    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: description))
    }

    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}
