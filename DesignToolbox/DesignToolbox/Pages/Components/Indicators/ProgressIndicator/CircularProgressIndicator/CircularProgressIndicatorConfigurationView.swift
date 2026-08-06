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

    @Published var status: OUDSCircularProgressIndicator.Status {
        didSet { updateCode() }
    }

    @Published var track: Bool {
        didSet { updateCode() }
    }

    @Published var gapSize: OUDSCircularProgressIndicator.GapSize {
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
        gapSize = .default
        animated = true
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        switch variant {
        case .determinate:
            code = """
            OUDSCircularProgressIndicator(progress: \(String(format: "%.2f", progress)), \
            \(statusPattern), \(trackPattern), \(gapSizePattern), \(animatedPattern))\(coloredSurfacePattern)
            """
        case .indeterminate:
            code = """
            OUDSCircularProgressIndicator(\(statusPattern), \(trackPattern), \(gapSizePattern))\(coloredSurfacePattern)
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

            if configurationModel.variant == .determinate {
                progressControl

                OUDSSwitchItem("app_components_progressIndicator_animated_tech",
                               isOn: $configurationModel.animated)
            }

            OUDSChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.status,
                           chips: OUDSCircularProgressIndicator.Status.chips)

            OUDSSwitchItem("app_components_progressIndicator_track_tech",
                           isOn: $configurationModel.track)

            OUDSChipPicker(title: "app_components_progressIndicator_gapSize_tech",
                           selection: $configurationModel.gapSize,
                           chips: OUDSCircularProgressIndicator.GapSize.chips)

            OUDSSwitchItem("app_components_common_onColoredSurface_tech",
                           isOn: $configurationModel.onColoredSurface)
        }
    }

    // MARK: Progress control (platform specific)

    @ViewBuilder
    private var progressControl: some View {
        #if os(tvOS)
        // `Slider` is not available on tvOS: expose discrete steps via a chip picker.
        OUDSChipPicker(title: progressLabel,
                       selection: $configurationModel.progress,
                       chips: Self.progressSteps.map { value in
                           OUDSChipPickerData(tag: value, layout: .text(text: "\(Int(value * 100)) %"))
                       })
        #else
        VStack(alignment: .leading, spacing: theme.spaces.fixedXsmall) {
            Text(LocalizedStringKey(progressLabel))
                .labelStrongLarge(theme)
                .foregroundColor(theme.colors.contentDefault)
            Slider(value: $configurationModel.progress, in: 0 ... 1)
        }
        .padding(theme.spaces.fixedSmall)
        #endif
    }

    private var progressLabel: String {
        let percent = Int((configurationModel.progress * 100).rounded())
        return "\("app_components_progressIndicator_progress_tech".localized()): \(percent) %"
    }

    #if os(tvOS)
    private static let progressSteps: [Double] = [0.0, 0.25, 0.5, 0.75, 1.0]
    #endif
}

// MARK: - OUDS enum representable extensions

extension OUDSCircularProgressIndicator.Status: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSCircularProgressIndicator.Status] = [.neutral, .accent, .positive, .info, .warning, .negative]
}

extension OUDSCircularProgressIndicator.GapSize: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSCircularProgressIndicator.GapSize] = [.default, .small]
}

// swiftlint:enable type_name
