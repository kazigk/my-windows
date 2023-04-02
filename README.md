# My Windows

Created for and tested on Windows 11 22H2 build 22621.1413.

I created these scripts to make my setup process more streamlined and reproducible.

If you're a DevOps and own more than one Windows PC, you can probably relate.

## List of changes

- dark theme for system and apps
- full context menu instead of the handicapped W11 context menu
- MS Edge tabs removed from window switcher
- snap assist disabled
- taskbar:
  * chat (Teams) icon hidden
  * task view icon hidden
  * search icon hidden
  * start button moved to the left
- virtual desktops behaviour:
  * show windows from all desktops in the taskbar
  * show only windows from the current desktop in window switcher
- useless crap:
  * widgets (weather, etc.) removed
  * stickers disabled
  * advertising ID disabled
  * automatic installation of third party apps disabled
  * feedback notifications disabled
  * tailored experiences disabled
  * suggested content disabled
  * app launch tracking disabled
  * inking & typing personalisation disabled
  * telemetry disabled
- language & region:
  * regional format set to _English (United Kingdom)_
  * preferred language set to _English (United States)_ with _Polish (Programmers)_ keyboard layout
  * second preferred language set to _Polish_ (for spellchecking)

## Extras

### ExplorerPatcher

I started using [ExplorerPatcher](https://github.com/valinet/ExplorerPatcher) when the registry hack for Windows 10 ribbon in file explorer stopped working. It aims to enhance the working environment on Windows, and it's a must have for everyone who prefers usability over the looks or just wants to tweak the system behaviour. See the [wiki](https://github.com/valinet/ExplorerPatcher/wiki) for a list of features.

Some of the changes I've done with ExplorerPatcher are redundant with my presonalisation script, so I'll only list my personal favorites:
- W10 file explorer ribbon
- W10 taskbar (small taskbar works too!)
- W10 start menu
- W10 flyouts (I can finally easily change the audio output)
- W10 window switcher
- This PC -> Properties no longer redirects to Settings app

Currently, the installation of ExplorerPatcher can't be automated due to a lack of a way to import the settings from command line, see valinet/ExplorerPatcher#1245.

### AutoHotkey

The homepage of [AutoHotkey](https://www.autohotkey.com/) says it all: the ultimate automation scripting language for Windows.

Currently, there is just one script, as I manage my rebinds and macros in QMK.

#### vd.ahk

After 8 years of sticking to tilling window managers (mostly [bspwm](https://github.com/baskerville/bspwm)), I'm used to utilizing multiple workspaces or virtual desktops, whatever you call it. Virtual desktops in Windows are a bit weird, as there is no native way of assigning your own shortcuts (like on macOS, for example). I wrote a simple script that utilizes [VirtualDesktopAccessor](https://github.com/Ciantic/VirtualDesktopAccessor) and fixes this issue.

Default keybinds:
  - CapsLock+<1-4> - goes to a respective virtual desktop
  - CapsLock+<1-4> while holding LMB - as above, but you get to keep the window that you're holding
  - Shift+CapsLock+<1-4> - moves foreground window to a respective virtual desktop
  - Shift+Enter - either opens a Windows Terminal or brings the current instance of it to the foreground

I'm aware of the quake terminal that's built into Windows Terminal, but it's broken if you happen to use virtual desktops. That and the fact that I'm not a big fan of quake terminal is the reason why it's a part of this script.

Also, it's quite similar to the [example](https://github.com/Ciantic/VirtualDesktopAccessor/blob/rust/example.ah2), which also covers more functionalities of the library, so I recommend giving it a look.
