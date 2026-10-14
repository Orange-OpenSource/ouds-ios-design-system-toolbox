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

import SwiftUI
import UIKit

// swiftlint:disable required_deinit

// MARK: - Contrast Override View Controller

/// `colorSchemeContrast` is a read-only value in SwiftUI's `EnvironmentValues` (no `WritableKeyPath`),
/// so it cannot be overridden through the regular `.environment(_:_:)` modifier. The only supported way
/// to force a given `UIAccessibilityContrast` on a subtree is to override the `UITraitCollection` of a
/// child `UIViewController`, exactly like `assertIllustration` already does at the root `UIHostingController`
/// level. This wrapper applies the same mechanism to a single cell of a ``SnapshotGrid``, so cells with
/// different contrast settings can be combined inside one single snapshot image.
private final class ContrastOverrideViewController: UIViewController {

    private let child: UIViewController
    private let contrast: UIAccessibilityContrast

    init(child: UIViewController, contrast: UIAccessibilityContrast) {
        self.child = child
        self.contrast = contrast
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(child)
        setOverrideTraitCollection(UITraitCollection(accessibilityContrast: contrast), forChild: child)
        view.addSubview(child.view)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            child.view.topAnchor.constraint(equalTo: view.topAnchor),
            child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        child.didMove(toParent: self)
    }
}

// MARK: - Contrast Override

/// A `UIViewControllerRepresentable` forcing a given `UIAccessibilityContrast` on `content`,
/// so it can be mixed with other contrast values inside a single ``SnapshotGrid``.
struct ContrastOverride<Content: View>: UIViewControllerRepresentable {

    let contrast: UIAccessibilityContrast
    let content: Content

    func makeUIViewController(context: Context) -> UIViewController {
        let hosting = UIHostingController(rootView: content)
        hosting.view.backgroundColor = .clear
        return ContrastOverrideViewController(child: hosting, contrast: contrast)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Cells are static per snapshot assertion: nothing to update after creation.
    }
}

// MARK: - Snapshot Grid Cell

/// One cell of a ``SnapshotGrid``, i.e. one configuration to render along with a short caption
/// describing it so a failing cell remains identifiable directly in the resulting composite image.
struct SnapshotGridCell<Content: View>: Identifiable {

    /// A unique identifier for the cell, also used as its caption unless `shortCaption` is set.
    let id: String

    /// The view to render for this configuration.
    let content: Content

    /// Builds a cell.
    /// - Parameters:
    ///    - caption: Short human readable text describing the configuration, displayed under the cell.
    ///    - content: The view to render for this configuration.
    init(caption: String, @ViewBuilder content: () -> Content) {
        id = caption
        self.content = content()
    }
}

// MARK: - Snapshot Grid

/// A reusable layout which composes several component configurations into a single deterministic grid,
/// so several snapshot assertions can be gathered into one single reference image instead of one image
/// per configuration.
///
/// Each cell is rendered at the same fixed size (`cellSize`) regardless of its content so the resulting
/// image has a stable, reproducible size. A short caption is displayed under each cell so a regression
/// remains identifiable without leaving the image.
///
/// - Warning: Do not put too many cells in a single grid: `assertSnapshot` compares a *global* percentage
///   of matching pixels over the whole image (`precision`/`perceptualPrecision`), so a single broken cell
///   must still represent a large enough fraction of the image to make the test fail. Prefer several
///   smaller grids (one per "meaningful" design axis, e.g. appearance or layout) over one giant grid.
struct SnapshotGrid<Content: View>: View {

    /// Number of columns in the grid.
    let columns: Int

    /// Fixed size applied to each cell content, so the grid size only depends on the number of cells.
    let cellSize: CGSize

    /// The cells to render, in order (row-major, filling `columns` columns per row).
    let cells: [SnapshotGridCell<Content>]

    /// Optional title displayed at the top of the grid, typically the resulting snapshot file name,
    /// so the image remains identifiable even out of its file context (e.g. in a PR review).
    var title: String?

    /// Horizontal spacing between adjacent cells on the same row. Defaults to a small gap; raise it for
    /// grids whose cells carry taller/wider content that would otherwise feel cramped (e.g. text areas).
    var cellSpacing: CGFloat = 8

    /// Vertical spacing between consecutive rows of cells. Follows the same rationale as ``cellSpacing``.
    var rowSpacing: CGFloat = 8

    private let captionFont: Font = .system(size: 10, weight: .regular)
    private let titleFont: Font = .system(size: 12, weight: .semibold)

    var body: some View {
        let rows = Self.chunked(cells, by: columns)
        VStack(alignment: .leading, spacing: rowSpacing) {
            if let title {
                Text(title)
                    .font(titleFont)
                    .lineLimit(1)
            }
            ForEach(Array(rows.enumerated()), id: \.offset) { _, row in
                HStack(alignment: .top, spacing: cellSpacing) {
                    ForEach(row) { cell in
                        VStack(spacing: 4) {
                            cell.content
                                .frame(width: cellSize.width, height: cellSize.height)
                                .background(Color(white: 1, opacity: 0.001)) // Keeps a deterministic frame even for transparent content
                            Text(cell.id)
                                .font(captionFont)
                                .multilineTextAlignment(.center)
                                .lineLimit(3)
                                .frame(width: cellSize.width)
                        }
                    }
                }
            }
        }
        .padding(8)
        .fixedSize()
    }

    /// Splits `elements` into subarrays of at most `size` elements, preserving order.
    private static func chunked(_ elements: [SnapshotGridCell<Content>], by size: Int) -> [[SnapshotGridCell<Content>]] {
        guard size > 0 else { return [elements] }
        return stride(from: 0, to: elements.count, by: size).map {
            Array(elements[$0 ..< Swift.min($0 + size, elements.count)])
        }
    }
}

// swiftlint:enable required_deinit
