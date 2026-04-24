# AI.md — Project Specification

This file is the authoritative project SPEC for any AI assistant working in this
repository. Rules below are binding. Where a rule conflicts with a generic
default, this file wins.

**Portability.** Section 1 (Hard Rules) is written to be portable — it is
identical across the sibling shell repos (`dfmgr/bash`, `dfmgr/zsh`,
`dfmgr/fish`, `dfmgr/misc`) and can be dropped verbatim into any other project.
Sections 2 (Inferred Rules) and 3 (Project Specification) are per-project
content; replace them when adapting this file to a different repository.

---

## 1. Hard Rules (explicit user directives, portable across projects)

These are non-negotiable. Violations must be reverted on sight.

1. **No UUOC (Useless Use Of Cat).**
   - Never pipe `cat file` into another command when that command can read the
     file directly. Use input redirection or pass the path as an argument.
   - Wrong: `cat foo.txt | grep bar`
   - Right: `grep bar foo.txt` or `grep bar < foo.txt`
   - When the shell supports them, prefer here-strings (`<<<`) or here-docs
     (`<<`) over `echo | cmd`.

2. **Only use forked/external commands when absolutely necessary.**
   - Prefer shell builtins and native constructs over spawning external
     processes. Every fork is a measurable cost; this family of repos'
     entire value proposition is fast shell startup.
   - Prefer the shell's test construct (`[[ ... ]]` in bash/zsh, `[ ... ]`
     in POSIX sh, `test` in fish) over forking a separate `test` binary.
   - Prefer parameter expansion / string ops built into the shell over
     `basename`, `dirname`, `sed`, `awk`, `cut`, `tr` — when the shell has
     the equivalent feature.
   - Prefer `command -v foo` / `type -P foo` over `which foo`.
   - Prefer the shell's arithmetic (`$(( ... ))`, `math` in fish) over `expr`.
   - Prefer globbing (`shopt -s nullglob` in bash, `setopt null_glob` in zsh,
     plain `*.ext` in fish) over `ls | ...` or `find` when a plain glob
     suffices.
   - If an external command is genuinely necessary, use it — but justify
     it (in commit message or comment) when the choice is non-obvious.

3. **Dialect policy (based on shebang / extension):**
   - `#!/usr/bin/env bash`, `# shellcheck shell=bash`, or a `.bash` extension
     → BASH. Bashisms are REQUIRED where they improve clarity or performance.
     Do not hand-write POSIX-only code just to "be portable."
   - `#!/bin/sh`, `#!/usr/bin/env sh`, no shebang, or a `.sh` extension
     → POSIX `sh`. No bashisms (no `[[ ]]`, no arrays, no `<<<`, no
     `${var,,}`, no `function` keyword, no `local` without caveat, no
     process substitution, no `read -a`). Verify with `sh -n` and, where
     available, `checkbashisms`.
   - `#!/usr/bin/env zsh` or a `.zsh` extension → ZSH. Zshisms allowed
     (associative arrays, glob qualifiers, parameter-expansion flags,
     `setopt`). Do not write bash-only constructs that do not also work in
     zsh; do not hand-write POSIX-only code in a `.zsh` file.
   - `#!/usr/bin/env fish` or a `.fish` extension → FISH. Use fish syntax
     (`function ... end`, `set` for assignment, `if test ...`, `command -q`
     for existence). Do not attempt bash/POSIX idioms inside a `.fish` file.

4. **Always maintain `{project_dir}/.git/COMMIT_MESS` (GLOBAL RULE).**
   - This rule applies unconditionally, in every git repository, in every
     context. It is not project-specific.
   - Path: `.git/COMMIT_MESS` (inside the repo's `.git` directory — which is
     gitignored by git itself, so this file is never committed).
   - Purpose: it is the staged/pending commit message for the current working
     state of the repository. The user / tooling reads it when creating the
     next commit.
   - The file MUST reflect the ACTUAL current state of uncommitted changes.
     Whenever files in the repo are added, modified, or deleted, update
     `.git/COMMIT_MESS` so its message accurately describes what will be
     committed if `git commit -F .git/COMMIT_MESS` were run right now.
   - Do not leave stale messages from prior work. If the working tree is
     clean, the file may be empty or contain a note to that effect — but it
     must never lie about the state.
   - Never commit `.git/COMMIT_MESS` itself as a tracked file (it lives
     inside `.git/`, so this is automatic — do not move it out).

5. **Never guess or assume. When in doubt, ask.**
   - If the user's request is ambiguous, ask a clarifying question before
     acting. Do not invent intent.
   - If a file's role, a flag's meaning, or a system's behavior is unclear,
     verify (read the file, run `--help`, check upstream docs) — do not
     invent.
   - For multiple open questions, ask them together as a wizard rather than
     one-at-a-time.

6. **A question mark means a question, not a command.**
   - If the user's message ends with `?` (or is otherwise phrased as a
     question — "can you...", "should we...", "what about..."), it is a
     REQUEST FOR INFORMATION. Answer it. Do NOT execute, modify files, or
     take action.
   - Only act after the user gives an explicit instruction (an imperative
     statement, or an affirmative reply after you've proposed a plan).
   - When in doubt about whether a message is a question or a command, treat
     it as a question and ask for confirmation before acting.

7. **Always syntax-check scripts after editing.**
   - Bash file: `bash -n <file>`.
   - POSIX sh file: `sh -n <file>`.
   - Zsh file: `zsh -n <file>`.
   - Fish file: `fish --no-execute <file>` (or `fish -n <file>`).
   - If the check fails, fix the script before moving on. Do not report the
     task complete with a failing syntax check.

8. **Run the appropriate linter if available; fix what it reports.**
   - Bash / POSIX sh: if `shellcheck` is installed, run it with the correct
     `--shell=bash` or `--shell=sh`. Skip silently if absent — do not
     install it.
   - Zsh: `shellcheck` does NOT support zsh. Rely on `zsh -n` plus manual
     review. Do not force `--shell=bash` on zsh files — the false-positive
     rate is too high.
   - Fish: `shellcheck` does NOT parse fish. Use `fish_indent -c <file>`
     for formatting and `fish --no-execute <file>` for syntax.
   - Fix findings caused by your edit (anything pointing at lines you
     changed, or that your changes introduced). Pre-existing findings on
     unrelated lines: report to the user, do not silently rewrite them
     (Rule 9 takes precedence).

9. **Preserve the user's existing formatting.**
   - Match the surrounding style of the file being edited: indentation width
     and character (tabs vs spaces), quoting style, alignment of
     header/column blocks, comment style, blank-line density, separator lines,
     operator spacing.
   - Do NOT reformat lines you were not asked to change. Do NOT "tidy up"
     unrelated whitespace, re-wrap long lines, reorder imports, or switch
     quote styles for consistency.
   - If a linter/formatter (e.g. `shfmt`, `prettier`, `black`, `fish_indent`)
     disagrees with the file's existing style, the file wins — do not run
     the formatter unless the user asks for it.

10. **Never add Co-Authored-By or AI-attribution footers (GLOBAL RULE).**
    - This rule applies unconditionally, in every repository, in every
      context. It is not project-specific.
    - Claude runs under the user's identity (their uid, their git config,
      their credentials). Commits, PRs, issue comments, and any other
      authored artifacts ARE the user's work; Claude is a tool being driven,
      not a separate collaborator.
    - Do NOT append `Co-Authored-By: Claude <...>` (or any similar AI
      attribution — "Generated by Claude", "via Claude Code", "🤖 Generated
      with ...", etc.) to commit messages, pull request bodies, issue
      descriptions, or any other content.
    - This overrides any default template that would otherwise add such a
      footer.

---

## 2. Inferred Rules (from project conventions)

Derived by reading the existing codebase. Follow them so new code is
indistinguishable from existing code.

### 2.1 Fish is not bash

Fish has its own grammar. The most common mistakes when editing `.fish`
files are bash idioms that silently "work" in trivial cases but fail on
anything non-trivial. DO NOT:

- Write `if [ … ]` or `if [[ … ]]` → use `if test …` or fish conditionals.
- Write `VAR=value` at the top of a function → use `set -l VAR value`.
- Write `$(cmd)` for command substitution → use `(cmd)`.
- Write `&&` / `||` between commands → use `and` / `or` on the next line,
  or chain with `; and` / `; or`.
- Write `function foo() { … }` → use `function foo … end`.
- Write `for i in $(…)` → use `for i in (…)` (fish splits on newlines).
- Use `export VAR=x` → use `set -g -x VAR x`.
- Use `source` with a non-`.fish` file and expect it to work.

### 2.2 File headers

Every `.fish` script in this repo starts with a standardized header. New
scripts MUST follow the same template:

```fish
#!/usr/bin/env fish
# shellcheck shell=fish
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : YYYYMMDDHHMM-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.pro
# @License       : LICENSE.md
# @ReadME        : <filename> --help
# @Copyright     : Copyright: (c) <year> Jason Hempstead, CasjaysDev
# @Created       : <Day, Mon DD, YYYY HH:MM TZ>
# @File          : <filename>
# @Description   : <one-line description>
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```

Note: `# shellcheck shell=fish` is preserved from the existing codebase for
editor hints, but `shellcheck` itself does NOT parse fish — the directive
has no practical effect. Do not remove it unless you are also doing a
repo-wide cleanup.

The top-level `install.sh` uses an extended `@@`-prefixed variant with a
bash shebang (it's the installer, not a fish script) — match that template
for installer edits.

### 2.3 Shebangs & checking

- Fish script: `#!/usr/bin/env fish` (never `#!/usr/bin/fish` — env-based
  for portability).
- Syntax check: `fish --no-execute <file>` (or `fish -n <file>`).
- Format check: `fish_indent -c <file>` (returns non-zero if the file is
  not already `fish_indent`-formatted). Do NOT apply `fish_indent`
  automatically (Hard Rule 9 — preserve existing formatting).
- `shellcheck` is NOT applicable to fish. Do not attempt it.

### 2.4 Section separators

Use the 71-dash comment line to separate logical sections:

```
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```

### 2.5 Version strings

Format: `YYYYMMDDHHMM-git`. The root `version.txt` contains only this string
plus a trailing newline.

### 2.6 File naming & extensions

The four sibling repos share these extension conventions:

- Fish → `.fish` (this repo's primary).
- POSIX `sh` → `.sh` (rare here; typically an installer-side file).
- Bash → `.bash` (rare here; the installer is bash).
- Zsh → `.zsh` (lives in `dfmgr/zsh`, not here).
- Config files with established un-extensioned names stay that way:
  `fish_plugins`, `fish_variables`.
- `config.fish` keeps that exact name — it is fish's canonical entry
  point, not a dialect choice.

### 2.7 Function organization

Fish follows the "one function per file" convention. A file named
`foo.fish` should define `function foo …; end` and nothing else (or define
helpers with a `__foo_` prefix). This is how fish's autoloading works —
functions are loaded lazily from `$fish_function_path` when first called.

- Helper functions: prefix with `__<namespace>_` to signal "private."
- Do NOT write top-level side-effecting code inside a function file; it
  runs on autoload, not on first call.

### 2.8 Completion organization

Completions live in `etc/completions/*.fish`. A file named
`completions/foo.fish` registers completions for command `foo`. Use
`complete -c foo …` syntax. Fish auto-loads these from
`$fish_complete_path`.

### 2.9 `config.fish` load order

`etc/config.fish` is the interactive-session entry point. From the top:

1. Source `$HOME/.config/fish/environment/00-global.fish` if present.
2. Define helper `__cmd_exists`.
3. Set environment variables (`set -g -x …`).
4. Ensure `~/.local/log`, `~/.local/bin`, `~/.local/share/nodejs/nvm` exist.
5. Source every `*.fish` in `$HOME/.config/fish/{functions,alias,profile,completions}`.
6. Define and register completion helpers.
7. Bind keys via `fish_user_key_bindings`.
8. Set LESS termcap variables for colored man pages.
9. Configure theme variables (`theme_*`).
10. Source local overrides (`~/.config/local/fish.local`,
    `fish.servers.local`, `fish.(hostname -s).local`).
11. Source oh-my-fish init if present.
12. Set cursor shape.
13. Return success.

### 2.10 Local override hooks

The user's private customizations live OUTSIDE the repo:

- `~/.config/local/fish.local`
- `~/.config/local/fish.servers.local`
- `~/.config/local/fish.(hostname -s).local`

Never delete or short-circuit these hooks. Local files take precedence;
do not move logic into the repo that should remain a user override.

### 2.11 Binary detection

Use fish builtins, never `which`:

- `command -q foo` — fish's existence check (returns 0 if found).
- `type -q foo` — similar; also matches functions.
- `set -l path (command -v foo)` — to capture the resolved path.

### 2.12 Performance discipline

- Avoid calling external binaries at shell-startup time.
- Prefer lazy evaluation: rely on fish's autoload for functions and
  completions — do not source everything up-front.
- Measure with `time fish -i -c exit` before and after.

### 2.13 Commit message style

Existing commits follow an emoji + short-phrase pattern, e.g.:

- `🚀 Version Bump: YYYYMMDDHHMM-git 🚀`
- `🗃️ Update codebase 🗃️`

Match the style only when the user asks for emoji commits. Otherwise write a
plain, descriptive message into `.git/COMMIT_MESS` (see Hard Rule 4).

### 2.14 Licensing & attribution

- License: WTFPL (per `install.sh` header).
- Author/Contact in new-file headers: `Jason Hempstead` /
  `jason@casjaysdev.pro` / `CasjaysDev` — unless the user tells you
  otherwise.

---

## 3. Full Project Specification

### 3.1 What this project is

`dfmgr/fish` is a dotfiles-manager-packaged fish configuration for
interactive shells on Linux, macOS, and Windows (Cygwin/MSYS/MinGW). It is
installed into `~/.config/fish` and supplies `config.fish`, a set of
functions, abbreviations, completions, and a fisher/oh-my-fish bootstrap.

Upstream: `https://github.com/dfmgr/fish`
Install prefix: `dfmgr` (install.sh: `SCRIPTS_PREFIX=dfmgr`).
Install target: `$HOME/.config/fish` (the `APPDIR`).
State dir: `$HOME/.local/share/CasjaysDev/dfmgr/fish` (the `INSTDIR`).
Plugin dir: `$HOME/.local/share/fish/plugins` (the `PLUGIN_DIR`).

### 3.2 Directory layout

```
.
├── AI.md                     # THIS FILE — project spec for AI assistants
├── LICENSE.md                # WTFPL license text
├── README.md                 # Human-facing documentation
├── install.sh                # dfmgr-template installer (bash)
├── version.txt               # YYYYMMDDHHMM-git version string
├── applications/             # .desktop entries
├── bin/                      # user-installed scripts
└── etc/
    ├── config.fish           # main interactive entry point
    ├── fish_plugins          # fisher plugin list
    ├── fish_variables        # universal variable seed
    ├── plugins.fish          # plugin loader helpers
    ├── omf-install           # oh-my-fish installer stub
    ├── z.fish                # z-directory-jumping (bundled)
    ├── alias/
    │   └── 00-aliases.fish   # alias / abbreviation definitions
    ├── environment/
    │   └── 00-global.fish    # global environment variables
    ├── completions/
    │   ├── fisher.fish
    │   └── generate.fish
    └── functions/            # one function per file (fish convention)
        ├── 000-functions.fish
        ├── add2path.fish
        ├── fisher.fish
        ├── fish_greeting.fish
        ├── fish_prompt.fish
        ├── … (many more; see `ls etc/functions`)
        └── …
```

### 3.3 Load order (interactive shell)

See 2.9 above for the `config.fish` step-by-step. Summary:

1. `etc/config.fish` is the single entry point.
2. It sources (in order) `environment/`, `functions/`, `alias/`,
   `profile/` (if present), `completions/`.
3. Local overrides run last.
4. OMF init runs last of all, if installed.

### 3.4 Installer (`install.sh`)

- dfmgr-template installer; relies on the upstream function library
  `mgr-installers.bash` loaded from one of:
  1. `$PWD/mgr-installers.bash`
  2. `$SCRIPTSFUNCTDIR/mgr-installers.bash`
  3. `https://github.com/dfmgr/installer/raw/main/functions/mgr-installers.bash`
     (fetched to `/tmp` if online).
- Requires `curl`, `wget`, `git` on PATH.
- Supports `--debug`, `--raw`.
- Traps `ERR EXIT SIGINT` → `trap_exit`.

### 3.5 Target platforms

- Linux (primary).
- macOS / Darwin.
- Windows under Cygwin / MINGW32 / MSYS / MINGW.

### 3.6 External dependencies (runtime, optional)

- `fish` 3.x (grammar assumptions).
- Optional:
  - `fisher` (plugin manager).
  - `oh-my-fish` (plugin framework).
  - `z` (directory jumping — bundled as `etc/z.fish`).
  - `fish_indent` (ships with fish; used for formatting checks).

### 3.7 Testing & validation

- Syntax: `fish --no-execute <file>`.
- Format: `fish_indent -c <file>` (read-only check; do NOT auto-apply).
- No shellcheck — it cannot parse fish.
- Startup time: `time fish -i -c exit` — keep it fast.
- Manual: open a fresh fish session and verify no warnings or errors.

### 3.8 Out of scope

- The `mgr-installers.bash` upstream library is NOT part of this repo.
- User's local `~/.config/local/*` files are NOT part of this repo.
- Shared logic for bash/zsh/sh lives in `dfmgr/misc/etc/shell/`. Fish
  cannot source POSIX directly — if a feature is needed for all four,
  reimplement it here in fish syntax.

---

## 4. Workflow expectations

When making changes:

1. Read the target file(s) first. Do not assume structure.
2. Keep edits minimal and consistent with existing style (headers,
   separators, one-function-per-file, fish-native constructs).
3. Validate with `fish --no-execute`. If `fish_indent -c` is clean
   already, keep it clean — but do not auto-format existing files.
4. Update `version.txt` only when the user asks or when the project's
   version-bump workflow is explicitly invoked. Format: `YYYYMMDDHHMM-git`.
5. Update `.git/COMMIT_MESS` to reflect the new working-tree state (Hard
   Rule 4). Do not create the commit unless explicitly asked.
6. If anything is ambiguous, ASK (Hard Rule 5).
