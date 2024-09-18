
# HwngDaoVuong's rice

> 🗃️ K4ahr's second Hyprland dotfiles, with major changed and improved from the first [dotfiles](https://github.com/k4ahr/dotfiles). I guess I was really that bored...

<img src="screenshots/1.png"></img>
## Screenshots

<img src="screenshots/2.png" width="45%"></img>
<img src="screenshots/3.png" width="45%"></img>
<img src="screenshots/4.png" width="45%"></img>
<img src="screenshots/5.png" width="45%"></img>


# Change and improve from the first rice
> * Make all design shifted from rounded to sharp corners.
> * Improved and completely overhauled the visually of Waybar and wofi.
> * Added dunst - a notification daemon for Hyprland.
> * Added a general menu using wofi.
> * Fixed some OCD minor designs.
> * ~~Switch to fastfetch~~ (I haven't got the fastfetch to auto-scale the image)


## Dependencies



| Component           | Resource  
| :---------          | :-------  
| Window Manager      | [hyprland](https://github.com/hyprwm/Hyprland)
| Color theme         | [pywal16](https://github.com/eylles/pywal16)
| Terminal emulator   | [kitty](https://github.com/kovidgoyal/kitty)
| File manager   | [ranger](https://github.com/ranger/ranger)
| Shell               | [zsh](https://github.com/ohmyzsh)
| Fetch displayer     | [neofetch](https://github.com/dylanaraps/neofetch)
| Resource monitor    | [btop](https://github.com/aristocratos/btop)
| Bar                 | [waybar](https://github.com/Alexays/Waybar)
| Lockscreen          | [sddm](https://github.com/sddm/sddm)
| Idle daemon         | [hypridle](https://github.com/hyprwm/hypridle)
| App launcher        | [wofi](https://hg.sr.ht/~scoopta/wofi)
| Wallpaper daemon    | [swww](https://github.com/LGFae/swww)
| Screenshot tool     | [hyprshot](https://github.com/Gustash/Hyprshot)
| Main Font           | [Noto Sans](https://archlinux.org/packages/extra/any/noto-fonts/) & [Iosevka Nerd Font](https://github.com/ryanoasis/nerd-fonts)
| SDDM font           | [Atkinson Hyperlegible](https://archlinux.org/packages/extra/any/ttf-atkinson-hyperlegible/)
| Wofi and Waybar font| [IBM Plex Mono](https://fonts.google.com/specimen/IBM+Plex+Mono)
| Audio visualizer    | [cava](https://github.com/karlstav/cava)
| Terminal clock      | [tty-clock](https://github.com/xorg62/tty-clock)
| Music player      | [cmus](https://cmus.github.io/)

## Installation


* Install all listed dependencies above, with also  [git](https://github.com/git/git):
* Clone the dotfiles
```bash
$ git clone https://github.com/k4ahr/dotfiles.git
```
* Copy files to the corresponding folders
```bash
$ cp -rf dotfilesV2/* ~/
```
* Copy SDDM theme for the login screen
```bash
$ sudo cp -rf dotfiles/sddm-theme /usr/share/sddm/themes/
```
* Create a `theme.conf` file in `/etc/sddm.conf.d/` with the following contents:
```conf
[Theme]
Current=sddm-theme
```


## Credits
<img src=".config/neofetch/osage.png" align="right" width="200px">

 - [Osage and her wallpapers's artist](https://x.com/nknk_ngrms)
 - [SDDM original corner theme](https://github.com/aczw/sddm-theme-corners)
 - [My Wallpaper Switcher ](https://github.com/k4ahr/wallpaper-switcher)
 - [Other Wallpapers from r/wallpaper](https://www.reddit.com/r/wallpaper/) 
