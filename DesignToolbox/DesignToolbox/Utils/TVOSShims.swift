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

#if os(tvOS)

import SwiftUI

// MARK: - tvOS shims for OUDS Pickers
//
// The OUDS SwiftUI library does not ship `OUDSChipPicker`, `OUDSChipPickerData`,
// `OUDSCheckboxPickerPlacement` or `OUDSRadioPickerPlacement` on tvOS because
// their underlying UI patterns (chip strips, custom picker placement) require
// touch/pointer interactions.
//
// To keep the same configuration codebase (`*ConfigurationView.swift`) buildable
// on tvOS, we provide minimal drop-in replacements that render a native SwiftUI
// `Picker` (segmented on tvOS) so users can still tweak the configuration
// using the Siri Remote / focus engine.

// MARK: - OUDSChipPickerData shim

/// Minimal API-compatible replacement for the `OUDSChipPickerData` value type on tvOS.
public struct OUDSChipPickerData<Tag> where Tag: Hashable {

    public let tag: Tag
    public let layout: Layout
    public let accessibilityIdentifier: String?

    /// Best-effort mirror of the OUDS layout cases used across the toolbox.
    public enum Layout {
        case text(text: String)
        case textAndIcon(String, image: Any)
        case icon(Any, accessibilityLabel: String)
    }

    public init(tag: Tag, layout: Layout, accessibilityIdentifier: String? = nil) {
        self.tag = tag
        self.layout = layout
        self.accessibilityIdentifier = accessibilityIdentifier
    }

    var displayText: String {
        switch layout {
        case let .text(text): return text
        case let .textAndIcon(text, _): return text
        case let .icon(_, label): return label
        }
    }
}

// MARK: - OUDSChipPicker shim

/// Minimal API-compatible replacement for the `OUDSChipPicker` view on tvOS.
/// Renders a native SwiftUI `Picker`.
public struct OUDSChipPicker<Tag>: View where Tag: Hashable {

    private let title: String
    private let chips: [OUDSChipPickerData<Tag>]
    private let selectionMode: SelectionMode

    private enum SelectionMode {
        case required(Binding<Tag>)
        case optional(Binding<Tag?>)
        case multipleSet(Binding<Set<Tag>>)
        case multipleArray(Binding<[Tag]>)
    }

    // MARK: Initializers matching the OUDS API surface used across the toolbox

    public init(title: String,
                selection: Binding<Tag>,
                chips: [OUDSChipPickerData<Tag>]) {
        self.title = title
        self.chips = chips
        self.selectionMode = .required(selection)
    }

    public init(title: String,
                selection: Binding<Tag?>,
                chips: [OUDSChipPickerData<Tag>]) {
        self.title = title
        self.chips = chips
        self.selectionMode = .optional(selection)
    }

    public init(title: String,
                selections: Binding<Set<Tag>>,
                chips: [OUDSChipPickerData<Tag>]) {
        self.title = title
        self.chips = chips
        self.selectionMode = .multipleSet(selections)
    }

    public init(title: String,
                selections: Binding<[Tag]>,
                chips: [OUDSChipPickerData<Tag>]) {
        self.title = title
        self.chips = chips
        self.selectionMode = .multipleArray(selections)
    }

    // MARK: Body

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(LocalizedStringKey(title))
                .font(.headline)

            switch selectionMode {
            case let .required(binding):
                Picker(selection: binding) {
                    ForEach(chips, id: \.tag) { chip in
                        Text(chip.displayText).tag(chip.tag)
                    }
                } label: {
                    Text(LocalizedStringKey(title))
                }
            case let .optional(binding):
                Picker(selection: binding) {
                    Text("—").tag(Tag?.none)
                    ForEach(chips, id: \.tag) { chip in
                        Text(chip.displayText).tag(Tag?.some(chip.tag))
                    }
                } label: {
                    Text(LocalizedStringKey(title))
                }
            case let .multipleSet(binding):
                // tvOS: a proper multi-selection UI is out of scope; render toggle
                // rows to keep the configuration accessible via the focus engine.
                ForEach(chips, id: \.tag) { chip in
                    let isOn = Binding<Bool>(
                        get: { binding.wrappedValue.contains(chip.tag) },
                        set: { newValue in
                            var current = binding.wrappedValue
                            if newValue { current.insert(chip.tag) } else { current.remove(chip.tag) }
                            binding.wrappedValue = current
                        })
                    Toggle(chip.displayText, isOn: isOn)
                }
            case let .multipleArray(binding):
                ForEach(chips, id: \.tag) { chip in
                    let isOn = Binding<Bool>(
                        get: { binding.wrappedValue.contains(chip.tag) },
                        set: { newValue in
                            var current = binding.wrappedValue
                            if newValue {
                                if !current.contains(chip.tag) { current.append(chip.tag) }
                            } else {
                                current.removeAll { $0 == chip.tag }
                            }
                            binding.wrappedValue = current
                        })
                    Toggle(chip.displayText, isOn: isOn)
                }
            }
        }
    }
}

#endif
