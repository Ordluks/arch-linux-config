ghcup_bin="$HOME/.ghcup/bin"
if [ -d $ghcup_bin ]; then
  append_path $ghcup_bin
  append_path $HOME/.local/bin
fi