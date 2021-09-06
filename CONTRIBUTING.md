# Contributing to `AfyaMoja`

First off, thanks for taking the time to contribute!

The following is a set of guidelines for contributing to `AfyaMoja`, which is hosted in the [Savannah Global Health](https://github.com/savannahghi) Organization on GitHub. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

#### Table Of Contents

[Code of Conduct](#code-of-conduct)

[TL/DR: I just have a question!](#tl-dr-i-just-have-a-question)

[What should I know before I get started?](#what-should-i-know-before-i-get-started)

- [SIL Software and Packages](#sil-software-and-packages)
- [Design Decisions](#design-decisions)

[How Can I Contribute?](#how-can-i-contribute)

- [Reporting Bugs](#reporting-bugs)
- [Suggesting Enhancements](#suggesting-enhancements)
- [Your First Code Contribution](#your-first-code-contribution)
- [Pull Requests](#pull-requests)

[Style guides](#style-guides)

- [Git Commit Messages](#git-commit-messages)
- [Importing packages](#packages-import)

[Additional Notes](#additional-notes)

## Code of Conduct

This project and everyone participating in it is governed by the [Savannah Informatics Limited Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior via email to [BeWell Feedback](mailto:feedback@bewell.co.ke).

## TL-DR I just have a question

> **Note:** Please don't file an issue to ask a question. You'll get faster results by using the resources below.

We have an official message board (Support center) through which we can interact with community members incase you have questions.

## What should I know before I get started?

### Savannah Informatics Limited (SIL) Software and Packages

`AfyaMoja` is an open source project &mdash; it's one among many other shared libraries and applications that make up the wider ecosystem of software made and open sourced by `Savannah Informatics Limited`.
When you initially consider contributing to `AfyaMoja`, you might be unsure about which of those repositories implements the functionality you want to change or report a bug for. This section should help you with that.

Here's a list of the big ones:

- [app_wrapper](https://github.com/savannahghi/app_wrapper) - A shared library responsible for putting together everything that the app needs in order to run safely. Similar to a pre-flight checklist that brings together app requirements and exposes them to app's element tree.
- [domain_objects](https://github.com/savannahghi/domain_objects) - A shared library responsible for aggregating core domain objects.
- [dart_fcm](https://github.com/savannahghi/dart_fcm) - A shared library for responsible for exposing firebase messaging services.
- [user_feed](https://github.com/savannahghi/user_feed) - A shared library responsible for rendering and refreshing user-feed and engagement data.
- [flutter_graphql_client](https://github.com/savannahghi/flutter_graphql_client) - A shared library responsible for exposing graphql_client and helper methods for use in the various apps
- [debug_logger](https://github.com/savannahghi/debug_logger) - A shared library responsible for displaying various logging options used for development and debugging
- [misc_utilities](https://github.com/savannahghi/misc_utilities) - A shared library that contains various shared helper methods and functions
- [shared_themes](https://github.com/savannahghi/shared_themes) - A shared library responsible for defining and providing theme/style guidelines
- [shared_ui_components](https://github.com/savannahghi/shared_ui_components) - A shared library for responsible for rendering and exposing widgets and ui components
- [user_profile](https://github.com/savannahghi/user_profile) - A shared library responsible for the user profile displayed within the app.

### Design Decisions

When we make a significant decision in how we maintain the project and what we can or cannot support, we will document it in a shared wiki [SIL WIKI](https://github.com/). If you have a question around how we do things, check to see if it is documented there. If it is _not_ documented there, please open a new issue on the project repo or reach out to us via the official channels and ask your question.

## How Can I Contribute?

### Reporting Bugs

This section guides you through submitting a bug report for `AfyaMoja`. Following these guidelines helps maintainers and the community understand your report :pencil:, reproduce the behavior :computer:, and find related reports :mag_right:.

Before creating bug reports, please check the project's list of open [issues/bug](https://github.com/savannahghi/AfyaMoja/issues) reports as you might find out that you don't need to create one. When you are creating a bug report, please [include as many details as possible](#how-do-i-submit-a-good-bug-report). Fill out [the required template](https://github.com/savannahghi/AfyaMoja/blob/main/.github/feature_request.md), the information it asks for helps us resolve issues faster.

> **Note:** If you find a **Closed** issue that seems like it is the same thing that you're experiencing, open a new issue and include a link to the original issue in the body of your new one.

#### Before Submitting A Bug Report

- **Check the [flutter & dart documentation](https://flutter.dev/docs).** You might be able to find the cause of the problem and fix things yourself. Most importantly, check if you can reproduce the problem [in the latest version of this project](https://github.com/).
- **Check the [Project's issue list and known bug reports](https://github.com/)** for a list of known and (or) bugs that have already been reported, common questions and problems.
- **Perform a [cursory search](https://github.com/search?q=org%3Asavannahghi+)** to see if the problem has already been reported. If it has **and the issue is still open**, add a comment to the existing issue instead of opening a new one.

#### How Do I Submit A (Good) Bug Report?

Bugs are tracked as [GitHub issues](https://guides.github.com/features/issues/). After you've determined [which repository](#ail-software-and-packages) your bug is related to, create an issue on that repository and provide the following information by filling in [the template](https://github.com/search?q=org%3Asavannahghi+).

Explain the problem and include additional details to help maintainers reproduce the problem:

- **Use a clear and descriptive title** for the issue to identify the problem.
- **Describe the exact steps which reproduce the problem** in as many details as possible. For example, start by explaining how you started the project, e.g. which command exactly you used in the terminal, or how you used the project otherwise. When listing steps, **don't just say what you did, but explain how you did it**.
- **Provide specific examples to demonstrate the steps**. Include links to files, screenshots or GitHub projects, or copy/pasteable snippets, which you use in those examples. If you're providing snippets in the issue, use [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
- **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
- **Explain which behavior you expected to see instead and why.**
- **Include screenshots and screen-recordings** which show you following the described steps and clearly demonstrate the problem.
- **If you're reporting that the project crashed/doesn't build**, include a summary crash report with a stack trace if available. Include the crash report in the issue in a [code block](https://help.github.com/articles/markdown-basics/#multiple-lines), a [file attachment](https://help.github.com/articles/file-attachments-on-issues-and-pull-requests/), or put it in a [gist](https://gist.github.com/) and provide link to that gist.
- **If the problem wasn't triggered by a specific action**, describe what you were doing before the problem happened and share more information using the guidelines below.

Provide more context by answering these questions:

- **Can you reproduce the problem?**
- **Did the problem start happening recently** (e.g. after updating to a new version of the project in question) or was this always a problem?
- If the problem started happening recently, **can you reproduce the problem in an older version of the project?** What's the most recent version in which the problem doesn't happen? You can download older versions of this project in its [release](https://github.com/) page on github.
- **Can you reliably reproduce the issue?** If not, provide details about how often the problem happens and under which conditions it normally happens.
- If the problem is related to working with files, **does the problem happen for all files and projects or only some?** Does the problem happen only when working with local or remote files. Is there anything else special about the files you are using?

Include details about your configuration and environment:

- **Which version of the project are you using?** You can get the exact version by running `flutter doctor -v` in your terminal.
- **Which version of the flutter & dart SDK are you using**?
- **What's the name and version of the OS you're using**?

### Suggesting Enhancements

This section guides you through submitting an enhancement suggestion for this project, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestion :pencil: and find related suggestions :mag_right:.

Before creating enhancement suggestions, please check [the list of already proposed enhancements](#before-submitting-an-enhancement-suggestion) as you might find out that you don't need to create one. When you are creating an enhancement suggestion, please [include as many details as possible](#how-do-i-submit-a-good-enhancement-suggestion). Fill in [the template](https://github.com/), including the steps that you imagine you would take if the feature you're requesting existed.

#### Before Submitting An Enhancement Suggestion

- **Check the [project changelog](https://github.com/)** for tips — you might discover that the enhancement is already in the works and(or) is available in this or a previous version. Most importantly, check if you're using [the latest version of this project](https://github.com/#update-to-the-latest-version).
- **Check if there's already [a package](https://github.com/savannahghi) which provides that enhancement among the list of related projects.**
- **Perform a [cursory search](https://github.com/search?q=+is%3Aissue+user%3)** to see if the enhancement has already been suggested. If it has, add a comment to the existing issue instead of opening a new one.

#### How Do I Submit A (Good) Enhancement Suggestion?

Enhancement suggestions are tracked as [GitHub issues](https://guides.github.com/features/issues/). Create an issue on that repository and provide the following information:

- **Use a clear and descriptive title** for the issue to identify the suggestion.
- **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
- **Provide specific examples to demonstrate the steps**. Include copy/pasteable snippets which you use in those examples, as [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
- **Describe the current behavior** and **explain which behavior you expected to see instead** and why.
- **Include screenshots and animated GIFs** which help you demonstrate the steps or point out the part of the project which the suggestion is related to.
- **Explain why this enhancement would be useful** to most of our users and isn't something that can or should be implemented as a [community package](#sil-software-and-packages).
- **List some other packages or applications where this enhancement exists.**
- **Specify which version of the project you're using.** You can get the exact version by running `flutter doctor -v` in your terminal.
- **Specify the name and version of the OS you're using.**
- **Specify the name and version of the dart & flutter SDK you're using.**

### Your First Code Contribution

Unsure where to begin contributing to SIL Software? You can start by looking through these `beginner` and `help-wanted` issues:

- [Beginner issues](https://github.com/) - issues which should only require a few lines of code, and a test or two.
- [Help wanted issues](https://github.com/) - issues which should be a bit more involved.

Both issue lists are sorted by total number of comments. While not perfect, number of comments is a reasonable proxy for impact a given change will have.

#### Local development

`AfyaMoja` and all packages can be developed locally. For instructions on how to do this, (develop, test & deploy) see the project's readme file

### Pull Requests

The process described here has several goals:

- Maintain SIL Software's quality
- Fix problems that are important to users
- Engage the community in working toward the providing best possible software
- Enable a sustainable system for SIL's maintainers to review contributions

Please follow these steps to have your contribution considered by the maintainers:

1. Follow all instructions in [the template](PULL_REQUEST_TEMPLATE.md)
2. Follow the [style guides](#style-guides)

While the prerequisites above must be satisfied prior to having your pull request reviewed, the reviewer(s) may ask you to complete additional design work, tests, or other changes before your pull request can be ultimately accepted.

## Style guides

### Git Commit Messages

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests liberally after the first line
- Our convention for a good commit message consists of a **header**, a **body** and a **footer**.

#### Message header

The message header is a single line that contains short and clear description of the change.

The following are **message header** examples that describe the kind of change that a commit is providing.

- **feat** (feature)
- **fix** (bug fix)
- **docs** (documentation)
- **style** (formatting, missing semi colons, …)
- **refactor** (changing implementation details without changing functionality)
- **test** (when adding tests)
- **chore** (maintain)

#### Header subject

This is a very short description of the change.

- use imperative, present tense: “change” not “changed” nor “changes”
- don't capitalize first letter
- no dot (.) at the end

#### Example of a good commit header

```dart
docs: healthcloud commit message convention
```

### Message body

Separated with the **Message Header** by a line break, the message body contains checklist and summary paragraphs of changes. Follow below conventions.

- use imperative, present tense: “change” not “changed” nor “changes”
- includes motivation for the change and contrasts with previous behavior
- don't capitalize first letter
- no dot (.) at the end
- use checklists if more than a single work-item have been tackled

### Message footer

The footer should contain any information about Breaking Changes which should start with the word BREAKING CHANGE: with a space or two newlines. The rest of the commit message is then the description of the change, justification and migration notes. It is also the place to reference GitHub issues that this commit Closes.

#### Example of a good commit footer

```dart
BREAKING CHANGE: isolate scope bindings definition has changed and
    the inject option for the directive controller injection was removed.

Closes #392
```

#### Example of a good commit message

```dart
docs: add healthcloud convention to readme

Couple of typos fixed:
- indentation
- syntax highlighting
- start periodic checking
- missing brace

Closes #03
```

### NOTE

1. The **commit message header** can be used in solitary with a clear subject on issues with elementary changes.
2. To close an issue automatically include the footer with a reference to the GitLab issue as demonstrated above.

## Packages import

Packages imported in every dart file follow this order;

```dart
1 . Dart imports
2 . Flutter imports
3 . Third-party packages
4 . Our own packages
5 . Relative files
```

All the imports MUST be separated by a blank line. See example below. A good example, using the `lib/features/login/pages/login_page.dart` file

```dart
// flutter package imports
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

// third party imports
import 'package:redux/redux.dart';

```

## Additional Notes

For any additional notes/suggestions indicate them through the right channels.
