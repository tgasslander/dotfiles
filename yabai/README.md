# Yabai

Tiling window manager for MacOS.
The purpose (to me) with `yabai` is to mimic the behavior of what I am used to
on linux using [i3 (gaps)](https://github.com/Airblader/i3).

Use `yabai` together with [skhd](https://github.com/koekeishiya/skhd) and [limelight](https://github.com/koekeishiya/limelight).

## Description

- `yabai` handles is the window manager that gives you tiling
- `skhd` is your keymapping to control `yabai`
- `limelight` gives you granular control of the active window border

## Installation

Follow the instructions on the `yabai` github page.
Also make sure to install `skhd` and clone and build `limelight`.

You'll need to symlink or copy the limelight binary which will be available in
the `bin` folder to a location that's in your `$PATH`.

## Config

- The `yabai` config seems to work best if it's (symlinked in or) store in `~/.config/yabai/yabairc`.
- The `limelight` config should also be somewhat XDG compatible and located
(or symlinked) in `~/.config/skhd/skdhdrc`.
- The `skhd`config goes directly into your home directory like `~/.config/skdhdrc`.
