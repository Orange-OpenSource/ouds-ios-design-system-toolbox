---
name: ouds-ios-toolbox-snapshot-tests
description: How to create, run, and maintain snapshot tests (swift-snapshot-testing) in the OUDS iOS Design Toolbox demo app — naming conventions, the SnapshotGrid pattern for combinatorial axes, troubleshooting failures, and when/how to regenerate reference images. Load this when writing or reviewing snapshot tests, investigating a snapshot test failure, or adding new components/variants to `DesignToolboxSnapshotsTests`.
license: MIT
---

# OUDS iOS Toolbox — Snapshot Tests

This skill covers the **demo app's** snapshot test suite (`DesignToolboxSnapshotsTests` target), which verifies the
visual rendering (look & feel) of OUDS components and tokens. It does not cover the OUDS Swift package's own unit
tests — see the package's own `AGENTS.md` for that.

## 1. Overview

- Library: [swift-snapshot-testing](https://github.com/pointfreeco/swift-snapshot-testing) (PointFree), currently
  pinned to `1.18.7`.
- Fixed test device: **iPhone 17 Pro simulator, iOS 26.4.1**, portrait mode, English locale, 100% text size, no
  accessibility feature enabled. Never change these without updating `.github/DEVELOP.md` and the Fastlane
  constants (`OUDS_SNAPSHOTS_TEST_DEVICE` in `DesignToolbox/fastlane/Fastfile`).
- Precision tolerances (in `XCTestCase+Snapshot.swift`): `precision = 0.96`, `perceptualPrecision = 0.97` — these are
  *global* percentages of matching pixels over the whole image, which matters a lot when combining several
  configurations into one image (see §4).
- Reference PNGs are committed to the repo under `DesignToolbox/DesignToolboxSnapshotsTests/__Snapshots__/...` and
  compared against on every run.

⚠️ **Volumetrics matter**: as of writing this suite holds tens of thousands of reference PNGs across hundreds of MB.
Always think about how many reference images a new test (or a new variant on an existing test) will add, and prefer
the `SnapshotGrid` pattern (§4) over one dedicated image per configuration whenever an axis is purely combinatorial
and not worth a standalone reference image.

## 2. Project structure

```
DesignToolbox/DesignToolboxSnapshotsTests/
├── XCTestCase+Snapshot.swift        // assertIllustration(...) — the central snapshot helper
├── OUDSTheme+Name.swift             // OUDSTheme.name, used to build file names
├── UIUserInterfaceStyle+extension.swift
├── SnapshotGrid.swift               // Reusable grid layout for combinatorial axes (see §4)
└── __Snapshots__/
    ├── Components/
    │   ├── Test Cases/Components/<Family>/<Component>SnapshotsTestsTestCase.swift
    │   │   // Abstract XCTestCase subclass: shared test logic, parametrized by theme
    │   │   └── __Snapshots__/<Component>SnapshotsTestsTestCase/*.png  // reference images
    │   ├── OrangeTheme/Components/<Family>/OrangeTheme+<Component>SnapshotsTests.swift
    │   ├── OrangeCompactTheme/Components/<Family>/OrangeCompactTheme+<Component>SnapshotsTests.swift
    │   ├── SoshTheme/Components/<Family>/SoshTheme+<Component>SnapshotsTests.swift
    │   └── WireframeTheme/Components/<Family>/WireframeTheme+<Component>SnapshotsTests.swift
    │       // Each theme subclass just calls the abstract test case's methods with its own theme
    └── Tokens/... // same split pattern for token snapshot tests (colors, fonts, spaces, etc.)
```

Key idea: **one abstract test case per component**, holding all the parametrization logic (loops over
appearance/layout/size/etc. and the `assertIllustration` calls), and **one thin subclass per theme** that just
provides a `theme: OUDSTheme` instance. Reference PNGs live under the abstract test case's own `__Snapshots__`
subfolder (not per theme-subclass), since the theme is encoded in the file name, not the folder structure.

## 3. Naming convention

Each reference image name is built from two parts, both computed in the abstract test case:

- `testName` (passed to `assertIllustration(..., testName:)`): usually
  `"test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"`.
- `name` (passed as `named:`): the remaining axes that are *not* folded into a `SnapshotGrid`, e.g.
  `appearance`, `layout`, `size`, `surface`, theme tuning flags (e.g. `_Rounded`).

Example (Button, current convention): `test_OrangeTheme_Light.Text_Default_Default.png`.

Axes that *are* folded into a `SnapshotGrid` (see §4) must **not** appear in the file name anymore — they become
cell captions inside the image instead.

`OUDSTheme.name` (in `OUDSTheme+Name.swift`) and `formattedName` / `camelCase` helpers (from the app target and the
OUDS package itself) are reused here to keep names human-readable and stable.

## 4. The `SnapshotGrid` pattern (combinatorial axes)

### Why

Before this pattern, every test axis (e.g. `disabled`, `a11yContrast`, `flipIcon`, `imageMode`, `appearance`,
`layout`, `size`, `surface`, `theme`, `scheme`...) multiplied the number of reference images. For a single
component this can reach into the thousands of PNGs, which is unsustainable for the repo (size, review diffs,
CI time).

`SnapshotGrid` (in `SnapshotGrid.swift`) lets you **compose several configurations into a single reference image**,
laid out as a grid, each cell carrying a short text caption so a regression remains identifiable without leaving
the image. One `assertIllustration` call then captures the whole grid instead of one call per configuration.

### How to decide which axes to fold into a grid

Not all axes are equal. Use this rule of thumb:

- **Fold into a grid** (`SnapshotGrid` cells): axes that are purely combinatorial / defensive coverage, where a
  dedicated full-size reference image per value is not really needed to review the design (e.g.
  `disabled`/`enabled`, `a11yContrast` normal/high, `flipIcon`, `imageMode` original/template, hover/pressed
  states once added).
- **Keep as separate files** (part of the file name / `testName`): axes that define meaningfully different visual
  layouts or are the primary thing a designer/reviewer wants to see at a glance (e.g. `theme`, `color scheme`
  light/dark, `tuning`, `surface` standard/colored, `appearance`, `layout`, `size`).

This is a judgment call per component family — discuss it with the team before implementing, the same way it was
discussed for `OUDSButton` (disabled × a11yContrast × flipIcon × imageMode folded into one grid; theme / scheme /
tuning / surface / appearance / layout / size kept as separate files).

### Building a grid

```swift
import SwiftUI

// 1. Describe one cell per combination, with a short caption.
let cells: [SnapshotGridCell<AnyView>] = MyVariant.all.map { variant in
    SnapshotGridCell(caption: variant.caption) {
        AnyView(
            MyComponentTest(/* ...variant... */)
                .disabled(variant.disabled)
        )
    }
}

// 2. Assemble the grid.
let grid = SnapshotGrid(
    columns: 4,
    cellSize: CGSize(width: 140, height: 72),
    cells: cells,
    title: "\(testName).\(name)") // optional: prints the resulting file name inside the image itself

// 3. Wrap in the theme and assert exactly once for the whole grid.
let illustration = OUDSThemeableView(theme: theme) {
    grid.background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
}
assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
```

### Pitfalls already solved — reuse, don't rediscover

- **`colorSchemeContrast` is read-only** in SwiftUI's `EnvironmentValues` (no `WritableKeyPath`). You **cannot**
  do `.environment(\.colorSchemeContrast, .increased)` to force high contrast on a single cell — it won't compile.
  Use the `ContrastOverride` view (in `SnapshotGrid.swift`) instead: it wraps the cell's content in its own
  `UIHostingController` and overrides the `UITraitCollection` via
  `setOverrideTraitCollection(_:forChild:)`, exactly like `assertIllustration` already does at the root level for
  the whole image.
- **Environment does not cross `UIViewControllerRepresentable` boundaries.** Because `ContrastOverride` creates a
  nested `UIHostingController` per cell, any SwiftUI environment value injected above the grid (notably
  `OUDSThemeableView`'s `\.theme`) does **not** automatically propagate into a contrast-overridden cell. Re-inject
  `OUDSThemeableView(theme: theme) { ... }` *inside* each cell's content when using `ContrastOverride`.
- **`userInterfaceStyle` (light/dark) is unaffected**: only `accessibilityContrast` needs per-cell overriding in
  the current pattern, since light/dark is already applied once for the whole grid via `assertIllustration`'s
  `on uiStyle:` parameter, and `UITraitCollection` overrides are additive (child controllers inherit traits they
  don't explicitly override).
- **Keep grids small enough to still catch regressions.** `assertSnapshot` compares a *global* percentage of
  matching pixels over the whole image. A single fully-broken cell in a 4×4 grid is only ~6.25% of the image —
  still above the ~4% tolerance implied by `precision 0.96`, but don't push this further (e.g. don't go to 8×8)
  without re-validating that a deliberately broken token still fails the test (see §6).
- **Fixed cell size matters.** Always give `SnapshotGrid` a fixed `cellSize`, even for transparent/empty content,
  so the resulting image has a stable, reproducible size regardless of what each cell renders.

### The `title` parameter

`SnapshotGrid` accepts an optional `title: String?`, rendered at the top of the grid. Pass it the resulting file
name (`"\(testName).\(name)"`) so the image remains identifiable out of its file context (e.g. pasted into a PR
comment or a Slack thread). This is currently opt-in per call site, not automatic — decide per component whether
you want it.

## 5. Running the tests

```shell
cd DesignToolbox
bundle exec fastlane ios test_snapshots
```

Or from Xcode: open `DesignToolbox.xcworkspace`, select the `DesignToolboxSnapshotsTests` scheme, pick the
**iPhone 17 Pro** simulator (iOS 26.4.1), then Product → Test.

> [!CAUTION]
> **New tests (or new named images) fail on their first run** — swift-snapshot-testing records the reference image
> on first execution and fails that run on purpose. **Run the tests twice**: the first run generates/updates the
> missing references, the second run should pass.

Do not change the test device/simulator without updating `.github/DEVELOP.md` and the Fastfile constants — results
are not comparable across different simulators/OS versions.

## 6. Diagnosing a failure

1. Open the **Report Navigator** in Xcode (or inspect the test failure in the log) to get the attached images:
   the recorded reference, the newly captured image, and (depending on the failure) a diff.
2. For a `SnapshotGrid`-based test, the caption under each cell tells you exactly which configuration broke —
   no need to guess from pixel position alone.
3. If you deliberately changed a token/component and the new rendering is correct, delete the stale reference PNG
   (or let the tool overwrite it) and re-run twice to regenerate it. Don't hand-edit PNGs.
4. Before trusting a new `SnapshotGrid`-based test, do an empirical check once: deliberately break something (e.g.
   force a wrong color token) in one of the folded variants and confirm the test still fails. This protects against
   silently losing coverage when combining many configurations into one image.

## 7. Checklist before committing a snapshot test change

From the `DesignToolbox/` folder:

```shell
bundle exec fastlane format   # SwiftFormat
bundle exec fastlane lint     # SwiftLint — must be clean on new/changed files
```

Then build (at least) the snapshot tests target for testing to catch compile errors without needing to actually
run the suite:

```shell
xcodebuild -workspace DesignToolbox.xcworkspace -scheme DesignToolboxSnapshotsTests \
  -destination "platform=iOS Simulator,name=iPhone 17 Pro" build-for-testing
```

Finally, run the tests twice (§5) to generate/update reference images, and visually spot-check a few of them
(especially new or changed `SnapshotGrid` images: legibility of captions, grid alignment, title readability).

## 8. Adding snapshot tests for a new component or variant

1. Decide the grouping of axes **before** writing code: which axes deserve their own reference image (file name)
   vs. which are purely combinatorial and belong in a `SnapshotGrid` cell (see §4). Discuss this with the team —
   this decision drives the final image count.
2. Create the abstract `XCTestCase` subclass under
   `__Snapshots__/Components/Test Cases/Components/<Family>/<Component>SnapshotsTestsTestCase.swift`, following the
   existing pattern: public `testAll...` entry points parametrized by `theme`/`interfaceStyle`, private helper(s)
   building the illustration (possibly via `SnapshotGrid`) and calling `assertIllustration`.
3. Create the four thin theme subclasses (`OrangeTheme`, `OrangeCompactTheme`, `SoshTheme`, `WireframeTheme`) that
   just call the abstract test case's methods with their own `theme` instance — mirror the Button ones.
4. Add the new file(s) to the Xcode project (`DesignToolbox.xcodeproj/project.pbxproj`): a `PBXBuildFile`, a
   `PBXFileReference`, an entry in the relevant `PBXGroup`, and an entry in the `DesignToolboxSnapshotsTests`
   target's `PBXSourcesBuildPhase`. Validate the file afterwards with `plutil -lint project.pbxproj`.
5. Build for testing (§7) before running anything, to catch compile errors early.
6. Run the tests twice (§5), then visually review the generated images.
