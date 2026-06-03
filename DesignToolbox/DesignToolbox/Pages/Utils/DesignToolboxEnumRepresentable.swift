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

// MARK: - Design Toolbox Enum Representable

/// Defines the option of configuration as enum representable (i.e. formated) to be used
/// in a `OUDSChipPicker`. By default the `OUDSChipPickerData` is built with
/// a formatted string based on the enum description.
///
/// The technical name is based on the desciption of the enum prefixed by a dot.
protocol DesignToolboxEnumRepresentable: CaseIterable, Hashable {
    /// The formatted string
    var formattedName: String { get }

    /// The technical description
    var technicalDescription: String { get }

    /// The chip data used by the `OUDSChipPicker`
    var chipData: OUDSChipPickerData<Self> { get }

    /// Set of chips used by `OUDSChipPicker`
    static var chips: [OUDSChipPickerData<Self>] { get }
}

extension DesignToolboxEnumRepresentable {
    /// Default implementation extracting words from enum raw description,
    /// and set first character in uppercase and the other in lowercase.
    var formattedName: String {
        let name = String(describing: self)
        let withSpaces = name.replacingOccurrences(
            of: "([a-z])([A-Z])",
            with: "$1 $2",
            options: .regularExpression)
        return withSpaces.prefix(1).uppercased() + withSpaces.dropFirst().lowercased()
    }

    /// Description prefixed by a dot
    var technicalDescription: String {
        ".\(String(describing: self))"
    }

    /// The data used by ``OUDSChipPickerData`` based on formatted representation
    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: formattedName))
    }

    /// The data used by ``OUDSChipPicker`` based on formatted representation
    static var chips: [OUDSChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

// MARK: - Design Toolbox Enum Localized Representable

/// Define the option of configuration as enum representable based on Localized String Keys
protocol DesignToolboxEnumLocalizedRepresentable: DesignToolboxEnumRepresentable {
    var wordingKey: String { get }
}

extension DesignToolboxEnumLocalizedRepresentable {

    /// Alternative implementation of the `OUDSChipPickerData` based on
    /// description that represents a wording key.
    var chipData: OUDSChipPickerData<Self> {
        OUDSChipPickerData(tag: self, layout: .text(text: wordingKey.localized()))
    }
}
