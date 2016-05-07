emacsPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

spacemacsPath="${emacsPath}/../emacs.d.symlink"

if [ ! -d $spacemacsPath ];
then
	git clone https://github.com/syl20bnr/spacemacs $spacemacsPath >/dev/null 2>&1
	echo "[vim] VundleVim is cloned into bundle directory"
else
	echo "$spacemacsPath is already installed"
fi
