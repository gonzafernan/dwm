# dwm - dynamic window manager
[dwm](https://dwm.suckless.org/) is a dynamic window manager for X. It manages windows in tiled, monocle and floating layouts. All of the layouts can be applied dynamically, optimising the environment for the application in use and the task performed.

## Preview

## Requirements

## Patches
- [alpha](https://dwm.suckless.org/patches/alpha/): 
dwm-alpha-20180613-b69c870.diff
- [autostart](https://dwm.suckless.org/patches/autostart/): dwm-autostart-20161205-bb3bd6f.diff
- [systray](https://dwm.suckless.org/patches/systray/): dwm-systray-6.2.diff
- [xrdb](https://dwm.suckless.org/patches/xrdb/): dwm-xrdb-6.2.diff
- [fullgaps](https://dwm.suckless.org/patches/fullgaps/): dwm-fullgaps-6.2.diff
- [dmenumatchtop](https://dwm.suckless.org/patches/dmenumatchtop/): dwm-dmenumatchtop-6.2.diff
- [activetagindicatorbar](https://dwm.suckless.org/patches/activetagindicatorbar/): dwm-activetagindicatorbar-6.2.diff

## autostart
This patch will make dwm run `~/.dwm/autostart_blocking.sh` and `~/.dwm/autostart.sh &` before entering the handler loop. One or both of these files can be ommited.

In this build, those scripts are in the [scripts](scripts/) folder.

## systray
A simple system tray implementation. Multi-monitor is also supported. The tray is following the selected monitor.

**systray** fails when is patched with **alpha**. To fix this, in the [`dwm.c`](dwm.c) file, I needed to change the following line in the `void updatesystray(void)` function:

```diff
- XFillRectangle(dpy, systray->win, drw->gc, 0, 0, w, bh);
+ XFillRectangle(dpy, systray->win, XCreateGC(dpy, root, 0 , NULL), 0, 0, w, bh);
```

You can see this better in [this commit](https://github.com/FernandezGFG/dwm/commit/490cb88e0216466442ed1b96ad9ef5badf6a1596). I could fix this thanks to [this post in reddit](https://www.reddit.com/r/dwm/comments/aqlicx/question_does_anyone_here_have_a_working_combined/).

## xrdb
Allows dwm to read colors from *xrdb* (`.Xresources`) at run time.

This patch also presents problems with alpha patch, but it's really easy to solve. The conflict is with the function `Clr *drw_scm_create(Drw *drw, char *clrnames[], const unsigned int alphas[], size_t clrcount)`, that xrdb uses and, as you see, the alpha patch added a parameter *alphas*. When you try to build you'll get an error in the following line in the `void xrdb(const Arg *arg)` function:

```diff
- scheme[i] = drw_scm_create(drw, colors[i], 3);
+ scheme[i] = drw_scm_create(drw, colors[i], alphas[i], 3);
```

With that change it works.

## activetagindicatorbar
This patch changes the rectangle indicating if a tag is used by a client into a bar above the tag name.

The only problem is that you need to use a font which leaves enough space between the text of the tag name and the top of the bar. I wanted to use Hack font, so I fix this editing the following line in the [`dwm.c`](dwm.c) file:

```diff
- bh = drw->fonts->h + 2;
+ bh = drw->fonts->h + 10;
```

That increase the statusbar height a lot, but I didn't want to apply the statuspadding patch.

# Trying to contribute

## xbacklight ![](https://img.shields.io/github/v/release/FernandezGFG/dwm?label=xbacklight%20patch)

This patch was developed by myself and [I sent it to suckless.org](https://lists.suckless.org/hackers/2004/17188.html). It's really simple: Adds keys to control monitor backlight using **xbackligh**. See [Backlight in the ArchWiki](https://wiki.archlinux.org/index.php/backlight).

#### Requirements
- xbacklight

#### Configuration
Change the following line in your config file:

```c
static char xbacklight_perc[2] = "5";
```

The `xbacklight_perc` variable gives the value in percentage of brightness you increment or decrement every time you press the monitor brightness key (default to 5).

### Why I removed *xbacklight* patch from my build?
When I [proposed the patch](https://lists.suckless.org/hackers/2004/17188.html), Greg Minshall told me that he handles shortcuts like monitor backlight and volume outside dwm, using *xbindkeys*. After thinking about it, I convinced myself that it's a better choice. In any case, the patch is available to anyone who doesn't have the same opinion.

# License

![](https://img.shields.io/github/license/FernandezGFG/dwm)

<h1 align="center">
        <img width="200" src="dwm.png" alt="dwm">
        <br>
</h1>
