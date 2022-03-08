cd ~
sudo rm -rf *
#Install Brave, For Quick Ad-Free Browsing(Prone To Crashes)(Due To Chromium), WHile Install Firefox For Watching Videos, As Due To lack of Physical GPU, Chromium Crashes on Video Rendering, Firefox Surprisingly Works Fine
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install --assume-yes wget firefox brave-browser tasksel aria2 tmate neofetch apt-transport-https tasksel
aria2c https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
#Begin Installing XFCE Environment along with Chrome Remote Desktop
sudo DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb
    apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo systemctl disable lightdm.service
pulseaudio --start ## Enable Sound

#Define Colours For Output-Prompt, Because The Text Is Sometimes Hard To Read For People Who Need Spoonfeeding
NONE='\033[00m' && RED='\033[01;31m' && GREEN='\033[01;32m' && YELLOW='\033[01;33m' && PURPLE='\033[01;35m' && CYAN='\033[01;36m' && WHITE='\033[01;37m' && BOLD='\033[1m' && UNDERLINE='\033[4m'
echo -e "



${BOLD}${UNDERLINE}${YELLOW}GUI Setup Done, Follow The Steps Below Now To Get Access:${NONE}

${BOLD}${GREEN}(1)${NONE} ${BOLD}Go to ${UNDERLINE}${YELLOW}https://remotedesktop.google.com/headless${NONE}
${BOLD}${GREEN}(2)${NONE} ${BOLD}Click ${UNDERLINE}${YELLOW}Begin${NONE} ${BOLD}--> ${UNDERLINE}${YELLOW}Next${NONE} ${BOLD}--> ${UNDERLINE}${YELLOW}Authorize${NONE}
${BOLD}${GREEN}(3)${NONE} ${BOLD}Copy The ${UNDERLINE}${YELLOW}'Debian Linux'${NONE} ${BOLD}Part Of the Code, ${UNDERLINE}Paste It In This Terminal${NONE}
${BOLD}${GREEN}(4)${NONE} ${BOLD}Set any 6-digit pin${NONE}

${BOLD}${GREEN}(5)${NONE} ${UNDERLINE}${YELLOW}${BOLD}Now Access Your Environment Using This Link${NONE}

  ${GREEN}https://remotedesktop.google.com/access${NONE}


${BOLD}${RED}${UDERLINE}Be Sure To Type Something In This Terminal Every 25-30min To Avoid Disconnection${NONE}



${BOLD}${PURPLE}Script Made By: Box In A Box™ (Box-boi)${NONE}


"
#Cleanup
rm -rf chrome-remote-desktop_current_amd64.deb
