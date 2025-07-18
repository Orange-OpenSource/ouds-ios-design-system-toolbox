# Developer guide

- [Technical preconditions](#technical-preconditions)
- [Embed the OUDS iOS library](#embed-the-ouds-ios-library)
  * [Use as dependency](#use-as-dependency)
  * [Use local reference](#use-local-reference)
- [Build Design System Toolbox](#build-design-system-toolbox)
- [Documentation](#documentation)
- [Run tests](#run-tests)
  * [Unit tests for OUDS Swift package](#unit-tests-for-ouds-swift-package)
  * [Snapshots tests in demo app](#snapshots-tests-in-demo-app)
  * [UI tests in demo app](#ui-tests-in-demo-app)
  * [Unit tests in demo app](#unit-tests-in-demo-app)
  * [Manual tests using demo app](#manual-tests-using-demo-app)
- [Build phases](#build-phases)
- [Targets](#targets)
- [Certificates, profiles and identifiers](#certificates-profiles-and-identifiers)
- [Update dependencies with Renovate](#update-dependencies-with-renovate)
- [Developer Certificate of Origin](#developer-certificate-of-origin)
- [Commits, changelog, release note, versioning](#commits-changelog-release-note-versioning)
  * [About commits](#about-commits)
  * [About release note and changelog](#about-release-note-and-changelog)
- [Secret leaks](#secret-leaks)
- [Linter](#linter)
- [Formater](#formater)
- [Dead code](#dead-code)
- [Software Bill of Materials](#software-bill-of-materials)
- [Update of dependencies](#update-of-dependencies)
- [Update 3rd parties](#update-3rd-parties)
- [CI/CD](#cicd)

## Technical preconditions

> [!IMPORTANT]
> You should check wether or not you have the tools in use in the project like Fastlane, SwiftLint, SwiftFormat, etc.
> You can have a look for example in the THIRD_PARTY.md file which lists any dependencies and tools we use at different levels (SDK, design system toolbox app, project).
> Have a look on the locks file to know which versions we are using (Podfile, Podfile.lock, Gemfile, Gemfile.lock, etc.).

> [!IMPORTANT]
> We use a lot Fastlane for its automatic features and also to wrap to Shell command lines in order to have the same command to trigger
> for both the design ssytem toolbox app and the OUDS Swift package.

If some tools are missing, pick the suitable command line below and check versions:
```bash
# Get updated RubyGems
gem update --system 3.6.7

# Install bundler (at least 2.6.7)
gem install bundler

# Install rbenv (at least 1.3.2)
brew install rbenv

# Use Bundler to install a major part of dependencies (thanks to Gemfile and Gemfile.lock files)
bundle install

# Use CocoaPods to install other dependencies not available as rubygems (thanks to Podfile and Podfile.lock files)
bundle exec pod install --repo-update

# Update your references
brew update

# Fastlane (at least 2.228.0)
brew install fastlane

# For Periphery (https://github.com/peripheryapp/periphery) for dead code hunt (at least 3.1.0)
# If you used Periphery V2 before, follow their migration guide: https://github.com/peripheryapp/periphery/wiki/3.0-Migration-Guide
brew install periphery

# For gitleaks (https://github.com/gitleaks/gitleaks) for secrets leaks hunt (at least 8.24.3)
brew install gitleaks
# or `brew reinstall gitleaks` to get updates if old version installed

# For SwiftLint (at least 0.59.1)
brew install swiftlint
# or `brew reinstall swiftlint` to get updates if old version installed

# For SwiftFormat (at least 0.52.4)
brew install swiftformat
# or `brew reinstall swiftformat` to get updates if old version installed

# For xcodes (at least 1.5.0)
brew install xcodesorg/made/xcodes
# or `brew reinstall xcodesorg/made/xcodes` to get updates if old version installed

# For git-cliff (at least 2.8.0)
brew install git-cliff


# For Syft (at least 1.26.1)
brew install syft

# For Grype (at least 0.92.2)
brew tap anchore/grype
brew install grype

# For LicensePlist (at least 3.27.1)
brew install licenseplist
```

Ensure you have the suitable _Ruby_ version. We recommend the use of [rbenv](https://github.com/rbenv/rbenv) to load the suitable version of ruby.

> [!TIP]
> We use here Ruby 3 (>= 3.4).

If you are not used to this tool:

```shell
# List available local versions of Ruby
rbenv install --list

# Apply the expected x.y.z version of Ruby (if listed previously with the command above)
rbenv global 3.4.0

# If you don't have the expected x.y.z version of Ruby, run:
# >  brew update && brew upgrade ruby-build
# >  rbenv install x.y.z
# then 
# >  rbenv global x.y.z

# Check Ruby version
ruby --version
```

We use also for our GitLab CI runners **Xcode 16.3**, we suggest you use this version or newer if you want.

> [!IMPORTANT]
> Xcode 16.3 and Swift 6 are used for this project. You must use this configuration.
> Not retrocompatibility is planned.

## Embed the OUDS iOS library

### Use as dependency

You can refer in your project to the OUDS iOS Swift Package by adding a package dependency.
Use the GitHub project Orange-OpenSource/ouds-ios (e.g. from URL https://github.com/Orange-OpenSource/ouds-ios/).
Then use the dependency rule you want (branch, versions, etc). If you want a specific release tag, [have a look on the releases list](https://github.com/Orange-OpenSource/ouds-ios/releases).
Do not forget to add the package products in your target.

### Use local reference

For debugging purposes, you can also use an Xcode local reference of the project.
First, clone the OUDS iOS Swift Package repistory.
Then, select your folder from *Finder* and move to the project in Xcode in your project pane, choosing *Reference files in place*.
You will have then the project stored elsewhere reference in your project and which can be easily debugged.
You should not add in your VCS tool the *{$PROJET}.xcworkspace/contents.xcworkspacedata* file containing the local references.

## Build Design System Toolbox

To build the demo application follow those steps:

1. `cd DesignToolbox`
2. `bundle exec pod install`
3. Open *DesignToolbox.xcworkspace*
4. Select *DesignToolbox* scheme
5. Build and run the Application on your device ou simulator

> [!TIP]
> You can also move the folder containing a clone of the [Swift package repository](https://github.com/Orange-OpenSource/ouds-ios) from the *Finder* to the design system toolbox Xcode project so as to have a local reference of the package in this demo app.

> [!TIP]
> For consistancy reasons, when you work on a dedicated branch on the Swift Package repository and need to have a dedicated branch in the design system toolbox app, you should create a branch from the issue in GitHub and (creating then a branch in the package repository) and create a branch with the same name in the design system toolbox app repositoy. Thus with two repositories we will be able to find easily the suitable branches because the names are the same. Because issues are disabled in the design system toolbox repository, there is no wories to have to refer to issues numbers in the branch names.

## Documentation

The documentation is based on the Swift documentation with [DocC](https://www.swift.org/documentation/docc/).
Documentation catalogs / archives can be generated through Xcode with _Product > Build Documentation_.

The `generateWebDocumentation.sh` script helps to build the HTML version of documentation and compress it in ZIP file, and also can update
the online version based on [_GitHub Pages_](https://pages.github.com/), this version is hosted in the [*gh-pages* GitHub branch](https://github.com/Orange-OpenSource/ouds-ios/tree/gh-pages).

## Run tests 

### Unit tests for OUDS Swift package

You can, from the design system toolbox project, if you referenced the OUDS package with a local repository reference before, run the unit tests of the OUDS package.
To do that, select the scheme *OUDS-Package* and in the tests navigator run the tests.

### Snapshots tests in demo app

The snapshots tests are made to test the rendering of the components and tokens, i.e. their look and feel.

To run these snapshots tests follow some steps:
1. `cd DesignToolbox`
2. `bundle exec pod install`
3. Open *DesignToolbox.xcworkspace*
4. Select *DesignToolboxSnapshotsTests* scheme
5. Select *iPhone 16 Pro (18.4)* simulator (the device used to tests and views rendering)
6. Run tests (Product -> Test)

Or run in terminal:
```shell
bundle exec fastlane ios test_snapshots
```

> [!CAUTION]
> Beware, if you add new UI tests using swift-snapshot-testing (https://github.com/pointfreeco/swift-snapshot-testing) library, you may have new tests which fail at first time.
> Indeed for new tests the tool makes snapshots of the views, thus for the first run no previews exist making the tests fail. You should run the tests twice for new tests.

Such tests here are used to as to be sure the look and feel of any components and tokens rendering remain the expected ones.

Any interface modifications require regenerating the illustrations using the tool, i.e. run the tests twice. The reference illustrations have already been saved within the project.

> [!IMPORTANT]
> The device under tests is a simulator of iPhone 16 Pro (18.4), in portrait mode, with no a11y feature enabled, and a text size of 100% in english mode.

#### How to use to use swift-snapshot-testing library

1. Locate where are the reference images:
    - In the Package directory, you will find the reference screenshots for the Orange theme (Light/Dark), which will serve as comparison baselines.
    ```text
    OUDS -> DesignToolbox -> DesignToolboxSnapshotsTests -> __Snapshots__
    ```
2. Navigate to the project :
    - Open your project in Xcode and go to a directory containing tests (e.g. here *OUDSTokensOpacityUITests*):
    ```shell
    DesignToolbox -> DesignToolboxSnapshotsTests -> OUDSTokensOpacityUITests -> OUDSTokensOpacityUITests.swift
    ```
3. Open a test file (e.g. here *OUDSTokensOpacityUITests*):
    - Open the file `OUDSTokensOpacityUITests.swift`.
4. Run the snapshot test (success):
    - Locate and execute some function like `testAllOpacitiesOrangeThemeLight()`.

      <img width="897" alt="OrangeThemeLight_OpacityTest_Success" src="https://github.com/user-attachments/assets/550bed90-6bc9-4d68-aaf0-8e04de35d916">
 
The snapshot tool fetched the reference image to compare it against the current screen and detected no differences, resulting in a success

5. Run the snapshot test (failure):
    - We will deliberately change the image by setting the `OpacityOpaque` token to `OpacityInvisible` in class `OpacityTokenPage.swift`

      <img width="561" alt="IntentionalTokenModification" src="https://github.com/user-attachments/assets/1d138b7b-2998-40b7-bf39-d9a597ced6c0">
    - Test result failure :

    <img width="897" alt="IntentionalUITestError" src="https://github.com/user-attachments/assets/0a6bb578-adba-42f1-abe8-e2f50ddba2a7">

   The *swift-snapshot-testing tool* indicates that the issue originates from the transparent token illustration. We can observe that there are two paths: the first corresponds to our reference illustration (the one we intend to base our comparison on), while the second path is the illustration used for the current image of the application. You can open both paths and visually compare the differences.

7. Verify the output:
    - It is recommended to use the `Show the Report Navigator` tool in Xcode :

    <img width="512" alt="ShowReportNavigator_Xcode" src="https://github.com/user-attachments/assets/8d866d79-5dfc-46c7-934e-8d03ec1fc667">

    - In Xcode go to :

    ```text
    DesignToolboxSnapshotsTests -> DesignToolboxSnapshotsTests/DesignToolboxSnapshotsTests
    ```

    <img width="1206" alt="TestResult_Failed_testAllOpacitiesOrangeThemeLight" src="https://github.com/user-attachments/assets/1793df83-ffc1-4226-8be2-fbd7e2b71deb">

8. Comparison (reference and failure):
   
   **Reference:**

    <img width="1307" alt="OpacityReferenceImage" src="https://github.com/user-attachments/assets/493dabde-4139-468f-a57b-10ee5a5269c1">


   **Failure:**

   <img width="1364" alt="OpacityFailureImage" src="https://github.com/user-attachments/assets/03cfe17f-3752-4aba-a482-f89d3b89f53d">

### UI tests in demo app

The project contains some UI tests made to test the behavior of components.

To run these UI tests follow some steps:
1. `cd DesignToolbox`
2. `bundle exec pod install`
3. Open *DesignToolbox.xcworkspace*
4. Select *DesignToolboxUITests* scheme
5. Select *iPhone 16 Pro (18.4)* simulator (the device used to tests and views rendering)
6. Run tests (Product -> Test)

Or run in terminal:
```shell
bundle exec fastlane ios test_ui
```

### Unit tests in demo app

The project contains some unit tests made to test the behavior of some utils in demo app.

To run these UI tests follow some steps:
1. `cd DesignToolbox`
2. `bundle exec pod install`
3. Open *DesignToolbox.xcworkspace*
4. Select *DesignToolboxUnitTests* scheme
5. Run tests in left pane (target *DesignToolboxUnitTests*)

Or run in terminal:
```shell
bundle exec fastlane ios test_unit
```

### Manual tests using demo app

Do not forget to make manual tests of the library using the design system toolbox app!
Indeed some features like *Voice Over*, *dynamic fonts*, high contrast and motion managements, or color contrasts, are hardly testable automatically.
These types of tests should be done manualy with for example the help of the [Accessibility Inspector](https://developer.apple.com/documentation/accessibility/accessibility-inspector).

## Build phases

The project contains several custom build phases so as to automatize several steps:

1. _SwiftLint_ will run the linter on the sources

Note that sources headers are defined in *IDETemplateMacros.plist* inside *DesignToolbox/DesignToolbox.xcworkspace/xcshareddata*

## Targets

The Xcode project contains two targets:

1. _DesignToolbox_ for the demo application
2. _Periphery_ to look for dead code in the source code
3. _DesignToolboxSnapshotsTests_ for UI tests in demo app

## Certificates, profiles and identifiers

We choose to use Xcode automatic signing for debug builds of the app so as to make easier onboarding of newcomers in development team, and also to prevent to update provisioning profiles with individual developers certificates each team someone wants to build the app and also to prevent to register each new build device. You may need to be part of our team if you want to build in debug mode.
Note the bundle identifier here for local builds is **com.orange.ouds.demoapp-debug**, with a **-debug** suffix so as to prevent any local build to be replaced by TestFlight builds which have **com.orange.ouds.demoapp** identifiers.

However for release builds we use a dedicated _provisioning profile_ built with of course a _distribution certificate_(.p12 format with private key, not .cer) and the _bundle identifier_ `com.orange.ouds.demoapp` for our _Apple Team_ `France Telecom (MG2LSJNJB6)`. Thus you won't be able to build and sign in release mode without this provisioning profile and this distribution certificate. These elements are stored in our local GitLab CI runners and must not be available outside.

You can find more details [in the wiki](https://github.com/Orange-OpenSource/ouds-ios/wiki/53-%E2%80%90-About-Apple-magic).

## Update dependencies with Renovate

Sometimes dependencies should be updated, with for example warnings of [Renovate bot](https://github.com/apps/renovate).

Here is the list of files to update to keep the project clean:
- CHANGELOG (to note for releases the update of the version)
- Of course, update and save in your VCS the new states of the _Podfile_, _Package.swift_ or _Gemfile_ for example (and do not forget locks!)

Maybe you will need to update your pods repo before if you updated a Pod:

```shell
bundle exec pod install --repo-update
```

## Developer Certificate of Origin

A [GitHub Action bot](https://probot.github.io/apps/dco/) has been plugged in the repository so as to check wether or not the DCO is applied for commits.

## Commits, changelog, release note, versioning

### About commits

#### Convention commits rules

Try as best as possible to apply [conventional commits rules](https://www.conventionalcommits.org/en/v1.0.0/).
Keep in mind to have your commits well prefixed, and with the issue number between parenthesis at the end, and also if needed the pull request issue number.
If your commits embed contributions for other people, do not forget to [add them as co-authors](https://docs.github.com/fr/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors).
All of you should also comply to DCO.

Your commit message should be prefixed by keywords [you can find in the specification](https://www.conventionalcommits.org/en/v1.0.0/#specification):
- `fix:`
- `feat:`
- `build:`
- `chore:`
- `ci:`
- `docs:`
- `style:`
- `refactor:`
- `perf:`
- `test:`

You can add also ! after the keyword to say a breaking change occurs, and also add a scope between parenthesis like:
- `feat!:` breaking change because..
- `feat:` add something in the API...

A *Git commit-msg hook* is also defined in the project. It will run *Shell* codes to check if rules defined in the hook are respected before commit being pushed.
The hook is degined in **.git-hook/commit-msg**.

To apply it, run in your project (e.g. once cloned):

```shell
git config --local --add core.hooksPath .git-hooks
```

#### Chain of responsability

We can add metafields picked from [this good guideline](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n525) in the commit messages.
This is not mandatory (yet) but a good practice and quite interesting to know who reviewed and validated what.
You must mention *co-authors* (*Co-authored-by*). You should add who are code reviewers (*Reviewed-by*), evolutions testers (*Tested-by*) and if needed ackers (*Acked-by*).

For example, for issue n°123 and its pull request n°456, tested by Anton, Maxime, Jérôme and Pierre-Yves and Benoit, reviewed by Ludovic, authored by Tayeb and Pierre-Yves, and acked by Stephen:
```text
refactor: update some things colors and design of the demo app (#123) (#456)

Some things have been refactored to make incredible things.

Tested-by: Anton Astafev <anton.astafev@orange.com>
Tested-by: Benoit Suzanne <benoit.suzanne@orange.com>
Tested-by: Maxime Tonnerre <maxime.tonnerre@orange.com>
Tested-by: Jérôme Régnier <jerome.regnier@orange.com>
Tested-by: Pierre-Yves Ayoul <pierre-yves.ayoul@orange.com>
Reviewed-by: Ludovic Pinel <ludovic.pinel@orange.com>
Acked-by: Stephen McCarthy <stephen.mccarthy@orange.com>
Co-authored-by: Tayeb Sedraia <tayeb.sedraia@orange.com>
Co-authored-by: Pierre-Yves Lapersonne <pierreyves.lapersonne@orange.com>
Signed-off-by: Tayeb Sedraia <tayeb.sedraia@orange.com>
Signed-off-by: Pierre-Yves Lapersonne <pierreyves.lapersonne@orange.com>
```

> [!TIP]
> Keep things clear and sorted. If people worked on your commits, mention them if relevant.

#### Integration of tokenator updates

You should refer to the [dedicated page in the wiki for more details](https://github.com/Orange-OpenSource/ouds-ios/wiki/20-%E2%80%90-How-to-update-tokens).

Keep in mind the commit adding *tokenator* updates in the codebase must be formatted like

```text
chore(🤖): update `OpacityRawTokens` (tokenator generation 20241021134644) (#225)
``` 

i.e. precise the tokens updated, the *tokenator* generation timestamp and the pull request number.

If you know what is the token library version, add it in the commit body, like:
```text
chore(🤖): update `OpacityRawTokens` (tokenator generation 20241021134644) (#225)

Tokens library v0.4.1
``` 

### About release note and changelog

We try also to apply [keep a changelog](https://keepachangelog.com/en/1.0.0/), and [semantic versioning](https://semver.org/spec/v2.0.0.html) both with [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/).

We can generate a `RELEASE_NOTE.md` file using the Git history and [git cliff](https://git-cliff.org/) tool.
Today we update the unique CHANGELOG manualy, but you can find [in the wiki more details about the use of git-cliff](https://github.com/Orange-OpenSource/ouds-ios/wiki/52-%E2%80%90-About-changelog,-release-notes-and-hooks)

To generate a release note:

```shell
git-cliff --config .github/cliff.toml --output RELEASE_NOTE.md X..Y
```

> [!Tip]
> X can be a commit hash or the last tag for example. Y should be HEAD. Run this comman on main branch.

## Secrets leaks

[Gitleaks](https://gitleaks.io/) can be used to check if secrets can be leaked or not.
A [GitHub Action](https://github.com/gitleaks/gitleaks-action) has been integrated to the repository with a configuration file defined in _/github/workflows_ named _gitleaks-action.yaml_.
It will launch the _Gitleaks_ tool automatically.

However this tool does not detect plain API key mixed in URL, that is a reason why _Gitleaks_ can be called in a pre-commit hook, using the _giteaks.toml_ at the root of the project.
To call _Gitleaks_ in pre-commit hooks, create a file named **pre-commit** inside _.git/hooks_ (then run `chmod u+x` in the file).
Then place the bash code below in this file:
```bash
# Run Gitleaks before commits
echo "Running pre-commit hook: Use of gitleaks"
gitleaks detect -v -l debug --source .

# If the command fails, prevent the commit
if [ $? -ne 0 ]; then
  echo "Pre-commit hook failed. Aborting commit."
  exit 1
fi
```

Or just run when you want the command:

```shell
bundle exec fastlane check_leaks
```

> [!CAUTION]
> It can increase yout git flow time if your run this command in pre-commit stage

Note that we face some issues about the use of _Gitleaks GitHub Action_ and _Gitleaks_ as CLI command, for fur further details see [#131](https://github.com/gitleaks/gitleaks-action/issues/131), [#132](https://github.com/gitleaks/gitleaks-action/issues/132) and [#1331](https://github.com/gitleaks/gitleaks/issues/1331).

Remember _Gitleaks_ is also used in GitHub project side thanks to the [dedicated GitHub Action](https://github.com/marketplace/actions/gitleaks) but these controls are done online once commits have left the local environment.

## Linter

We use [SwiftLint](https://github.com/realm/SwiftLint) in this project so as to be sure the source code follows defined guidelines for the syntax and other points.
There is a build phase in _Xcode_ to be sure you don't keep and submit warnings.

We provide a command to run _SwiftLint_:
```shell
bundle exec fastlane lint
```

**In most of cases you must fix warnings, or explain why in your commits and pull request comments you choose to disable them.**

Today, only in very few cases some _SwiftLint_ warnings are disabled at files (or lower) level:
- in tests classes
- in files containing tokens which will be generated
- in tokens providers

The warnings which can be disabled for token files: 
- *missing_docs*: because tokens will be generated without documentation by the tokenator
- *identifier_name*: because the name of the tokens are defined in *Figma* and strongly related to the design system, and in they can be long
- *line_length*: because tokens definition can take a lot of place
- *file_length*: because the files containing declarations or definitions of tokens can be very long

The warnings which can be disabled for test classes files and mocks files:
- *identifier_name*: because of length of tokens names 
- *type_name*: because stringly related to the types under test, which can have a long name
- *line_length*: because of length of tokens names
- *file_length*: because of the amount of tokens to test
- *type_body_length*: because we can have a lot of tests to do
- *function_body_length*: because we can have function with a lot of assertions
- *force_try*: because we can need tod efine some configuration variable we are sure they work (like regxp)
- *required_deinit*: because we do not need to manage init and deinit of test classe
- *implicitly_unwrapped_optional*: because for declaration of themes to test we bang!

Do not forget if possible to enable the warnings in the end of the file to reduce as much as possible the scope of the disabled warnings. Disable warnings only if needed.

## Formater

We use [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) to format sources and keep them clean. This tool is use in Xcode build phase.
You can run *SwiftFormat* in CLI:

```shell
bundle exec fastlane format
```

A *Git pre-commit hook* is also defined in the project. It will run *SwifFormat* before the commit so as to be sure the sources will be well formatted before being pushed.
The hook is degined in **.git-hook/pre-commit**.
To apply use, run in your project (e.g. once cloned):

```shell
git config --local --add core.hooksPath .git-hooks
```

## Dead code

We use [Periphery](https://github.com/peripheryapp/periphery) to look for dead code and help developers to track it and remove it.
This tool is run in CI/CD side and can be run localy using *Fastlane*:

And run:
```shell
bundle exec fastlane check_dead_code
```

You can also in Xcode run from the *Periphery* scheme so as to make a scan.

> [!CAUTION]
> Use a real device and not a simulator. In addition, do not use local reference of OUDS iOS Swift Package as many false-positive warnings can rise; us branch version instead.

## Software Bill of Materials

For software quality reasons, intellectual property compliance, users trust and legal oblgitations with Cyber Resilience Act (CRA) and NIS2, it it interesing or mandatory to keep updated a Software Bill Of Materials (SBOM). And with such file listing dependencies in several levels we are able to make scans of them and check if there are known vulnerabilities.

To do these operations, we use [Syft](https://github.com/anchore/syft) to generate a SBOM in SPDX JSON format, which will processed by [Grype](https://github.com/anchore/grype) to check if there are known vulnerabilities.

These operations, triggered in CLI, are wrapped in a Fastlane command:

```shell
bundle exec fastlane update_sbom
```

You may need to udpate *grype* before so as to use an updated database for vulnerabilities checks:
```shell
brew install grype
```

## Update of dependencies

 > [!TIP]
 > It is important to keep updated dependencies for its softwar,e but some steps must be processed carefully.

To update dependencies of the project, supossing *Renovate* for example provides pull requests:
- Check the new version of the dependency to update: is a a major release? minor? bug fix? Does it bring breaking changes? Does it fix vulnerabilities?
- Have a look on the dependency release note or changelog to get enough details
- Check in a dedicated branch if the CI/CD works fine still
- Check if there is no issues or troubles with this new version (update of license, unstabilities, etc.)
- Get the updates
- Update the changelog
- Update the SBOM
- Make a nice commit message (e.g. `chore(deps):`) for the merge

## Update 3rd parties

The design ssytem toolbox application relies on some third-party components. Due to legal obligations we must or only should list the licenses and credits of such components. In fact, it is a best practice to list all open source components in use.
To do that, we use [LicensePlist](https://github.com/mono0926/LicensePlist) project which can forge for a *Settings bundle* the assets with the list of detected third-party components, theirs licences and source-code reference.

To generate the files to copy/paste, run:
```shell
bundle exec fastlane update_3rd_parties
```

## CI/CD

### GitHub Action

We use *GitHub Actions* so as to define a workflow with some actions to build demo application and test the library.
It will help us to ensure code on pull requests or being merged compiles and has all tests green.
Workflows are the following:
- [build and run UI and snapshots tests](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/develop/.github/workflows/build-and-test.yml)
- [check if there are secrets leaks](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/develop/.github/workflows/gitleaks.yml).
- [check if there are localizations troubles](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/develop/.github/workflows/swiftpolyglot.yml)
- [check if there is dead code](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/develop/.github/workflows/periphery.yml)
- [run linter](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/develop/.github/workflows/swiftlint.yml)

We use also two GitHub apps making controls on pull requests and defining wether or not prerequisites are filled or not.
There is one control to check if [PR template are all defined ](https://github.com/stilliard/github-task-list-completed), and one if [DCO is applied](https://probot.github.io/apps/dco/).

Finaly we have [this *GitHub Action*](https://github.com/cirruslabs/swiftlint-action) using _SwiftLint_ to ensure no warnings are in our codebase.

### GitLab CI (internal)

We use *GitLab CI*,for CI/CD with our own runners so as to keep private our sensitive files likes certificates and provisioning profiles.
Our current plan does not allow to make GitHub mirroring, so we use GitHub HTTP REST API to download sources, before using Xcode to build and sign.
However of course you will have to define all the variables, secrets and have the mandatory files.

You can find more details about the pipelines, how to set up runners and scripts to use [in the wiki](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/wiki/51-%E2%80%90-About-continuous-integration-and-delivery).

In few words, there is a pipeline containing some stages and HIRDjobs to build alpha, nightly/beta and production releases.
