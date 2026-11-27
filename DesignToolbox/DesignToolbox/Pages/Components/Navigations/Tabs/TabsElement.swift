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

#if !os(watchOS)
import OUDSSwiftUI
import SwiftUI

struct TabsElements: DesignToolboxElement {
    let name = "Tabs"
    let illustration = AnyView(TabsIllustration(variant: .line))

    var pageDescription: AnyView {
        AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_tabs_description",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: [
                LineTabsElement(),
                ContainedTabsElement(),
            ]))))
    }
}

struct LineTabsElement: DesignToolboxElement {
    let name = "Tabs line"
    let illustration = AnyView(TabsIllustration(variant: .line))
    var pageDescription: AnyView {
        AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_tabs_lineDescription",
            version: OUDSVersions.componentLineTabsVersion,
            demoScreen: AnyView(TabsPage(variant: .line).id(TabsVariant.line))))
    }
}

struct ContainedTabsElement: DesignToolboxElement {
    let name = "Tabs contained"
    let illustration = AnyView(TabsIllustration(variant: .contained))
    var pageDescription: AnyView {
        AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_tabs_containedDescription",
            version: OUDSVersions.componentContainedTabsVersion,
            demoScreen: AnyView(TabsPage(variant: .contained).id(TabsVariant.contained))))
    }
}

private enum TabsVariant: Hashable {
    case line, contained
}

private struct TabsIllustration: View {
    let variant: TabsVariant

    var body: some View {
        if variant == .contained {
            OUDSContainedTabs(selection: .constant(0)) {
                OUDSTabItem(tag: 0, label: .localized("app_components_tabs_overview"))
                OUDSTabItem(tag: 1, label: .localized("app_components_tabs_details"))
            }
        } else {
            OUDSLineTabs(selection: .constant(0)) {
                OUDSTabItem(tag: 0, label: .localized("app_components_tabs_overview"))
                OUDSTabItem(tag: 1, label: .localized("app_components_tabs_details"))
            }
        }
    }
}

private final class TabsConfigurationModel: ComponentConfiguration {
    private let variant: TabsVariant

    init(variant: TabsVariant) {
        self.variant = variant
        super.init(isEdgeToEdgeComponent: true)
    }

    var contained: Bool { variant == .contained }

    @Published var layout = TabsDemoLayout.textOnly { didSet { updateCode() } }
    @Published var indicator = TabsDemoIndicator.none { didSet { updateCode() } }
    @Published var showDescription = false { didSet { updateCode() } }
    @Published var richText = false { didSet { updateCode() } }
    @Published var showSkeleton = false { didSet { updateCode() } }
    @Published var gridMargin = true { didSet { updateCode() } }
    @Published var stickyBackground = false { didSet { updateCode() } }
    @Published var enabled = true { didSet { updateCode() } }
    @Published var hasDivider = true { didSet { updateCode() } }
    @Published var strongLabel = true { didSet { updateCode() } }
    @Published var count = 4 { didSet { updateCode() } }

    var items: [OUDSTabItem<Int>] {
        (0 ..< count).map { index in
            OUDSTabItem(
                tag: index,
                label: label(at: index),
                description: showDescription && layout.hasText ? .localized("app_components_common_description_tech") : nil,
                image: layout == .textOnly ? nil : OUDSImage(asset: Image(decorative: "ic_heart")),
                trailing: index == 0 ? trailing : nil,
                accessibilityIdentifier: "tabs_item_\(index)")
        }
    }

    private func label(at index: Int) -> OUDSTextualContent {
        let text = "\("app_components_common_label_label".localized()) \(index + 1)"
        return richText && layout.hasText ? .rich(AttributedString.from(text: text, foregroundColor: .blue)) : .raw(text)
    }

    private var trailing: OUDSTabItemTrailing? {
        switch indicator {
        case .none:
            nil
        case .standardBadge:
            .badge(.standard(accessibilityLabel: "app_components_tabs_notifications".localized(), status: .negative))
        case .countBadge:
            .badge(.count(3, accessibilityLabel: "app_components_tabs_notifications".localized(), status: .negative))
        case .tag:
            .tag(OUDSTag(label: "app_components_tabs_tagLabel".localized(), size: .small))
        }
    }

    private var trailingCode: String {
        switch indicator {
        case .none:
            ""
        case .standardBadge:
            ", trailing: .badge(.standard(accessibilityLabel: \"Notifications\", status: .negative))"
        case .countBadge:
            ", trailing: .badge(.count(3, accessibilityLabel: \"3 notifications\", status: .negative))"
        case .tag:
            ", trailing: .tag(OUDSTag(label: \"New\", size: .small))"
        }
    }

    override func updateCode() {
        let component = contained ? "OUDSContainedTabs" : "OUDSLineTabs"
        let layoutCode = layout == .textOnly ? "" : ", layout: .\(layout.rawValue)"
        let divider = hasDivider ? "" : ", hasDivider: false"
        let strong = strongLabel ? "" : ", hasStrongLabel: false"
        let margin = gridMargin ? "" : ", hasGridMargin: false"
        let sticky = stickyBackground ? ", hasStickyBackground: true" : ""
        let itemLines = (0 ..< count).map { index in
            let description = showDescription && layout.hasText ? ", description: \"Description\"" : ""
            let image = layout == .textOnly ? "" : ", image: OUDSImage(asset: Image(decorative: \"ic_heart\"))"
            let trailing = index == 0 ? trailingCode : ""
            let label = richText && layout.hasText
                ? ".rich(AttributedString.from(text: \"Label \(index + 1)\", foregroundColor: .blue))"
                : "\"Label \(index + 1)\""
            return "        OUDSTabItem(tag: \(index), label: \(label)\(description)\(image)\(trailing))"
        }
        .joined(separator: "\n")
        code = """
        @State private var selection = 0

        VStack {
            \(component)(selection: $selection\(layoutCode)\(divider)\(strong)\(margin)\(sticky)) {
        \(itemLines)
            }
            \(enabled ? "" : ".disabled(true)")
            \(showSkeleton ? ".showSkeleton(isVisible: true)" : "")

            OUDSInlineAlert(label: "Tab \\(selection + 1) displayed", status: .neutral())
                .id(selection)
        }
        """
    }

    deinit {}
}

private enum TabsDemoLayout: String, DesignToolboxEnumRepresentable {
    case textOnly, textAndLeadingAsset, textAndTopAsset, assetOnly

    var hasText: Bool { self != .assetOnly }

    var value: OUDSTabsLayout {
        switch self {
        case .textOnly:
            .textOnly
        case .textAndLeadingAsset:
            .textAndLeadingAsset
        case .textAndTopAsset:
            .textAndTopAsset
        case .assetOnly:
            .assetOnly
        }
    }
}

private enum TabsDemoIndicator: String, DesignToolboxEnumLocalizedRepresentable {
    case none, standardBadge, countBadge, tag

    var wordingKey: String {
        switch self {
        case .none:
            "app_components_tabs_noIndicator"
        case .standardBadge:
            "app_components_tabs_standardBadge"
        case .countBadge:
            "app_components_tabs_countBadge"
        case .tag:
            "app_components_tabs_tag"
        }
    }
}

private struct TabsPage: View {
    @StateObject private var configuration: TabsConfigurationModel
    @Environment(\.theme) private var theme

    init(variant: TabsVariant) {
        _configuration = StateObject(wrappedValue: TabsConfigurationModel(variant: variant))
    }

    var body: some View {
        ComponentConfigurationView(configuration: configuration) {
            TabsDemo(configuration: configuration)
        } configurationView: {
            VStack {
                OUDSChipPicker(title: "app_components_common_layout_tech", selection: $configuration.layout, chips: TabsDemoLayout.chips)
                OUDSSwitchItem("app_common_enabled_tech", isOn: $configuration.enabled)
                OUDSSwitchItem("app_components_common_skeleton_tech", isOn: $configuration.showSkeleton)
                OUDSSwitchItem("app_components_tabs_gridMargin", isOn: $configuration.gridMargin)
                if configuration.gridMargin {
                    OUDSSwitchItem("app_components_tabs_sticky", isOn: $configuration.stickyBackground)
                }
                OUDSSwitchItem("app_components_tabs_divider", isOn: $configuration.hasDivider)
                if configuration.layout.hasText {
                    OUDSSwitchItem("app_components_tabs_descriptions", isOn: $configuration.showDescription)
                    OUDSSwitchItem("app_components_tabs_richText", isOn: $configuration.richText)
                    OUDSSwitchItem("app_components_tabs_strongLabel", isOn: $configuration.strongLabel)
                }
                OUDSChipPicker(title: "app_components_tabs_indicator", selection: $configuration.indicator, chips: TabsDemoIndicator.chips)
                OUDSSwitchItem("app_components_common_onColoredSurface_tech", isOn: $configuration.onColoredSurface)
                #if !os(tvOS)
                Stepper(
                    "app_components_common_itemCount_label" <- "\(configuration.count)",
                    value: $configuration.count,
                    in: 1 ... 8,
                    step: 1)
                    .padding(.vertical, theme.spaces.fixedMedium)
                    .gridMargin(.horizontal)
                    .labelStrongMedium(theme)
                #endif
            }
        }
    }
}

private struct TabsDemo: View {
    @ObservedObject var configuration: TabsConfigurationModel
    @State private var selection = 0
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedMedium) {
            Group {
                if configuration.contained {
                    OUDSContainedTabs(
                        selection: $selection,
                        layout: configuration.layout.value,
                        hasDivider: configuration.hasDivider,
                        hasStrongLabel: configuration.strongLabel,
                        hasGridMargin: configuration.gridMargin,
                        hasStickyBackground: configuration.stickyBackground)
                    {
                        configuration.items
                    }
                } else {
                    OUDSLineTabs(
                        selection: $selection,
                        layout: configuration.layout.value,
                        hasDivider: configuration.hasDivider,
                        hasStrongLabel: configuration.strongLabel,
                        hasGridMargin: configuration.gridMargin,
                        hasStickyBackground: configuration.stickyBackground)
                    {
                        configuration.items
                    }
                }
            }
            .disabled(!configuration.enabled)
            .showSkeleton(isVisible: configuration.showSkeleton)

            OUDSInlineAlert(label: "app_components_tabs_selected" <- "\(selection + 1)", status: .neutral())
                .id(selection)
                .gridMargin(.horizontal)
                .accessibilityIdentifier("tabs_selected_content")
        }
        .onReceive(configuration.$count) { count in
            if selection >= count { selection = 0 }
        }
    }
}
#endif
