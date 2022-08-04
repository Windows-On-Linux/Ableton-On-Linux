dirname = Ableton_Live_11_Suite
desktop = $(xdg-user-dir DESKTOP)
echo "Preparing the folder..."
cd ~/wol
mkdir $dirname
echo "Installing all dependencies for Ableton Live 11 Suite and preparing all enviroments, Please wait..."
WINEARCH=win64 WINEPREFIX=~/wol/$dirname winetricks d3dx9 dotnet35 dotnet452 dxvk gdiplusvcrun2019 corefonts tahoma vcrun6sp6
WINEARCH=win64 WINEPREFIX=~/wol/$dirname winetricks win10
echo "Creating shortcut on your desktop, please don't open it until the installer finish its work"
cp ./ableton.sh ~/wol/$dirname
cp ./icon.png ~/wol/$dirname
cp ./ableton.desktop ~/$desktop
cd ~/wol/$dirname/drive_c
echo "Downloading Ableton Live 11 Suite, this depends on your internet connection speed, Please wait..."
wget https://cdn-downloads.ableton.com/channels/11.1.5/ableton_live_suite_11.1.5_64.zip
echo "Unzipping Ableton Live 11 Suite..."
unzip ableton_live_suite_11.1.5_64.zip
echo "The installer is ready to run"
WINEARCH=win64 WINEPREFIX=~/wine/ableton wine ~/wine/ableton/drive_c/ableton_live_suite_11.1.5_64/"Ableton Live 11 Suite Installer.exe"
echo "The installer is finished"