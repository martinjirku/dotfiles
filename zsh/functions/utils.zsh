# Decode JWT tokens
jwtdecode() {
    jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<< "$(cat -)"
}

# Show recent git branches
git-recent-branches() {
    git reflog --date=iso | grep 'checkout: moving from' | sed -E 's/^.*checkout: moving from [^ ]+ to ([^ ]+).*$/\1/' | awk '!seen[$0]++' | xargs -I{} sh -c 'git show -s --format="%ct {}" "{}" 2>/dev/null' | sort -nr |cut -d' ' -f2-
}
