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

// MARK: - OUDS enum representable extensions

extension OUDSProgressIndicatorStatus: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSProgressIndicatorStatus] = [.neutral, .accent, .positive, .info, .warning, .negative]
}

extension OUDSProgressIndicatorGapSize: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [OUDSProgressIndicatorGapSize] = [.default, .small]
}
