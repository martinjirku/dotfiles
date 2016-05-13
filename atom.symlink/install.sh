info () {
	echo "\r ℹ️  $1"
}

success () {
	echo "\r\033[2K  [ \033[00;33m✔︎ OK\033[0m ] $1"
}

i () {
	local package=$1
	if [[ ! -d "$HOME/.atom/packages/$package" ]]
	then
		tput sc #save cursor
		info "$package installing..."
		apm install $package
		tput rc;tput el; # rc = restore cursor, el = erase to end of line
		success "$package installed"
	else
		success "$package package already installed"
	fi
}


#installation
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
#i vim-mode-plus
i ide-haskell
i haskell-grammar
