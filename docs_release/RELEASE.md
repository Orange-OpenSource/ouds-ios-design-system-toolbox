# Design System Toolbox iOS release guide

This file lists all the steps to follow when releasing a new version of Design System Toolbox iOS app.

- [Make earlier release](#make-earlier-release)
- [Release OUDS iOS Swift Package](#release-ouds-ios-swift-package)
- [Prepare release](#prepare-release)
- [Release](#release)
  * [Publish release to GitHub](#publish-release-to-github)
- [Prepare Next Release](#prepare-next-release)

## Make earlier release (alpha, beta, release candidate)

You comply with [semantic versioning rules](https://semver.org/).
Choose the type of early release you want:
- If you think the current *develop* code base will be almost equal to the next release make a *release candidate* (prefered)
- If your users need a beta version and ask for it, make a *beta release*
- If your users need an alpha version and ask for it, make a *alpha release*

These tags must be done on *develop* branch.

> [!TIP]
> For example, given a future xxy.z. version 1.2.3, 
> a release candidate n°1 will be tagged 1.2.3-rc.1,
> a beta n°1 will be tagged 1.2.3-beta.1,
> an alpha n°1 will be tagged 1.2.3-alpha.1

The *snapshot* tag (x.y.z-SNAPSHOT) is not used in this project.

The actions to do are:
- update the SBOM
- update the 3rd parties
- define the tag on *develop* branch depending to what should be the next release

> [!CAUTION]
> These notions of alpha and beta releases are not the same as
> the alpha builds (i.e. build a feature branch without tags) and
> the beta builds (i.e. in OUDS context nightly builds tagged with "ci" and "Test_Flight" sufixes)

## Release OUDS iOS Swift Package

> [!IMPORTANT]
> You must make a release of the OUDS iOS Swift Package library before releasing the Design System Toolbox app.

When the release is done according to the [process described in its project](https://github.com/Orange-OpenSource/ouds-ios/tree/develop/docs_release), change the package dependency of the app and use the suitable tag as version, i.e. point to the tag / version and not the branch. Update the package using Xcode to be sure the *Package.resolved* is updated.

Keep in mind the internal GitLab runners use tricks to check if things evolved to make builds ; so if you don't version any dependency or files changes nothing will be done.

## Prepare release

> [!TIP]
> We use here CLI for Git operations, but of course you are free to use GUI tools

- Create a branch named `prepare-release` to prepare the new release for Design System Toolbox iOS version X.Y.Z.

    ```shell
    git checkout -b prepare-release develop
    ```

- Switch to this branch and apply following changes:
    
    - Update the changelog.

    ```
    \## [Unreleased]\(https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/P.Q.R...develop)
    ```
     to

    ```
     \## [X.Y.Z]\(https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/P.Q.R...X.Y.Z) - YYYY-MM-dd
    ```
    where P.Q.R is the previous version tag, X.Y.Z the version we are releasing, and YYYY-MM-dd the date.

    - Ensure the marketing version defined in Xcode is updated with the new X.Y.Z

- Check the app points to the suitable tag for OUDS iOS dependency (e.g. supposed to be some X.Y.Z exact version) ; if not, fix it

- Update the list of third-party components embeded in the app to keep up-to-date the list of the versions in use ; you must see changed in the *Settings.bundle*

```shell
bundle exec fastlane update_3rd_parties
```

- Update the SBOM

```shell
bundle exec fastlane update_sbom
```

>[!IMPORTANT]
> Keeping up-to-date the SBOM and check for vulnerabilities is important for both software quality, users trust and legal obligations like the *Cyber Resilience Act* or *NIS2*.

- Verify the changes mentioned above, then commit and push.

- Create a new pull request named `Prepare release X.Y.Z` on GitHub to merge your branch into `develop`.

- Review and merge this pull request on GitHub using **squash and merge commits strategy**.<br /><br />

## Release

- Create a new pull request named `Release X.Y.Z` on GitHub to merge `develop` into `main`. Add in the description the CHANGELOG for this new version. Thus GitHub will automatically make the links and display the PR in the mentioned issues.

- Review and merge this pull request on GitHub. The merge strategy must be a **simple merge without squash of commits**, i.e. "create a merge commit". 

> [!NOTE]
> In fact rebase should be used to align feature branches with default one, and squash should be used when needed for work branches. 

In the _merge commit_ message add the changelog, the authors and the details. Thus GitHub makes links automatically between commits, PR and GitHub issues. To do that, copy/paste the content of the changelog (after the version line) and uncomment (i.e. remove # symbols) lines. Thus if in the commit message body any issue is referenced, it will appear in the associated issue. Do not forget also to add people as co-authors if needed. **Remember, do not squash nor rebase but only merge commit**.

Below is an example of what should be a merge commit in `main` branch for a release (ignore of course // lines, see [this commit for example](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/commit/b43d4c70453fd1606e8f526d9e59d70a34654419)). You can also precise the tokens library version and the OUDS iOS Swift Package version:

```text
Version 0.17.0 (#666) // [DO NOT ADD THIS COMMENT] <--- Commit title, #666 is PR nummber for the design toolbox project, GitHub suggests it

// [DO NOT ADD THIS LINE] Below is commit body, keep an empty line
Release of version 0.17.0
Embeds OUDS iOS Swift Package v0.17.0
Embeds token libraries:
- Core OUDS version: 1.3.0
- Core Orange version: 1.1.0
- Brand Orange version: 1.3.0
- Core Sosh version: 1.1.0
- Brand Sosh version: 1.3.0
- Core Wireframe version: 1.0.0
- Brand Wireframe version: 1.1.0
- Brand Orange Business Tools version: 1.3.0
- Brand Orange Inverse version: 1.3.0

See below the full CHANGELOG details.

// [DO NOT ADD THIS LINE] Keep also an empty line above
// [DO NOT ADD THIS LINE] And copy/paste changelog without # for the sections entries
// [DO NOT ADD THIS LINE] Do not forget to reference properly the issues in ouds-ios
Added:
- Add UI regression tests using snapshot comparisons with *swift-snapshot-testing* tool (Orange-OpenSource/ouds-ios#42)
- Display fake components for elevation rendering tests

Changed:
- Improve translations (Orange-OpenSource/ouds-ios#118)

Removed:
- Remove some screen (Orange-OpenSource/ouds-ios#712)

Fixed:
- About menu item (Orange-OpenSource/ouds-ios#218)

// [DO NOT ADD THIS LINE] Add in co authors anyone working on the commits being merged, add the ones who contributed (copy-paste if too lazy, use the ones you need)
Co-authored-by: Benoit Suzanne <benoit.suzanne@orange.com>
Co-authored-by: Pierre-Yves Lapersonne <pierreyves.lapersonne@orange.com>
Co-authored-by: Ludovic Pinel <ludovic.pinel@orange.com>
Co-authored-by: boosted-bot <boosted-bot@users.noreply.github.com>
Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
```

### Publish release to GitHub

- Go to [GitHub Releases](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/releases).

- Click on `Draft a new release`.

- Create a new tag X.Y.Z (following semantic versioning principles)

- Add release notes and verify using the preview tab. Use *git-cliff* to build the release note to copy/paste in the release description

    ```shell
    git-cliff --config .github/cliff.toml --output RELEASE_NOTE.md X..Y
    ```

> [!TIP]
> X can be a commit hash or the last tag for example.
> Y should be HEAD.
> Run this comman on main branch.

- Optionally check `Set as a pre-release` and click `Publish release`, otherwise create the release.

- Launch a job on your runner to build the demo application

- Or use _Fastlane_ command:
    ```shell
    # For comments on issues and tags management
    export GITHUB_ACCESS_TOKEN=<your_github_personal_token>

    # Variables for upload to TestFlight
    export OUDS_APPLE_KEY_ID=<your_key_ID>
    export OUDS_APPLE_ISSUER_ID=<your_issuer_ID>
    export OUDS_APPLE_KEY_CONTENT=<your_key_content>
    
    # Certificates and provisioning profiles
    export OUDS_BUILD_CERTIFICATE_BASE64=<certificate_base64_content>
    export OUDS_BUILD_PROVISIONING_PROFILE_BASE64=<prov_profile_base64_content>
    export OUDS_P12_PASSWORD=<password_of_certificate>
    export OUDS_KEYCHAIN_PASSWORD=<password_for_keychain>

    # Variables for application signing
    export OUDS_DEVELOPER_BUNDLE_IDENTIFIER=<your_app_identifier>
    export OUDS_FASTLANE_APPLE_ID=<your_apple_email_address>
    export OUDS_DEVELOPER_PORTAL_TEAM_ID=<your_developer_portal_team_ID>
    
    # For Mattermost notifications
    export OUDS_MATTERMOST_HOOK_BOT_ICON_URL=<hook_bot_icon>
    export OUDS_MATTERMOST_HOOK_BOT_NAME=<hook_bot_name>
    export OUDS_MATTERMOST_HOOK_URL=<hook_url>

    # Variables for internal portal upload (for in the end App Store)
    export OUDS_UPLOAD_STORE_URL=<URL_wih_details_for_upload>

    bundle exec fastlane stable upload:true
    # set "upload" to true if you want to upload app to internal portal, false otherwise.
    ```

> [!TIP]
> Of course this build operation will be successful if and ony if you have the suitable certificates and provisoning profile son your computer

- From your internal runner (e.g. in our side GitLab CI) pipeline job (or locally if Fastlane used) which made the stable release, get the artifacts (app zip, dSYm zip, IPA)

- For the archive with the build artefacts and copypaste from previous release (and if needed update) the store screenshots

## Prepare Next Release

- Create a branch named `prepare-new-release` to prepare the new release for OUDS iOS version U.V.W.

- Switch to this branch and apply following changes:
    
    - Update the changelog.
    
    Add a section like:
     ```
    \## [Unreleased]\(https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/compare/X.Y.Z...develop)
    ```
    
    - Update in Xcode the version of DesignToolbox target to U.V.W (the new version you suppose it will be) and increment build number

    - Point to the devleop branch of the OUDS Swift Package

    - Commit your modifications

    - Push them to the repository

    - Create a new pull request named `Update release U.V.W` on GitHub to merge your branch into `develop` 
    
    - Review and merge this pull request on GitHub **using merge + squash strategy**<br /><br />
