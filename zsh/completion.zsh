# source ${ZDOTDIR:-~}/zsh-completions/zsh-completions.plugin.zsh
fpath=(${ZDOTDIR:-~}/plugins/zsh-completions/src $fpath)

# Load pnpm completion
if command -v pnpm >/dev/null 2>&1; then
  eval "$(pnpm completion zsh)"
fi

# Package.json script completion
# This allotws you to run npm/yarn/pnpm scripts with tab completion
_npm_scripts() {
  local package_json_path="package.json"
  
  if [[ ! -f "$package_json_path" ]]; then
    return
  fi
  
  local scripts=$(node -e "
    try {
      const pkg = JSON.parse(require('fs').readFileSync('$package_json_path', 'utf8'));
      if (pkg.scripts) {
        Object.keys(pkg.scripts).forEach(script => console.log(script));
      }
    } catch (e) {
      // Silently fail if package.json is invalid
    }
  ")
  
  if [[ -n "$scripts" ]]; then
    compadd -X "Available scripts:" $(echo "$scripts")
  fi
}

# Add completion for npm/yarn/pnpm run commands
compdef _npm_scripts npm run
compdef _npm_scripts yarn
compdef _npm_scripts pnpm run