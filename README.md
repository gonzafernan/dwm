# dwm - dynamic window manager
[dwm](https://dwm.suckless.org/) is a dynamic window manager for X. It manages windows in tiled, monocle and floating layouts. All of the layouts can be applied dynamically, optimising the environment for the application in use and the task performed.

## Preview

## Patches

- [alpha](https://dwm.suckless.org/patches/alpha/): 
dwm-alpha-20180613-b69c870.diff
- [autostart](https://dwm.suckless.org/patches/autostart/): dwm-autostart-20161205-bb3bd6f.diff

### autostart
This patch will make dwm run `~/.dwm/autostart_blocking.sh` and `~/.dwm/autostart.sh &` before entering the handler loop. One or both of these files can be ommited.

In this build, those scripts are in the [scripts](scripts/) folder.

![](dwm.png)
