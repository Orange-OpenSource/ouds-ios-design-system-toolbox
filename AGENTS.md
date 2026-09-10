---
type: ai-agent-guide
project: OUDS iOS Design System Toolbox
language: Swift
ui-framework: SwiftUI
platforms: [iOS, iPadOS, macOS, visionOS, watchOS, tvOS]
min-deployment: iOS 15.0
---

# OUDS iOS Design System Toolbox — AI Agent Guide

This is the **demo application** for the [OUDS iOS Swift Package](https://github.com/Orange-OpenSource/ouds-ios).
The package provides design tokens, themes, and SwiftUI components for Orange Group products across all Apple platforms.

## OUDS Package: Load skills first

When you write or review code that involves **OUDS tokens, themes, or components**, refer to the package's own [`AGENTS.md`](https://github.com/Orange-OpenSource/ouds-ios/blob/develop/AGENTS.md) and load the relevant **skills** first:

- **`ouds-ios-framework-usage`** — setup, shared reference, imports, themes, token namespaces, view modifiers.
- **`ouds-ios-components-<family>`** — specific component skill (`actions`, `content-display`, `controls`, `dialogs`, `indicators`, `layouts`, `navigations`).
- **`ouds-ios-guide-*`** — vocabulary, Figma-to-Swift token mapping, migration, custom themes.

Do **not** duplicate this guidance here; always reference the package's `AGENTS.md` as the source of truth.

---

## Sandbox: where to put experimental / debug / prototype code

**Rule**: whenever you need to **test something, prototype a component, debug code, experiment with a snippet, or build any throwaway UI surface**, you **must**:

1. **Propose using the built-in sandbox** to the user rather than creating ad-hoc files.
2. **Write the experimental UI code** inside the `body` of `SandboxTestView`:
   ```swift
   // DesignToolbox/DesignToolbox/Pages/Sandbox/SandboxTestView.swift
   struct SandboxTestView: View {
       var body: some View {
           // Your experimental UI here
       }
   }
   ```
3. **Flip the flag** in the same file to enable the sandbox tab:
   ```swift
   let kSandboxContainsThings: Bool = true
   ```

### Why it's safe to commit

- The entire file is wrapped in `#if DEBUG` — **never shipped in release builds**.
- Even in DEBUG, the sandbox tab is **gated at runtime** by user preference `sandboxEnabled` (toggled from the About page).
- So committing with `kSandboxContainsThings = true` is acceptable and does not pollute production.

### Do NOT

- Create parallel playgrounds, scratch views, or temporary files to test something.
- Add experimental code inside production pages (`Pages/Tokens/`, `Pages/Components/`, etc.).
- Commit `kSandboxContainsThings = true` permanently without user knowledge (though it is safe to do so temporarily).

### Suggested UX

When a user asks to "try", "prototype", "visualize", "debug", or "generate a small component", offer upfront:

> *"I can drop this into `SandboxTestView` and enable the sandbox tab in the app — would you like that?"*

**Example**: user wants to preview a custom `OUDSButton` variant → you edit `SandboxTestView.body` + set flag to `true` → user sees it in the sandbox tab.

---

## Tooling: format, lint, dead code, tests, builds

All commands below run from the `DesignToolbox/` folder (contains `fastlane/`).

**Recommended pre-commit sequence**: `format` → `build` → fix errors → `tests` → `lint`.

### Commands

| Purpose | Command |
|---|---|
| Format code (SwiftFormat) | `bundle exec fastlane format` |
| Lint code (SwiftLint) | `bundle exec fastlane lint` |
| Check dead code — iOS (Periphery) | `bundle exec fastlane ios check_dead_code` |
| Check dead code — macOS | `bundle exec fastlane mac check_dead_code` |
| Check dead code — visionOS | `bundle exec fastlane vision check_dead_code` |
| Check dead code — watchOS | `bundle exec fastlane watch check_dead_code` |
| Check dead code — tvOS | `bundle exec fastlane tv check_dead_code` |
| Unit tests (demo app) | `bundle exec fastlane ios test_unit` |
| UI tests (demo app) | `bundle exec fastlane ios test_ui` |
| Snapshot tests | `bundle exec fastlane ios test_snapshots` |
| Build debug — iOS | `bundle exec fastlane ios build_debug` |
| Build debug — macOS | `bundle exec fastlane mac build_debug` |
| Build debug — visionOS | `bundle exec fastlane vision build_debug` |
| Build debug — watchOS | `bundle exec fastlane watch build_debug` |
| Build debug — tvOS | `bundle exec fastlane tv build_debug` |
| Check for secret leaks (gitleaks) | `bundle exec fastlane check_leaks` |
| Update 3rd-party licenses (LicensePlist) | `bundle exec fastlane update_3rd_parties` |
| Generate SBOM + vulnerability scan (Syft/Grype) | `bundle exec fastlane update_sbom` |

### Notes

- **Snapshot & UI tests** target **iPhone 17 Pro simulator (iOS 26.4.1)** in portrait mode, English, 100% text size, no a11y.
- **New snapshot tests fail on first run** (tool generates the reference image) → re-run to confirm success.
- **Periphery**: use a **real device**, not a simulator; avoid local Swift Package references (causes false positives).
- **Prerequisites**: Xcode 26.4, Ruby ≥ 3.4, Fastlane ≥ 2.228, SwiftLint ≥ 0.62.2, SwiftFormat ≥ 0.58.5, Periphery ≥ 3.1.0, gitleaks ≥ 8.24.3. See `.github/DEVELOP.md` for full setup.

---

## Multi-OS: always build on all platforms

The app **must compile on all 6 platforms** (iOS, iPadOS, macOS, visionOS, watchOS, tvOS).

- Use `#if os(iOS)`, `#if os(macOS)`, etc., for platform-specific code.
- Use `#available(iOS 26, *)` for iOS 26 SDK APIs (minimum deployment: iOS 15).
- **Never use UIKit** unless strictly required for an accessibility API.
- After any code change, run at least `bundle exec fastlane <platform> build_debug` for platforms you touched. Watch, tvOS, and visionOS apps are not on TestFlight yet, but they must keep building.

---

## Critical rules

- ✅ **Throwaway/experimental UI** → always use `SandboxTestView` + set `kSandboxContainsThings = true`. Never create ad-hoc scratch files.
- ✅ **Committing the sandbox flag** → it's OK to commit `kSandboxContainsThings = true` (DEBUG-only + user toggle protects production).
- ✅ **iOS 26 APIs** → guard with `#available(iOS 26, *)` (min deployment is iOS 15).
- ✅ **Platform-specific code** → use `#if os(…)`.
- ❌ **No UIKit** unless strictly required for accessibility.
- ✅ **Commits** → follow [Conventional Commits](https://www.conventionalcommits.org/) + DCO sign-off.
- ✅ **GenAI usage** → if you used an LLM (ChatGPT, Copilot, etc.), add to commit body: `Assisted-by: <LLM name> (<product>)`. See `.github/DEVELOP.md` §Use of GenAI for details.
- ✅ **OUDS code** → load the package's `AGENTS.md` skills first; follow its rules for tokens, themes, and components.

---

## Key files

| File | Purpose |
|---|---|
| `DesignToolbox/DesignToolbox/Pages/Sandbox/SandboxTestView.swift` | Sandbox surface + `kSandboxContainsThings` flag |
| `.github/DEVELOP.md` | Full developer guide (source of truth for all development workflows) |
| `.github/CONTRIBUTING.md` | Contribution rules and review checklist |
| `.github/copilot-instructions.md` | Existing Copilot guide for architecture and best practices |
| `DesignToolbox/fastlane/Fastfile` | All CI/CD, test, and build lanes |
| `.swiftformat` / `.swiftlint.yml` | Code style configuration |
| `Gemfile` / `Gemfile.lock` | Ruby dependencies (Fastlane, etc.) |
| `Settings.bundle/` | App settings, About page, and runtime toggles (e.g., sandbox enable switch) |

---

## External references

- **OUDS iOS Swift Package**: https://github.com/Orange-OpenSource/ouds-ios
- **OUDS iOS `AGENTS.md`** (package skills & rules): https://github.com/Orange-OpenSource/ouds-ios/blob/develop/AGENTS.md
- **Orange Unified Design System** (global): https://unified-design-system.orange.com/
- **Swift documentation** (OUDS components): https://ios.unified-design-system.orange.com/
