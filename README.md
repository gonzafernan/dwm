# dwm - dynamic window manager
[dwm](https://dwm.suckless.org/) is a dynamic window manager for X. It manages windows in tiled, monocle and floating layouts. All of the layouts can be applied dynamically, optimising the environment for the application in use and the task performed.

## Preview

## Requirements
- xbacklight

## Patches

- [alpha](https://dwm.suckless.org/patches/alpha/): 
dwm-alpha-20180613-b69c870.diff
- [autostart](https://dwm.suckless.org/patches/autostart/): dwm-autostart-20161205-bb3bd6f.diff
- xbacklight

### autostart
This patch will make dwm run `~/.dwm/autostart_blocking.sh` and `~/.dwm/autostart.sh &` before entering the handler loop. One or both of these files can be ommited.

In this build, those scripts are in the [scripts](scripts/) folder.

### xbacklight (personal patch)
This patch was developed by myself and [I sent it to suckless.org](https://lists.suckless.org/hackers/2004/17188.html). It's really simple: Adds keys to control monitor backlight using **xbackligh**. See [Backlight in the ArchWiki](https://wiki.archlinux.org/index.php/backlight).

#### Requirements
- xbacklight

#### Configuration
Change the following line in your config file:

```c
static char xbacklight_perc[2] = "5";
```

The `xbacklight_perc` variable gives the value in percentage of brightness you increment or decrement every time you press the monitor brightness key (default to 5).

<h1 align="center">
        <img width="200" src="dwm.png" alt="dwm">
        <br>
</h1>
