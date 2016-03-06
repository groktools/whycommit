# whycommit
Add a reason for your change in the commit message

# Introduction
**whycommit** is a simple addition to your git workflow - it adds a template for your commit messages that helps you to guide future readers so that they understand your change better.

#Why whycommit
As found by [Maalej et al](https://mobis.informatik.uni-hamburg.de/wp-content/uploads/2014/06/TOSEM-Maalej-Comprehension-PrePrint2.pdf) (page 19):
> More than half of respondents agreed that they encounter problems at least weekly due to missing knowledge about “why was this code implemented this way”, “what was the developer’s intention when writing this code”.

This repo contains tools to bridge this gap. Included are:
* A commit message template (`whycommit-template.txt`) that requires the author of the change to answer this question for future readers to grok.
* A bash/bat shell script to install the message template for one repo or for all of them.
* A bash/bat shell script to install a pre-commit hook preventing commits without a Why section (with an escape hatch for "small" commits detailed below).

# Install

Clearly all of this can be done by hand, i.e., you could create your own template and install it using instructions from the [Pro Git book, Client Configuration section](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration). This repo makes that easy, of course. To use it:

1. Clone this repo: `git clone https://github.com/groktools/whycommit.git`.
2. Edit `whycommit-template.txt` as you wish. Keep the `Why` section if you're planning on installing the pre-commit hook.
3. Run `install-template.*` to install the template. `--global` installs it for all repos you create, same as the `git config` option.
4. Run `install-hook.*` to install the pre-commit hook, if you so desire.
5. Profit!...err..from all the future knowledge that is.

# Usage

Once installed, the `whycommit` template should show up in your editor's commit UI (see below for actual coverage). If you've also installed the pre-commit hook, committing should be prevented unless a why section exists.

## Its "Why I implemented it this way", not "Why I made this change"
Note that the intent is to inform a future reader about your implementation choices, not the reason for the implementation! So:
* "Because hashmaps are the right choice given the surrounding code" not "Because ISSUE-123 had to be fixed"
* "Because a refactor of this class reduces dependencies" not "Part of team's tech debt reduction effort"


### Escape hatch: Avoiding the why on short commits
If you're the type that commits very often, not all of our commits have a meaning that spans the eons. In that scenario, you can use the `git commit -m "short commit message"` option to bypass the template. Note that if you've installed the commit hook, it will prevent you from committing even then. To avoid this, use `git commit -m "# short commit message"`. Note the `#`. The hook uses this to recognize a short commit message and allows it to pass.

# Editor/IDE Coverage

| Editor/IDE | Support Level | Notes         |
|------------|---------------|---------------|
|git cli| Native | Natively supported |
|git gui| Not supported| Future plan to send PR to the git gui project |
|Atom Editor + GitPlus package| Natively Supported | Gitplus honors the commit.template config value |
|Intellij Community Editon | Not supported yet | There is [an open issue](https://youtrack.jetbrains.com/issue/IDEA-66355) and [a proposed fix](https://github.com/JetBrains/intellij-community/pull/316), but there are complications noted in the comments to the pull request because of which the fix is not yet accepted.|
|Eclipse | Not supported| Eclipse's Mylyn plugin has its [own commit templates](https://wiki.eclipse.org/EGit/User_Guide#Working_with_Tasks), however. |
|MS VS Code| Not supported | Code has a tiny commit window. There might be UX issues with a large format message to overcome first|
|Sublime Text |Supported as editor| Sublime can be configured as a commit message editor. There is a [paid git plugin](https://sublimegit.net/) that seems to support templates, but its not clear if that's true since its closed-source. |
