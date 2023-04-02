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
