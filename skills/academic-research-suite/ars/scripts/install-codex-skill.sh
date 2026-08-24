#!/usr/bin/env bash
set -euo pipefail

force=0
dest="${HOME}/.codex/skills/academic-research-suite"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --force)
      force=1
      shift
      ;;
    --dest)
      dest="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 2
      ;;
  esac
done

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/.." && pwd)"
adapter_root="${repo_root}/codex/academic-research-suite"

if [[ ! -f "${adapter_root}/SKILL.md" ]]; then
  echo "Codex adapter not found at ${adapter_root}" >&2
  exit 1
fi

if [[ -e "${dest}" ]]; then
  if [[ "${force}" != "1" ]]; then
    echo "Destination exists: ${dest}. Re-run with --force to replace it." >&2
    exit 1
  fi
  if [[ "${dest}" == "/" || "${dest}" == "${HOME}" ]]; then
    echo "Refusing to remove unsafe destination: ${dest}" >&2
    exit 1
  fi
  rm -rf "${dest}"
fi

mkdir -p "${dest}/ars"
cp "${adapter_root}/SKILL.md" "${adapter_root}/manifest.json" "${adapter_root}/VERSION" "${dest}/"

items=(
  deep-research
  academic-paper
  academic-paper-reviewer
  academic-pipeline
  shared
  scripts
  examples
  docs
  commands
  hooks
  agents
  requirements-dev.txt
  README.md
  README.zh-CN.md
  README.zh-TW.md
  README.ja-JP.md
  QUICKSTART.md
  CHANGELOG.md
  CONTRIBUTING.md
  FORK_NOTICE.md
  LICENSE
  NOTICE.md
  MODE_REGISTRY.md
  POSITIONING.md
  SECURITY.md
)

for item in "${items[@]}"; do
  if [[ -e "${repo_root}/${item}" ]]; then
    cp -R "${repo_root}/${item}" "${dest}/ars/"
  fi
done

echo "Installed Codex skill to ${dest}"
echo 'Restart Codex or open a new conversation, then use $academic-research-suite.'
