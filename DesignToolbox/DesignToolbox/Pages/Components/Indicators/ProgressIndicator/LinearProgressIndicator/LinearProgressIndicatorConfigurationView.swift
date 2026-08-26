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

// MARK: - Linear Progress Indicator Configuration Model

/// The model shared between `LinearProgressIndicatorConfigurationView` and `LinearProgressIndicatorDemo`.
final class LinearProgressIndicatorConfigurationModel: ComponentConfiguration {

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

    @Published var stopIndicator: Bool {
        didSet { updateCode() }
    }

    @Published var determinateHelperTextType: DeterminateProgressIndicatorHelperType {
        didSet { updateCode() }
    }

    @Published var helperTextAlignment: OUDSLinearProgressIndicatorHelperTextAlignment {
        didSet { updateCode() }
    }

    @Published var spaceBeforePercent: Bool {
        didSet { updateCode() }
    }

    @Published var helperText: String {
        didSet { updateCode() }
    }

    @Published var gapSize: OUDSProgressIndicatorGapSize {
        didSet { updateCode() }
    }

    @Published var animated: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        variant = .determinate
        progress = 0.75
        status = .neutral
        track = true
        stopIndicator = false
        gapSize = .default
        animated = true

        determinateHelperTextType = .percent
        helperTextAlignment = .start
        helperText = "app_components_pinCodeInput_helper_label".localized()
        spaceBeforePercent = true
        helperTextAlignment = .center

        super.init()
    }

    deinit {}

    // MARK: Helper text

    /// The actual `String?` value passed to the indeterminet component: nil when the field is empty,
    /// the user-entered text otherwise.
    var helperTextValue: String? {
        helperText.isEmpty ? nil : helperText
    }

    /// The `OUDSLinearProgressIndicator.HelperTextType?` passed to the determinate
    /// progress indicator.
    var determinateHelperTextValue: OUDSLinearProgressIndicator.HelperTextType? {
        switch determinateHelperTextType {
        case .none:
            nil
        case .percent:
            .percent(spaceBefore: spaceBeforePercent, description: helperTextValue, alignment: helperTextAlignment)
        case .description:
            .description(helperText, alignment: helperTextAlignment)
        }
    }

    // MARK: Component Configuration

    override func updateCode() {
        switch variant {
        case .determinate:
            code = """
            OUDSLinearProgressIndicator(progress: \(String(format: "%.2f", progress)), \
            \(statusPattern), \(trackPattern), \(stopIndicatorPattern), \(determinateHelperTextPattern), \
            \(gapSizePattern), \(animatedPattern))\(coloredSurfacePattern)
            """
        case .indeterminate:
            code = """
            OUDSLinearProgressIndicator(\(statusPattern), \(trackPattern), \
            \(indeterminateHelperTextPattern),\(gapSizePattern))\(coloredSurfacePattern)
            """
        }
    }

    private var statusPattern: String {
        "status: \(status.technicalDescription)"
    }

    private var trackPattern: String {
        "track: \(track)"
    }

    private var stopIndicatorPattern: String {
        "stopIndicator: \(stopIndicator)"
    }

    private var determinateHelperTextPattern: String {
        switch determinateHelperTextType {
        case .none:
            return ""
        case .percent:
            let descriptionPattern = helperText.isEmpty ? "" : ", description: \"\(helperText)\""
            return ", helperText: .percent(spaceBefore: \(spaceBeforePercent)\(descriptionPattern), alignment: \(helperTextAlignment.technicalDescription))"
        case .description:
            return ", helperText: .description(\"\(helperText)\", alignment: \(helperTextAlignment.technicalDescription))"
        }
    }

    private var indeterminateHelperTextPattern: String {
        if let value = helperTextValue {
            return "helperText: \"\(value)\", helperTextAlignment: \(helperTextAlignment.technicalDescription)"
        }
        return "helperText: nil"
    }

    private var gapSizePattern: String {
        "gapSize: \(gapSize.technicalDescription)"
    }

    private var animatedPattern: String {
        "animated: \(animated)"
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

// MARK: - Linear Progress Indicator Configuration View

struct LinearProgressIndicatorConfigurationView: View {

    // MARK: Properties

    @StateObject var configurationModel: LinearProgressIndicatorConfigurationModel

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                OUDSChipPicker(title: "app_components_progressIndicator_variant_tech",
                               selection: $configurationModel.variant,
                               chips: LinearProgressIndicatorConfigurationModel.Variant.chips)

                OUDSSwitchItem("app_components_common_onColoredSurface_tech",
                               isOn: $configurationModel.onColoredSurface)

                if configurationModel.variant == .determinate {
                    DesignToolboxProgressControl(progress: $configurationModel.progress)
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
                    OUDSSwitchItem("app_components_progressIndicator_animated_tech",
                                   isOn: $configurationModel.animated)

                    OUDSSwitchItem("app_components_progressIndicator_stopIndicator_tech",
                                   isOn: $configurationModel.stopIndicator)

                    OUDSHorizontalDivider()

                    OUDSChipPicker(title: "app_components_progressIndicator_helperText_type_tech",
                                   selection: $configurationModel.determinateHelperTextType,
                                   chips: DeterminateProgressIndicatorHelperType.chips)

                    if configurationModel.determinateHelperTextType == .percent {
                        OUDSSwitchItem("app_components_progressIndicator_helperText_spaceBeforePercent_tech",
                                       isOn: $configurationModel.spaceBeforePercent)
                    }
                }

                if configurationModel.variant == .indeterminate && configurationModel.helperTextValue != nil
                    || configurationModel.variant == .determinate && configurationModel.determinateHelperTextType != .none {
                    OUDSChipPicker(title: "app_components_common_contentAlignment_tech",
                                   selection: $configurationModel.helperTextAlignment,
                                   chips: OUDSLinearProgressIndicatorHelperTextAlignment.chips)
                }
            }

            if configurationModel.variant == .indeterminate ||
                (configurationModel.variant == .determinate &&
                 ((configurationModel.determinateHelperTextType == .percent && configurationModel.helperTextAlignment != .center)
                  || configurationModel.determinateHelperTextType  == .description)) {

                DesignToolboxEditContentDisclosure(isContentVisible: true) {
                    DesignToolboxTextField(text: $configurationModel.helperText,
                                           label: "app_components_progressIndicator_helperText_tech")
                }
            }
        }
    }
}

// MARK: - OUDS enum representable extensions

extension OUDSLinearProgressIndicatorHelperTextAlignment: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSLinearProgressIndicatorHelperTextAlignment] = [.center, .start, .end]

    public var technicalDescription: String {
        switch self {
        case .center:
            ".center"
        case .start:
            ".start"
        case .end:
            ".end"
        }
    }
}

enum DeterminateProgressIndicatorHelperType: DesignToolboxEnumRepresentable {
    case none
    case percent
    case description
}

// swiftlint:enable type_name
