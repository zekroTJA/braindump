Semantic commit messages are a standardized way to formulate commit messages so that they are more understandable both for humans as well as for tools, which analyze the commit log (for example [[git-cliff]]).

# Schema

```bash
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

Types by spec are:
- **feat** for a new feature for the user, not a new feature for build script. Such commit will trigger a release bumping a MINOR version.
- **fix** for a bug fix for the user, not a fix to a build script. Such commit will trigger a release bumping a PATCH version.
- **perf** for performance improvements. Such commit will trigger a release bumping a PATCH version.
- **docs** for changes to the documentation.
- **style** for formatting changes, missing semicolons, etc.
- **refactor** for refactoring production code, e.g. renaming a variable.
- **test** for adding missing tests, refactoring tests; no production code change.
- **build** for updating build configuration, development tools or other changes irrelevant to the user.

# Example

```bash
fix(middleware): ensure Range headers adhere more closely to RFC 2616

Add one new dependency, use `range-parser` (Express dependency) to compute
range. It is more well-tested in the wild.

Fixes #2310
```

# Sources
- https://karma-runner.github.io/6.3/dev/git-commit-msg.html
- https://sparkbox.com/foundry/semantic_commit_messages
- https://www.conventionalcommits.org/en/v1.0.0/#summary