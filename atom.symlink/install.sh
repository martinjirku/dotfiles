i () {
    local package=$1
    if [[ ! -d "$HOME/.atom/packages/$package" ]]
    then
        apm install $package --verbose
    else
        printf "package already installed: \t $package \n"
    fi
}

#
i Parinfer
i atom-handlebars
i atom-ternjs
i auto-detect-indentation
i docblockr
i docs-snippets
i highlight-selected
i ink
i jsdoc-generator
i lisp-paredit
i proto-repl
i proto-repl-charts
i set-syntax
i turbo-javascript
i vim-mode-plus
