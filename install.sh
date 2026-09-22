#!/usr/bin/env bash
#
# Recommended agent kit for working on this wiki.
#
# Nothing here is required: the repository ships its own kit in .claude/ (the schema in
# CLAUDE.md and AGENTS.md, the skills, the house rules) and one script in scripts/. This script installs the heavier global plugins the wiki was built with, at
# the versions it was built with, so a contributor gets the same discipline.
#
# What "pinned" means per source, because the four differ:
#   get-shit-done  npm, so pinned exactly with @<version>.
#   gstack         a git repository that publishes no tags, so this clones the default
#                  branch and compares its VERSION file with the pin, warning on drift.
#   the two Claude Code plugins
#                  `claude plugin install` takes plugin@marketplace, not a version, so
#                  this installs and then compares `claude plugin list` with the pin,
#                  warning on drift.
#
# Usage:
#   ./install.sh            # install everything
#   ./install.sh --check    # report what is present and what version, install nothing
#
# MIT licensed, like the rest of the code in this repository.

set -euo pipefail

SUPERPOWERS_VERSION="5.0.6"
EVERYTHING_CLAUDE_CODE_VERSION="1.8.0"
GSTACK_VERSION="1.58.5"
GET_SHIT_DONE_VERSION="1.27.0"

# superpowers ships in the marketplace Claude Code has built in, so no marketplace is
# added for it; everything-claude-code needs its own marketplace added first.
SUPERPOWERS_PLUGIN="superpowers@claude-plugins-official"
EVERYTHING_CLAUDE_CODE_MARKETPLACE="affaan-m/everything-claude-code"
EVERYTHING_CLAUDE_CODE_PLUGIN="everything-claude-code@everything-claude-code"
GSTACK_REPO="https://github.com/garrytan/gstack.git"
GSTACK_DIR="${HOME}/.claude/skills/gstack"

CHECK_ONLY="no"
if [[ "${1:-}" == "--check" ]]; then
  CHECK_ONLY="yes"
fi

have() { command -v "$1" >/dev/null 2>&1; }
say() { printf '%s\n' "$*"; }
warn() { printf 'WARNING: %s\n' "$*" >&2; }

# The version claude reports for an installed plugin, or the empty string.
plugin_version() {
  local plugin="$1"
  claude plugin list 2>/dev/null \
    | awk -v want="$plugin" '
        $0 ~ want {found=1; next}
        found && /Version:/ {print $2; exit}
      '
}

# Warn when what got installed is not what this script pins.
verify_plugin() {
  local plugin="$1" pinned="$2" installed
  installed="$(plugin_version "$plugin")"
  if [[ -z "$installed" ]]; then
    warn "$plugin is not installed; the wiki was built with $pinned"
  elif [[ "$installed" != "$pinned" ]]; then
    warn "$plugin is at $installed, the wiki was built with $pinned"
  else
    say "ok: $plugin $installed"
  fi
}

verify_gstack() {
  local installed
  if [[ ! -f "${GSTACK_DIR}/VERSION" ]]; then
    warn "gstack is not installed; the wiki was built with ${GSTACK_VERSION}"
    return
  fi
  installed="$(tr -d '[:space:]' < "${GSTACK_DIR}/VERSION")"
  if [[ "$installed" != "${GSTACK_VERSION}"* ]]; then
    warn "gstack is at ${installed}, the wiki was built with ${GSTACK_VERSION}"
  else
    say "ok: gstack ${installed}"
  fi
}

say "lca-wiki recommended kit"
say "  superpowers            ${SUPERPOWERS_VERSION}  brainstorming, writing-plans, executing-plans,"
say "                                test-driven-development, systematic-debugging,"
say "                                verification-before-completion, using-git-worktrees"
say "  everything-claude-code ${EVERYTHING_CLAUDE_CODE_VERSION}  python-patterns, python-testing, tdd-workflow,"
say "                                coding-standards, search-first, documentation-lookup,"
say "                                deep-research, verification-loop, security-review"
say "  gstack                 ${GSTACK_VERSION} /spec, /investigate, /review, /ship, /browse, /retro"
say "  get-shit-done          ${GET_SHIT_DONE_VERSION} planner, researcher and verifier agents, context hooks"
say ""

for tool in uv git; do
  if have "$tool"; then
    say "found: $tool"
  else
    warn "$tool is required to work on this repository"
  fi
done

if have claude; then
  say "found: claude"
else
  say "missing: claude (install with: curl -fsSL https://claude.ai/install.sh | bash)"
fi

if [[ "$CHECK_ONLY" == "yes" ]]; then
  say ""
  if have claude; then
    verify_plugin "$SUPERPOWERS_PLUGIN" "$SUPERPOWERS_VERSION"
    verify_plugin "$EVERYTHING_CLAUDE_CODE_PLUGIN" "$EVERYTHING_CLAUDE_CODE_VERSION"
  fi
  verify_gstack
  say ""
  say "--check given, nothing installed."
  exit 0
fi

if ! have claude; then
  say ""
  say "Installing the Claude Code CLI"
  curl -fsSL https://claude.ai/install.sh | bash
fi

say ""
say "Adding the marketplace that is not built in"
claude plugin marketplace add "$EVERYTHING_CLAUDE_CODE_MARKETPLACE"

say ""
say "Installing the plugins (the install command takes no version, so they are verified after)"
claude plugin install "$SUPERPOWERS_PLUGIN"
claude plugin install "$EVERYTHING_CLAUDE_CODE_PLUGIN"
verify_plugin "$SUPERPOWERS_PLUGIN" "$SUPERPOWERS_VERSION"
verify_plugin "$EVERYTHING_CLAUDE_CODE_PLUGIN" "$EVERYTHING_CLAUDE_CODE_VERSION"

if [[ ! -d "$GSTACK_DIR" ]]; then
  say ""
  say "Installing gstack (no tags published upstream, so the default branch is cloned)"
  git clone --depth 1 "$GSTACK_REPO" "$GSTACK_DIR"
  "${GSTACK_DIR}/setup"
fi
verify_gstack

say ""
say "Installing get-shit-done ${GET_SHIT_DONE_VERSION}"
npx "get-shit-done-cc@${GET_SHIT_DONE_VERSION}" --claude --global

say ""
say "Done. This repository itself needs no setup: it is markdown plus one script."
say "Read CLAUDE.md, then index.md and vocabulary.md."
