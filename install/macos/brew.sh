# Install Homebrew

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew tap ArmMbed/homebrew-formulae
brew tap railwaycat/emacsmacport
brew tap wuxiaoqiang12/QemuRpi3Hyp
brew update
brew upgrade

# Install packages
apps=(
#    caskroom/cask/brew-cask
    cmake
    git
	pandoc
    vim
	emacs-mac --with-spacemacs-icon
    wget
    zsh
	youtube-dl
    htop
    tree
	armmbed/formulae/arm-none-eabi-gcc
)

brew install "${apps[@]}"
brew install --build-from-source u-boot-tools
brew install --build-from-source wuxiaoqiang12/qemurpi3hyp/qemu-rpi3-hyp
brew cleanup

caskapps=(
    alfred
	adobe-creative-cloud
    cheatsheet
    dash
    google-chrome
    clion
    zotero
	zoomus
	visual-studio-code
	qq
	balenaetcher
	detexify
	beyond-compare
	mos
	teamviewer
	snipaste
	istat-menus
	marginnote
	eudic
	typora
	cmake
	nutstore
	baidunetdisk
)

brew tap caskroom/versions
brew cask update
brew cask install --appdir="/Applications" "${caskapps[@]}"
brew cask cleanup
