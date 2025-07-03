#  DJ - Directory Jumper

# Directory Jumper with fuzzy finding
function dj_help() {
    cat << 'HELP'
Directory Jumper (dj) - Navigate quickly to saved directories

USAGE:
  dj                    - Interactive fuzzy search through saved directories
  dj [search_term]      - Search for directories matching the term and jump to it
                          (directly jumps if only one match, otherwise shows fuzzy search)
  dj add                - Add current directory to jump list
  dj add [directory]    - Add specified directory to jump list
  dj edit               - Select a directory to navigate to and open in $EDITOR
  dj edit [search_term] - Search for directories matching the term, navigate to it and open in $EDITOR
  dj help               - Show this help message

CONFIGURATION:
  Directories are stored in ~/.config/dirjump/directories
  Each line in the file represents a directory path
  Lines starting with # are treated as comments

EXAMPLES:
  dj                   - Interactive selection from all saved directories
  dj projects          - Jump to directory matching "projects" (fuzzy search)
  dj add               - Add current directory to jump list
  dj add ~/Documents   - Add ~/Documents to jump list
  dj edit              - Select a directory, cd to it and open in editor
  dj edit projects     - Find directory matching "projects", cd to it and open in editor

TIPS:
  - If your search term exactly matches a directory name, it will jump directly
  - Tab completion shows directory names with full paths as descriptions
  - Use fzf navigation in interactive mode (arrow keys, ctrl+n/p, etc.)
  - install fzf-tab to get tab completion for dj
  - The edit command requires $EDITOR environment variable to be set
HELP
}

# Directory Jumper with fuzzy finding
function dj() {
    local config_file="$HOME/.config/dirjump/directories"
    
    # Show help message
    if [[ "$1" == "help" ]]; then
        dj_help
        return 0
    fi

    # Check if config file exists
    if [[ ! -f "$config_file" ]]; then
        local config_dir="$(dirname "$config_file")"
        echo "Config file not found: $config_file"
        read -q "Would you like to create it? (y/n) "
        echo ""
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            mkdir -p "$config_dir"
            touch "$config_file"
            echo "Created new config file: $config_file"
        else
            echo "Operation cancelled."
            return 1
        fi
    fi

    # Handle subcommands
    if [[ "$1" == "add" ]]; then
        local dir_to_add=""
        
        # If a second argument is provided, use it as the directory
        if [[ -n "$2" ]]; then
            dir_to_add="$2"
        else
            # If no second argument, use current directory
            dir_to_add="$PWD"
        fi
        
        # Convert to absolute path
        dir_to_add=$(realpath "$dir_to_add")
        
        # Check if directory exists
        if [[ ! -d "$dir_to_add" ]]; then
            echo "Error: '$dir_to_add' is not a valid directory"
            return 1
        fi
        
        # Check if the directory is already in the config
        if grep -Fxq "$dir_to_add" "$config_file"; then
            echo "Directory already exists in jump list: $dir_to_add"
            return 0
        fi
        
        # Add the directory to the config file
        echo "$dir_to_add" >> "$config_file"
        echo "Added to jump list: $dir_to_add"
        return 0
    fi
    local dir=$(grep -v "^#" "$config_file" | fzf --query="$1" --select-1 --delimiter="/" --header="Search by directory name" --with-nth=1..-1 --nth=-1)
   # Handle edit subcommand
    if [[ "$1" == "edit" ]]; then
        if [[ -z "$EDITOR" ]]; then
            echo "Error: \$EDITOR environment variable not set"
            echo "Please set your preferred editor with: export EDITOR=your_editor"
            return 1
        fi
        
        # If a second argument is provided, use it for directory search
        if [[ -n "$2" ]]; then
            # First check for exact folder name match
            local exact_match=$(grep -v "^#" "$config_file" | xargs -L1 bash -c 'if [[ "$(basename "$0")" == "'$2'" ]]; then echo "$0"; fi')
            
            # If there's an exact match to folder name, use it immediately
            if [[ -n "$exact_match" ]]; then
                cd "$exact_match"
                $EDITOR "$exact_match"
                return 0
            fi
            
            # Otherwise search for partial matches
            local matches=$(grep -i "$2" "$config_file" | grep -v "^#")
            local match_count=$(echo "$matches" | grep -v "^$" | wc -l)
            
            if [[ $match_count -eq 0 ]]; then
                echo "No matching directories found for '$2'"
                return 1
            elif [[ $match_count -eq 1 ]]; then
                # Single match, edit directly
                cd "$selected_dir"
                $EDITOR "$matches"
                return 0
            else
                # Multiple matches, use fzf to select
                local selected_dir=$(echo "$matches" | fzf --query="$2")
                if [[ -n "$selected_dir" ]]; then
                    cd "$selected_dir"
                    $EDITOR "$selected_dir"
                    return 0
                fi
            fi
        else
            if [[ -n "$selected_dir" ]]; then
                cd "$selected_dir"
                $EDITOR "$selected_dir"
                return 0
            fi
        fi
        
        return 0
    fi

    # If no argument is provided, use fzf to select
    if [[ -z "$1" ]]; then
        cd "$selected_dir"
    else
        # If argument is provided, first check for exact folder name match
        local exact_match=$(grep -v "^#" "$config_file" | xargs -L1 bash -c 'if [[ "$(basename "$0")" == "'$1'" ]]; then echo "$0"; fi')
        
        # If there's an exact match to folder name, use it immediately
        if [[ -n "$exact_match" ]]; then
            cd "$exact_match"
            return
        fi

        local matches=$(grep -i "$1" "$config_file" | grep -v "^#")
        local match_count=$(echo "$matches" | grep -v "^$" | wc -l)
        
        if [[ $match_count -eq 1 ]]; then
            # Single match, go directly
            cd "$matches"
            return 0
        fi
        basename=$(which basename)
        # If argument is provided, try to match it
        dir=$(echo $dir | cut -d':' -f2)
        if [[ -n "$dir" ]]; then
            echo "Navigating to: $dir"
            cd "$dir"
        else
            echo "No directory selected"
            return 1
        fi
    fi
}
_jump_complete() {
    local config_file="$HOME/.config/dirjump/directories"
    if [[ -f "$config_file" ]]; then
        local -a directory_data
        while IFS= read -r line; do
            [[ "$line" =~ ^# ]] && continue
            local basename=$(basename "$line")
            # Format as "basename:description" where description is the full path
            directory_data+=("$basename:$line")
        done < "$config_file"
        _describe 'directories' directory_data
    fi
}
compdef _jump_complete dj