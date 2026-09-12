#!/data/data/com.termux/files/usr/bin/sh
set -eu

prefix=${PREFIX:-/data/data/com.termux/files/usr}
dest="$prefix/bin/yurikey-easy"
mkdir -p "$prefix/bin"
cp "$(dirname "$0")/yurikey-easy" "$dest"
chmod 700 "$dest"
printf 'Installed: %s\n' "$dest"
printf 'Run: yurikey-easy\n'
