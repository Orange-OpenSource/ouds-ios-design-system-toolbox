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

// swiftlint:disable type_name

// MARK: - Circular Progress Indicator Configuration Model

/// The model shared between `CircularProgressIndicatorConfigurationView` and `CircularProgressIndicatorDemo`.
final class CircularProgressIndicatorConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var variant: Variant {
        didSet { updateCode() }
    }

    @Published var progress: Double {
        didSet { updateCode() }
    }

    @Published var status: OUDSProgressIndicatorStatus {
        didSet { updateCode() }
    }

    @Published var track: Bool {
        didSet { updateCode() }
    }

    @Published var gapSize: OUDSProgressIndicatorGapSize {
        didSet { updateCode() }
    }

    @Published var animated: Bool {
        didSet { updateCode() }
    }

    @Published var helperTextType: ProgressIndicatorHelperType {
        didSet { updateCode() }
    }

    @Published var helperText: String {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        variant = .determinate
        progress = 0.75
        status = .neutral
        track = true
        gapSize = .default
        animated = true

        helperTextType = .percent
        helperText = ""

        super.init()
    }

    deinit {}

    // MARK: Helper text

    /// The actual `String?` value passed to the indeterminate component: nil when the field is empty,
    /// the user-entered text otherwise.
    var helperTextValue: String? {
        helperText.isEmpty ? nil : helperText
    }

    /// The `OUDSDeterminateProgressIndicatorHelperText?` passed to the determinate
    /// progress indicator.
    var determinateHelperTextValue: OUDSCircularProgressIndicator.HelperTextType? {
        switch helperTextType {
        case .none:
            nil
        case .percent:
            .percent(helperTextValue)
        case .description:
            .description(helperText)
        }
    }

    // MARK: Component Configuration

    override func updateCode() {
        switch variant {
        case .determinate:
            code = """
            OUDSCircularProgressIndicator(progress: \(String(format: "%.2f", progress)), \
            \(statusPattern), \(trackPattern), \(gapSizePattern), \(animatedPattern)\
            \(determinateHelperTextPattern))\(coloredSurfacePattern)
            """
        case .indeterminate:
            code = """
            OUDSCircularProgressIndicator(\(statusPattern), \(trackPattern), \(gapSizePattern), \
            \(indeterminateHelperTextPattern))\(coloredSurfacePattern)
            """
        }
    }

    private var statusPattern: String {
        "status: \(status.technicalDescription)"
    }

    private var trackPattern: String {
        "track: \(track)"
    }

    private var gapSizePattern: String {
        "gapSize: \(gapSize.technicalDescription)"
    }

    private var animatedPattern: String {
        "animated: \(animated)"
    }

    private var determinateHelperTextPattern: String {
        if let helperText = determinateHelperTextValue {
            switch helperText {
            case let .description(description):
                return ", helperText: .description(\"\(description)\")"
            case let .percent(description):
                let descPattern = description.map { "\"\($0)\"" } ?? ""
                return ", helperText: .percent(\(descPattern))"
            }
        }
        return ""
    }

    private var indeterminateHelperTextPattern: String {
        if let value = helperTextValue {
            return ", helperText: \"\(value)\""
        }
        return ""
    }

    private var coloredSurfacePattern: String {
        onColoredSurface ? "\n    .coloredSurface(theme.colorModes.onBrandPrimary)" : ""
    }

    // MARK: - Variant

    enum Variant: CaseIterable, Hashable, DesignToolboxEnumRepresentable {
        case determinate
        case indeterminate
    }
}

// MARK: - Circular Progress Indicator Configuration View

struct CircularProgressIndicatorConfigurationView: View {

    // MARK: Properties

    @StateObject var configurationModel: CircularProgressIndicatorConfigurationModel

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            OUDSChipPicker(title: "app_components_progressIndicator_variant_tech",
                           selection: $configurationModel.variant,
                           chips: CircularProgressIndicatorConfigurationModel.Variant.chips)

            OUDSSwitchItem("app_components_common_onColoredSurface_tech",
                           isOn: $configurationModel.onColoredSurface)

            if configurationModel.variant == .determinate {
                DesignToolboxProgressControl(progress: $configurationModel.progress)

                OUDSSwitchItem("app_components_animated_tech",
                               isOn: $configurationModel.animated)
            }

            OUDSChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.status,
                           chips: OUDSProgressIndicatorStatus.chips)
                .disabled(configurationModel.onColoredSurface)

            OUDSSwitchItem("app_components_progressIndicator_track_tech",
                           isOn: $configurationModel.track)

            OUDSChipPicker(title: "app_components_progressIndicator_gapSize_tech",
                           selection: $configurationModel.gapSize,
                           chips: OUDSProgressIndicatorGapSize.chips)

            if configurationModel.variant == .determinate {
                OUDSHorizontalDivider()

                OUDSChipPicker(title: "app_components_progressIndicator_helperText_type_tech",
                               selection: $configurationModel.helperTextType,
                               chips: ProgressIndicatorHelperType.chips)
            }
        }

        if configurationModel.variant == .indeterminate ||
            (configurationModel.variant == .determinate &&
                (configurationModel.helperTextType == .percent ||
                    configurationModel.helperTextType == .description))
        {

            DesignToolboxEditContentDisclosure(isContentVisible: true) {
                DesignToolboxTextField(text: $configurationModel.helperText,
                                       label: "app_components_progressIndicator_helperText_tech")
            }
        }
    }
}

// MARK: - Helper text type

enum ProgressIndicatorHelperType: DesignToolboxEnumRepresentable {
    case none
    case percent
    case description
}

// swiftlint:enable type_name
