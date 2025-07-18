# Contributing to OUDS iOS

- [Using the Issue Tracker](#using-the-issue-tracker)
- [Using the Discussion Tracker](#using-the-issue-tracker)
- [Issues and Labels](#issues-and-labels)
- [Cross repositories mentions](#cross-repositories-mentions)
- [Bug Reports](#bug-reports)
- [Feature Requests](#feature-requests)
- [Pull Requests](#pull-requests)
- [Code Guidelines](#code-guidelines)
- [Commits Style](#commits-style)
- [Developer Certificate of Origin](#developer-certificate-of-origin)
- [Review Workflow](#review-workflow)
- [License](#license)

Looking to contribute something OUDS iOS? **Here's how you can help.**

> [!TIP]
> Please take a moment to review this document in order to make the contribution process easy for everyone involved.

> [!IMPORTANT]
> Following these guidelines helps to communicate that you respect the time of the developers managing and developing this Open Source project.
> In return, they should reciprocate that respect in addressing your issue or assessing patches and features.

You should also have a look on the wiki if you are looking for information about how the project is managed, the releases and tests done, and how to do some actions:
- [The wiki define the way to work anyone must agree](https://github.com/Orange-OpenSource/ouds-ios/wiki).
- [The Code of Conduct](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/develop/.github/CODE_OF_CONDUCT.md) defines how we should interact together.

## Using the Issue Tracker

The [issue tracker](https://github.com/Orange-OpenSource/ouds-ios/issues) is the preferred channel for [bug reports](#bug-reports), [feature requests](#feature-requests) and [submitting pull requests](#pull-requests), but please respect the following restrictions:

- Please **do not** use the issue tracker for personal support requests. [GitHub Discussions](https://github.com/Orange-OpenSource/ouds-ios/discussions/categories/q-a) or our internal Orange communication tools are better places to get help.

- Please **do not** derail or troll issues. Keep the discussion on topic and respect the opinions of others.

- Please **do not** post comments consisting solely of "+1" or ":thumbsup:". Use [GitHub's "reactions" feature](https://blog.github.com/2016-03-10-add-reactions-to-pull-requests-issues-and-comments/) instead. We reserve the right to delete comments which violate this rule.

## Cross repositories mentions

The OUDS project contains two repositories: one for the [Swift Package library](https://github.com/Orange-OpenSource/ouds-ios), and [another (this one)](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox) for the design system toolbox app showcasing the library.

Because today we want to have [one board for both repositories](https://github.com/orgs/Orange-OpenSource/projects/40/views/4), there is no board no issues tracker for this app GitHub project, and anything is centralized in the library GitHub project.

Thus, if you want to refer to an issue in the other project in commits, CHANGELOG, issues, pull requests or discussions, you must use the [GitHub dedicated convention](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/autolinked-references-and-urls) about issues references.
In few words, if you are on an issue n°42 in [ouds-ios](https://github.com/Orange-OpenSource/ouds-ios), do not mention `#42` in your messages, but `Orange-OpenSource/ouds-iOS#42`.

## Using the Discussion Tracker

The GitHub project provides a [discussion tracker](https://github.com/Orange-OpenSource/ouds-ios/discussions) with several sections.

You may need to refer to the [Q&A section](https://github.com/Orange-OpenSource/ouds-ios/discussions/categories/q-a) if you have questions in mind, or to [Ideas section](https://github.com/Orange-OpenSource/ouds-ios/discussions/categories/ideas) for discussions about technical things.

If you found a discussion which interests you or fills your needs, feel free to use [GitHub's "reactions" feature](https://blog.github.com/2016-03-10-add-reactions-to-pull-requests-issues-and-comments/) and bring useful comments. We reserve the right to delete comments which violate this rule.

Keep in mind internal or sensitive discussions must be in internal tools, not public ones.

## Issues and Labels

Our bug tracker utilizes several labels to help organize and identify issues. Here's what they represent and how we use them:

- `feature` - Issues asking for a new feature to be added, or an existing one to be extended or modified. New features require a minor version bump (e.g., `v1.0.0` to `v1.1.0`) or a major version bump if public API broken (e.g., `v1.0.0` to `v2.0.0`)
- `help wanted` - Issues we need or would love help from the community to resolve.

For a complete look at our labels, see the [project labels page](https://github.com/Orange-OpenSource/ouds-ios/labels).

## Bug Reports

A bug is a _demonstrable problem_ that is caused by the code in the repository. Good bug reports are extremely helpful, so thanks!

Guidelines for bug reports:

1. **Use the GitHub issue search** &mdash; check if the issue has already been reported.

2. **Check if the issue has been fixed** &mdash; try to reproduce it using the latest `develop` in the repository.

3. **Isolate the problem** &mdash; ideally create a reduced reproducible test case.

A good bug report shouldn't leave others needing to chase you up for more information. Please try to be as detailed as possible in your report. What is your environment? What steps will reproduce the issue? What device(s) and OS experience the problem? Do other devices show the bug differently? What would you expect to be the outcome? All these details will help people to fix any potential bugs.

Example:

> Short and descriptive example bug report title
>
> A summary of the issue and the browser/OS environment in which it occurs. If
> suitable, include the steps required to reproduce the bug.
>
> 1. This is the first step
> 2. This is the second step
> 3. Further steps, etc.
>
> `<url>` - a link to the reduced test case
>
> Any other information you want to share that is relevant to the issue being
> reported. This might include the lines of code that you have identified as
> causing the bug, and potential solutions (and your opinions on their
> merits).

## Feature Requests

Feature requests are welcome. But take a moment to find out whether your idea fits with the scope and aims of the project. It's up to _you_ to make a strong case to convince the project's developers of the merits of this feature. Please provide as much detail and context as possible.

## Pull Requests

Good pull requests (patches, improvements, new features) are a fantastic help. They should remain focused in scope and avoid containing unrelated commits.

**Please ask first** before embarking on any **significant** pull request (e.g. implementing features, refactoring code, porting to a different language), otherwise you risk spending a lot of time working on something that the project's developers might not want to merge into the project. For trivial things, or things that don't require a lot of your time, you can go ahead and make a PR.

Please adhere to the [coding guidelines](#code-guidelines) used throughout the project (indentation, accurate comments, etc.) and any other requirements (such as test coverage).

Adhering to the following process is the best way to get your work included in the project.

> [!TIP]
> Of course you can use GUI tools if your are not used to CLI

1. [Fork](https://help.github.com/articles/fork-a-repo/) the project, clone your fork, and configure the remotes:

   ```bash
   # Clone your fork of the repo into the current directory (use either SSH or HTTPS)
   git clone https://github.com/<your-username>/ouds-ios-design-system-toolbox.git
   # Navigate to the newly cloned directory
   cd ouds-ios-design-system-toolbox
   # Assign the original repo to a remote called "upstream" (use either SSH or HTTPS)
   git remote add upstream https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox.git
   ```

2. If you cloned a while ago, get the latest changes from upstream:

   ```bash
   git checkout develop
   git pull upstream develop
   ```

3. Create a new topic branch (off the `develop` project development branch) to contain your feature, change, or fix:

   ```bash
   git checkout -b <topic-branch-name> develop
   ```

4. Commit your changes in logical chunks. Use Git's [interactive rebase](https://help.github.com/articles/about-git-rebase/) feature to tidy up your commits before making them public. Refer also to [commits style](#commits-style).

5. Locally merge (or rebase) the upstream development branch into your topic branch:

   ```bash
   git pull [--rebase] upstream develop
   # Or use also 'git rebase' command
   ```

6. Push your topic branch up to your fork:

   ```bash
   git push origin <topic-branch-name>
   ```

7. [Open a Pull Request](https://help.github.com/articles/about-pull-requests/) with a clear title and description against the `develop` branch.

**IMPORTANT**: By submitting a patch, you agree to allow the project owners to license your work under the terms of the [MIT License](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/develop/LICENSE).

Note that a ruleset based [on task-list-completed tool](https://github.com/marketplace/task-list-completed) is applied on `develop` branch: if any prerequisites are not futfilled in the pull request ticket the merge won't be done. 

8. If your evolutions are bout the [Swift package](https://github.com/Orange-OpenSource/ouds-ios/), add in your pull request the details about it (branch to test, associated pull request, etc.). **Copy/paste the Swift package changelog line in the app changelog with cross-linked issues** ; thus for alpha, beta and stable builds the changelog of the app will mirror the changelog of the package.

## Code Guidelines

Format your code before committing to ensure your changes follow our coding standards.
Linters and formatters are configured for the project.
Keep documentation and tests updated.
Respect the architecture of the project, and [refer to the wiki if needed](https://github.com/Orange-OpenSource/ouds-ios/wiki/30-%E2%80%90-About-the-architecture).

## Commits Style

Try as best as possible to apply [conventional commits rules](https://www.conventionalcommits.org/en/v1.0.0/).
Keep in mind to have your commits well prefixed, and with the issue number between parenthesis at the end.
If your commits embed contributions for other people, do not forget to [add them as co-authors](https://docs.github.com/fr/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors).

For example, given a commit to fix the issue n°43, the commit should be like:

```text
fix: title of your commit (Orange-OpenSource/ouds-ios#43)

Some details about the fix you propose

Co-authored-by: Author firstname and lastname <author email>
Signed-off-by: Author firstname and lastname <first author email>
```

If the commit embeds work of several authors, use the *Co-authored-by* tag (in use in GitHub):

```text
fix: title of your commit (Orange-OpenSource/ouds-ios#43)

Some details about the fix you propose

Co-authored-by: First author firstname and lastname <first author email>
Co-authored-by: Second author firstname and lastname <second author email>
Signed-off-by: First author firstname and lastname <first author email>
Signed-off-by: Second author firstname and lastname <second author email>
```

If the feature has been reviewed by the product owner, the designers and the accessibility experts, you can mention them in the commit message using the appropriate
[*Tested-by*](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n525) tag.
It can help to find who reviewed, in alpha builds, the evolutions. Thus, the message for the merge commit should be like:

```text
fix: title of your commit (Orange-OpenSource/ouds-ios#43)

Some details about the fix you propose

Tested-by: Tester firstname and lastname <tester email>
Co-authored-by: First author firstname and lastname <first author email>
Co-authored-by: Second author firstname and lastname <second author email>
Signed-off-by: First author firstname and lastname <first author email>
Signed-off-by: Second author firstname and lastname <second author email>
```

Do not forget also to add, in the merge commit, who reviewed the source code evolutions using the [*Reviewed-by*](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n525) tag, like:

```text
fix: title of your commit (Orange-OpenSource/ouds-ios#43)

Some details about the fix you propose

Reviewed-by: Reviewer firstname and lastname <reviewer email>
Signed-off-by: Author firstname and lastname <first author email>
```

For example, for issue n°123 and its pull request n°456, tested by Anton, Maxime, Jérôme and Benoit, reviewed by Ludovic, authored by Tayeb and Pierre-Yves, and acked by Julien:
```text
refactor: update some things colors and design of the demo app (Orange-OpenSource/ouds-ios#123) (#456)

Some things have been refactored to make incredible things.

Tested-by: Anton Astafev <anton.astafev@orange.com>
Tested-by: Benoit Suzanne <benoit.suzanne@orange.com>
Tested-by: Maxime Tonnerre <maxime.tonnerre@orange.com>
Tested-by: Jérôme Régnier <jerome.regnier@orange.com>
Reviewed-by: Ludovic Pinel <ludovic.pinel@orange.com>
Acked-by: Julien Déramond <julien.deramond@orange.com>
Co-authored-by: Tayeb Sedraia <tayeb.sedraia@orange.com>
Co-authored-by: Pierre-Yves Lapersonne <pierreyves.lapersonne@orange.com>
Signed-off-by: Tayeb Sedraia <tayeb.sedraia@orange.com>
Signed-off-by: Pierre-Yves Lapersonne <pierreyves.lapersonne@orange.com>
```

Finaly, if you want to note somewhere you used *generative AI* tool, you can add the field "Assisted-by" in your commit with the model in use and in parenthsies some commercial name.

```text
feat: add thousands of tokens (Orange-OpenSource/ouds-ios#123)

Add thousands of tokens and hundreds of tests.

Assisted-by: GPT-4o-mini (Dinootoo)
```

## Developer Certificate of Origin

You may notice in the previous section the commits are signed-off.
For external contributors the DCO (i.e. [Developer Certificate of Origin of Linux Foundation in its version 1.1](https://developercertificate.org/)) is required.
For Orange contributors it is highly recommended and will be mandatory soon.
You can refer to the documentation about [-s / --signoff](https://git-scm.com/docs/git-commit) options for your Git commands.

## Review workflow

Because we want to define and provide an amazing design system for developers, we want to onboard for any evolutions the Q/A team for tests and also the design ans accessibiltiy (a11y) teams so as to check the fixes, patches or evolutions have been well implemented and tested.

The following chart explain how the review is done with also the intermediate alpha builds.
In few words, alpha builds are made for reviewers, and the merge is processed if and only if any review have been done.

```mermaid
flowchart TD
    A[New evolution needed, feature or bug fix] --> |Define needs and acceptance criteria| B(Create issue on GitHub)
    B --> C(Implementation or refactoring in GitHub branch)
    C --> |Code review| D{Code review OK?}
    D --> |No| C
    D --> |Yes| E(Build alpha version on TestFlight)
    E --> F(Update GitHub issue with details of alpha build)
    F --> G{Feature ready for review}
    G --> |Test of feature| H{Tests OK?}
    H --> |No| C
    G -->|Design review| I{Design review OK?}
    I --> |No| C
    G -->|A11Y review| J{A11Y review OK?}
    J --> |No| C
    H --> |Yes| K
    I --> |Yes| K
    J --> |Yes| K
    K[Merge in develop branch] --> |Nightly build| L(Beta build on TestFlight)
    L --> M(Update GitHub issue with details of beta build)
```

Pull requests will be merged if no conditions / prerequisites / checks are red (except DCO which is not - yet - mandatory, but we must at least outside contributors to apply it). Some _GitHub Actions_ workflows are defined:
- [task-list-completed GitHub app](https://github.com/apps/task-list-completed) prevents pull requests to be merged if some mandatory / not optional prerequisites are not filled ;
- another [workflow YAML](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/develop/.github/workflows/build-and-test.yml) building and testing the app / lib;
- another [using GitLeaks](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox/blob/develop/.github/workflows/gitleaks-action.yml) ensuring no screts are leaked ;
- the almost-optional-one checking [DCO is applied](https://probot.github.io/apps/dco/) ;
- and the one [for the linter warnings](https://github.com/cirruslabs/swiftlint-action).

## License

By contributing your code, you agree to license your contribution under the [MIT License](LICENSE).
