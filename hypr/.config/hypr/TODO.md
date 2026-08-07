# Migrate from hyprland.conf to lua

Story: I'm migrating to lua since .conf is deprecated.
While I do that I also want my setup to be as vanilla hyprland as possible but retain keybindings
and window behavior that are in my muscle memory. Therefore we should use hy3 and my keybindings relating to:

1. Next window horizontal or vertical
2. Move screen to other desktop

## Fix

## Once all is working

- Add hyprlauncher installation to env-install.sh
- Add user to input group:

```
sudo usermod -aG input $USER
```

- Add blueman/overskride to env-install.sh
- Add wlogout to env-install.sh
- Make sure to stow hypr, wlogout, waybar
