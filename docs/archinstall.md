# Setting-up Arch Linux

*Process used for setting up Arch Linux on a Laptop*

Important Links:

- https://wiki.archlinux.org/title/installation_guide
- https://wiki.archlinux.org/title/General_recommendations



## 1. Arch Quick Installation

Arch supplies a tool for quickly installing Arch from an iso installation medium: `archinstall`. This method requires an internet connection which can be achieved using the steps outlined here: https://wiki.archlinux.org/title/installation_guide#Connect_to_the_internet.

The main sections to edit in the `archinstall` screen are:

- *Mirrors*: set to closest location
- *Disk configuration*: choose Arch's installation disk
- *Root password*: ensure to set this
- *User account*: create users for the installation
- *Addition packages*: e.g. `nano firefox alacritty`
- *Network configuration*: set to use iso's configuration
- *Optional repositories*: Ensure the `multilib` repository is selected



## 2. AUR Helper

The Arch User Repository (AUR) holds user submitted packages. These can be found and processed using an AUR helper.

<u>AUR helper: yay</u>

```sh
sudo pacman -S --needed git base-devel
mkdir downloads && cd downloads
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```



## 3. Display Server

Display servers provide content that can be displayed on a client device. The most common display servers are Xorg and Wayland.

<u>Display Server: Xorg</u>

```sh
sudo pacman -S xorg
```



## 4. NVidia Drivers

The process for installing NVidia drivers is here: https://wiki.archlinux.org/title/NVIDIA#Installation.



## 5. Desktop Environment

A Desktop Environment (DE) is the implementation of the GUI seen after the user has logged in. A list of available DEs can be found here: https://wiki.archlinux.org/title/Desktop_environment.

<u>DE: xfce4</u>

```sh
sudo pacman -S xfce4 xfce4-goodies
```



## 6. Display Manager

The Display Manager (DM) is displayed after boot and handles the login screen. Either a console or a graphical DM can be installed.

> Note: Without a DM a plain tty for logging in would be displayed before the desktop environment loaded in.

<u>Console DM: Ly</u>

```sh
# Installation
sudo pacman -S ly
sudo systemctl enable ly.service
sudo systemctl start ly.service

# Config
sudo vim /etc/ly/config.ini
sudo systemctl restart ly.service
```

Other DMs can be found here: https://wiki.archlinux.org/title/display_manager



## 7. Software Tweaking

### A. Touchpad Tweaks

Enable tapping with multiple fingers and 2 finger scrolling in `/etc/X11/xorg.conf.d/30-touchpad.conf`:

```
Section "InputClass"
	Identifier "touchpad"
	MatchDriver "libinput"
	MatchIsTouchpad "on"
	Option "Tapping" "on"
	Option "TappingButtonMap" "lrm" #Multi-finger tapping in order: left, right, middle
	Option "NaturalScolling" "on" #Reverse scrolling direction
EndSection
```

> Note: The `30` in `30-touchpad.conf` is arbitrary but convention - signifies to Xorg the importance, with higher being more important

### B. Configuration

Use DE settings to configure panel, desktop, shortcuts

### C. fprint

Support for fingerprint sensor



## 8. Tips and Tricks

- Use git-credential-oauth instead of git-credential-manager
  - gcm has boarder usage however for most usage (not azure) gco works great

- If yay fails and outputs: `yay: error while loading shared libraries: libalpm.so.14: cannot open shared object file: No such file or directory`
  - Reinstall yay using the below commands:

```bash
sudo pacman -Rns yay-bin yay-bin-debug
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

- Fonts should be installed through the package manager
  - Font names can then be queried using `fc-query -f '%{family[0]}, %{style[0]}\n' /usr/share/fonts/TTF/filename.ttf`
