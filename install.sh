# fonts 
sudo pacman -S ttf-dejavu ttf-font-awesome ttf-nerd-fonts-symbols ttf-jetbrains-mono-nerd

# wallpaper

sudo pacman -S hyprpaper

# clipboard
sudo pacman -S wl-clipboard cliphist

# alerts
sudo pacman -S libnotify swaync

# sound 
#sudo pacman -S pipewire-jack
#sudo pacman -S pipewire pipewire-alsa pipewire-pulse wireplumber
sudo pacman -S --noconfirm pipewire-jack
sudo pacman -S --noconfirm pipewire pipewire-alsa pipewire-pulse wireplumber pipewire-jack
systemctl --user enable --now pipewire pipewire-pulse wireplumber

# XDG Desktop Portal
sudo pacman -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
systemctl --user enable --now xdg-desktop-portal.service  
systemctl --user enable --now xdg-desktop-portal-hyprland.service

# status bar
sudo pacman -S waybar

# video
sudo pacman -S qt6-multimedia-backend-ffmpeg

# terminal
sudo pacman -S alacritty kitty

# file manager
sudo pacman -S yazi
sudo pacman -S yazi ffmpegthumbnailer poppler fd ripgrep
sudo pacman -S fzf zoxide
sudo pacman -S chafa

# launcher
sudo pacman -S wofi

# browser 
sudo pacman -S firefox

# Editor
sudo pacman -S vim

# HyprLAND
sudo pacman -S hyprland
