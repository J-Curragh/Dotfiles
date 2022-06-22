# My dotfiles for my home desktop

I got tired of having to reconfigure my system every time I do a fresh install.
| System Component   | Source                                                   | 
| -----------------  | -------------------------------------------------------- |
| Operating System   | [Arch Linux](https://archlinux.org)                      |
| Shell              | [Zsh](https://zsh.org)                                   |
| Display Server     | [X.Org X11](https://www.x.org/releases/X11R7.7/doc/)     |
| Window Manager     | [Airblader's i3wm fork](https://github.com/Airblader/i3) |
| Window Compositor  | [Picom](https://github.com/yshui/picom)                  |
| Text Editor        | [Neovim](https://neovim.io)                              |
| Terminal Emulator  | [Alacritty](https://github.com/alacritty/alacritty)      |
| File Manager       | [Ranger](https://github.com/ranger/ranger)               |
| Status Bar         | [Polybar](https://github.com/polybar/polybar)            |
| Document Reader    | [Zathura](https://pwmt.org/projects/zathura/)            |
| Document Converter | [Pandoc](https://pandoc.org/)                            |



## Installation

1. Install dependencies (see above table)

2. Install GNU Stow...

using Pacman:
```sh
pacman -S stow
```
using APT:
```sh
apt-install stow
```

using DNF:
```sh
dnf install stow
```
...etc

3. Clone this repo, and run GNU Stow

```sh
git clone https://github.com/J-Curragh/dotfiles.git ~/dotfiles --depth=1
cd ~/dotfiles
stow -vS */
```

It should have created symlinks from ~/dotfiles into your home directory. Confirm this with:
```sh
cd
ls -la
```

## TODO

- [ ] Create system-agnostic install scripts 
- [x] Clean polybar config
- [x] Apply Rose Pine Theme to Polybar
- [ ] Package list
- [ ] Font list
