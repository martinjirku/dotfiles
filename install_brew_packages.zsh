#!/usr/bin/env zsh

# Define the path to the brew.list file
BREW_LIST_FILE="${ZDOTDIR:-~}/brew.list"

# Check if the brew.list file exists
if [[ ! -f "$BREW_LIST_FILE" ]]; then
    echo "Error: $BREW_LIST_FILE does not exist."
    exit 1
fi

# Read the brew.list file and filter out already installed packages
packages_to_install=()
while IFS= read -r line || [[ -n "$line" ]]; do
    # Skip comments and empty lines
    [[ -z "$line" || "$line" == \#* ]] && continue

    # Check if the package is already installed
    if ! brew list --formula | grep -q "^${line}\$"; then
        packages_to_install+=("$line")
    fi
done < "$BREW_LIST_FILE"

# Check if there are packages to install
if [[ ${#packages_to_install[@]} -eq 0 ]]; then
    exit 0
fi

# Install the filtered packages using xargs
echo "Installing packages: ${packages_to_install[*]}"
printf "%s\n" "${packages_to_install[@]}" | xargs brew install

echo "All required packages have been installed."
