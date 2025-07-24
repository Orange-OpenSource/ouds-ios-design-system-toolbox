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

import OUDS
import SwiftUI

// MARK: - Copyable Text View Modifier

/// A  `ViewModifier` defining a context menu allowing user to copy in clipboard some content.
/// Useful for example to allow users to copy some build details or long values.
struct CopyableTextViewModifier: ViewModifier {

    let copyable: String

    init(_ copyable: String) {
        self.copyable = copyable
    }

    func body(content: Content) -> some View {
        content
            .contextMenu {
                Button(action: {
                    UIPasteboard.general.string = copyable
                }, label: {
                    Text("app_common_copy" <- copyable)
                    Image(systemName: "doc.on.doc").accessibilityHidden(true)
                })
            }
    }
}

// MARK: - Openable Text

/// A `View` with a text and an hyperlink style to open a web page on tap for a given element
struct OpenableText: View {

    private let rawText: String
    private let anchor: String
    private let type: HyperlinkType

    @Environment(\.theme) private var theme

    enum HyperlinkType {
        case githubRelease
        case githubBuild
        case githubIssue
        case githubVersion

        func destination(for element: String) -> [String] {
            switch self {
            case .githubRelease:
                [element.toGitHubRelease()]
            case .githubBuild:
                [element.toGitHubBuild()]
            case .githubIssue:
                element.toGitHubIssues()
            case .githubVersion:
                [element.toGitHubVersion()]
            }
        }
    }

    init(_ rawText: String, anchor: String, type: HyperlinkType) {
        self.rawText = rawText
        self.anchor = anchor
        self.type = type
    }

    var body: some View {
        HStack(spacing: theme.spaces.spaceInsetNone) {
            Text(rawText.replacingOccurrences(of: anchor, with: ""))
            anchorLinkView
        }
    }

    // swiftlint:disable force_unwrapping
    @ViewBuilder
    private var anchorLinkView: some View {
        if type != .githubIssue {
            Text(anchor)
                .underline()
                .oudsForegroundStyle(theme.link.linkColorContentEnabled)
                .onTapGesture {
                    UIApplication.shared.open(URL(string: type.destination(for: anchor).first!)!)
                }
                .accessibilityAddTraits([.isLink])
        } else {
            let anchors = anchor.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            ForEach(anchors, id: \.self) { someAnchor in
                if let url = urlFor(String(someAnchor)) {
                    Text(someAnchor)
                        .underline()
                        .oudsForegroundStyle(theme.link.linkColorContentEnabled)
                        .onTapGesture {
                            UIApplication.shared.open(url)
                        }
                        .accessibilityAddTraits([.isLink])
                } else {
                    Text(anchor)
                }
            }
        }
    }

    // swiftlint:enable force_unwrapping

    private func urlFor(_ anchor: String) -> URL? {
        guard let firstURL = type.destination(for: anchor).first(where: { $0.contains(anchor) }) else {
            return nil
        }
        return URL(string: firstURL)
    }
}
