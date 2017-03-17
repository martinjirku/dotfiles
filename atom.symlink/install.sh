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
i atom-handlebars
i auto-detect-indentation
i highlight-selected
i jsdoc-generator
