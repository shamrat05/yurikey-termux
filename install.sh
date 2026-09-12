#!/data/data/com.termux/files/usr/bin/sh
set -eu

prefix=${PREFIX:-/data/data/com.termux/files/usr}
dest="$prefix/bin/yurikey-easy"
alias="$prefix/bin/keybox"
raw_url="https://raw.githubusercontent.com/shamrat05/yurikey-termux/main/yurikey-easy?v=$(date +%s)"
mkdir -p "$prefix/bin"
local_script="$(dirname "$0")/yurikey-easy"
if [ "${1:-}" = --local ] && [ -f "$local_script" ]; then
  source_file="$local_script"
else
  command -v curl >/dev/null 2>&1 || { printf 'ERROR: curl not found\n' >&2; exit 1; }
  temp_file=$(mktemp)
  trap 'rm -f "$temp_file"' EXIT
  curl -fsSL "$raw_url" -o "$temp_file"
  source_file="$temp_file"
fi
cp "$source_file" "$dest"
chmod 700 "$dest"
ln -sf "$dest" "$alias"
printf 'Installed: %s\n' "$dest"
printf 'Launcher: %s\n' "$alias"
printf 'Run: keybox\n'
