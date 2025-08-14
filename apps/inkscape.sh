#!/bin/bash

cd ~/Downloads
wget https://inkscape.org/gallery/item/56343/Inkscape-ebf0e94-x86_64.AppImage
mkdir -p ~/.local/bin/inkscape

mv Inkscape-ebf0e94-x86_64.AppImage ~/.local/bin/inkscape/Inkscape.AppImage
cd -
cd ~/.local/bin/inkscape
chmod +x ./Inkscape.AppImage
./Inkscape.AppImage --appimage-extract


mv ~/.local/bin/inkscape/squashfs-root/org.inkscape.Inkscape.png ~/.local/bin/inkscape/org.inkscape.Inkscape.png
mv ~/.local/bin/inkscape/squashfs-root/.DirIcon ~/.local/bin/inkscape/.DirIcon
rm -rf squashfs-root

cd -

cat << EOF > ~/.local/share/applications/inkscape.desktop
[Desktop Entry]
Name=Inkscape
Exec=/home/darren/.local/bin/inkscape/Inkscape.AppImage %F
Icon=/home/darren/.local/bin/inkscape/org.inkscape.Inkscape.png
Type=Application
EOF