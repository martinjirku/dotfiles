info () {
	printf "\r ℹ️  $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;33m✔︎ OK\033[0m ] $1\n"
}


i () {
	local name=$1
	if ! type $name &> /dev/null; then
			tput sc #save cursor
			info "$name installing..."
			cabal install $name > /dev/null
			tput rc;tput el; # rc = restore cursor, el = erase to end of line
			success "$name installed"
		else
			tput rc;tput el;
			success "$name already installed"
	fi
}

i "cabal"
i "stylish-haskell"
i "hlint"
i "hasktags"
i "ghc-mod"
