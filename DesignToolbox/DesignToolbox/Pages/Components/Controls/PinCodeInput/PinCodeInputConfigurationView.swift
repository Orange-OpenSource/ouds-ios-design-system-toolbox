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

#if !os(tvOS)

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

    @Published var textMode: TextualContentMode {
        didSet { updateCode() }
    }

    // MARK: - Computed properties

    /// The derived `OUDSPinCodeInput.Status` from the current `statusKind` and `errorText`.
    var status: OUDSPinCodeInput.Status {
        switch statusKind {
        case .enabled:
            .enabled
        case .error:
            .error(message: errorText)
        case .richError:
            .richError(message: richErrorText)
        }
    }

    var richHelperText: AttributedString {
        do {
            return try AttributedString(markdown: helperText)
        } catch {
            return AttributedString("Supposed to be valid Markdown")
        }
    }

    var richErrorText: AttributedString {
        do {
            return try AttributedString(markdown: errorText)
        } catch {
            return AttributedString("Supposed to be valid Markdown")
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
        textMode = .raw
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
        textMode == .rich ? ", helperText: yourAttributedString" : ", helperText: \"\(helperText)\""
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
        case .richError:
            ", status: .richError(message: yourAttributedString)"
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

                OUDSChipPicker(title: "app_components_pinCodeInput_length_tech",
                               selection: $configurationModel.length,
                               chips: OUDSPinCodeInput.Length.chips)

                OUDSChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.statusKind,
                               chips: PinCodeInputStatusKind.chips)

                if configurationModel.statusKind != .error, configurationModel.statusKind != .richError {
                    OUDSChipPicker(title: "app_components_textMode_tech",
                                   selection: $configurationModel.textMode,
                                   chips: TextualContentMode.chips)
                }

                DesignToolboxEditContentDisclosure {
                    switch configurationModel.statusKind {
                    case .error, .richError:
                        DesignToolboxTextField(text: $configurationModel.errorText, label: "app_components_pinCodeInput_errorDescription_label")
                    default:
                        DesignToolboxTextField(text: $configurationModel.helperText, label: "app_components_common_helperText_tech")
                    }
                }
            }
        }
    }
}

// MARK: - extension of OUDS Pin Code Input Length

extension OUDSPinCodeInput.Length: @retroactive CaseIterable, DesignToolboxEnumRepresentable {

    nonisolated(unsafe) public static var allCases: [OUDSPinCodeInput.Length] =
        [.four, .six, .eight]
}

// MARK: - Pin Code Input Status Kind

/// A simple enum representing the kind of status for the pin code input picker,
/// decoupled from the associated message in `OUDSPinCodeInput.Status`.

enum PinCodeInputStatusKind: DesignToolboxEnumLocalizedRepresentable {
    case enabled, error, richError

    var wordingKey: String {
        switch self {
        case .enabled:
            "app_common_enabled_tech"
        case .error:
            "app_components_common_error_tech"
        case .richError:
            "app_components_common_richError_tech"
        }
    }
}

#endif
