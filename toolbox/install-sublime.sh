#!/bin/sh

if [ -f /usr/local/bin/subl ]; then
	echo 'sublime text already installed'
	echo "run with:subl"

    return
fi
# Sublime Text 3 Install 
# Detect the architecture
if [[ "$(uname -m)" = "x86_64" ]]; then
  ARCHITECTURE="x64"
else
  ARCHITECTURE="x32"
fi

# Fetch the latest build version number (thanks daveol)

BUILD=$(echo $(curl http://www.sublimetext.com/3) | sed -rn "s#.*The latest build is ([0-9]+)..*#\1#p")

URL="https://download.sublimetext.com/sublime_text_3_build_{$BUILD}_{$ARCHITECTURE}.tar.bz2"
INSTALLATION_DIR="/opt/sublime_text"


# Download the tarball, unpack and install

curl -o $HOME/st3.tar.bz2 $URL
if tar -xf $HOME/st3.tar.bz2 --directory=$HOME; then
  sudo mv $HOME/sublime_text_3 $INSTALLATION_DIR
  sudo ln -s $INSTALLATION_DIR/sublime_text /usr/local/bin/subl
fi
rm $HOME/st3.tar.bz2


# Add to applications list and set icon

sed 's/Icon=sublime-text/Icon=\/opt\/sublime_text\/Icon\/128x128\/sublime-text.png/g' > $HOME/.local/share/applications/sublime_text.desktop

echo '
Sublime Text 3 installed successfully!
Run with: subl
'