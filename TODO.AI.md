# TODO.AI.md

Deferred items found during the repo-wide fish audit, deliberately
left unfixed pending user sign-off.

- etc/functions/*.fish (finding #21): several functions shadow
  builtins/other functions. Whether that's intentional (deliberate
  override) or a naming collision needs user direction before
  proceeding.
- etc/functions/fish_prompt.fish (finding #37): prompt spawns
  external processes for git status. Already guarded behind existence
  checks; left as-is pending a decision on whether a faster
  git-status strategy is wanted.
- etc/functions/oh-my-fish.fish (finding #39): the omf installer uses
  a curl|fish pattern, which is an inherent RCE-shaped risk in the
  upstream omf install flow itself, not a bug introduced here. Only
  the adjacent tracked-file-clobber bug was fixed (see commit
  c1d4a0f71a27); replacing the installer pattern itself needs user
  direction.
- etc/environment/00-global.fish (finding #45): EDITOR fallback value
  is ambiguous without a stated default preference.
- etc/config.fish (finding #46): several functions are eagerly
  sourced instead of relying on fish's autoload directories, which
  defeats autoload. Restructuring this is an architectural change
  larger than a bugfix pass.
- etc/functions/ls-related (finding #50, dir-listing part): `ls -hD`
  uses a GNU-only flag with no obvious portable replacement; needs
  user direction on the intended cross-platform behavior.
- etc/functions/*.fish (finding #51): several functions use generic
  variable names. Renaming them is cosmetic and out of scope for a
  bugfix pass.
- etc/functions/fisher.fish (finding #54): file carries a WTFPL
  header while upstream fisher is MIT-licensed. This is vendored
  third-party code; the header should not be changed without the
  user confirming how to handle the license mismatch.
- etc/functions/epp.fish (finding #55): hardcoded hostname dispatch
  doesn't match what README.md describes. Appears to be a deliberate
  per-machine dispatch pattern; left as-is pending user confirmation
  it's not a documentation bug instead.
- etc/functions/hl.fish (finding #57): only the argument-passthrough
  bug was fixed (see commit 1093a5792b3f). No content-highlighting
  pipeline was added since there's no defined highlighting tool to
  standardize on — adding one would be speculative.
