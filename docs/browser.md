# Browser setup

First off, because of Mozilla drama, I replaced firefox with librewolf.
Since librewolf is in the AUR, you either need to install it manually or use a wrapper like [yay](https://github.com/Jguer/yay).

```bash
yay -R --noconfirm firefox
yay -S --noconfirm librewolf-bin
```

Then, if desired, go to `settings -> Privacy&Security -> Cookies and Site Data -> Uncheck: Delete cookies and site data when LibreWolf is closed`

After that, install the following extensions:

- [Dark Reader](https://addons.mozilla.org/en-US/firefox/addon/darkreader/)
- [Firefox Color](https://addons.mozilla.org/en-US/firefox/addon/firefox-color/)
- [Floccus](https://addons.mozilla.org/en-US/firefox/addon/floccus/)
- [KeePassXC-Browser](https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/)
- [SponsorBlock](https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/)
- [Stylus](https://addons.mozilla.org/en-US/firefox/addon/styl-us/)

Log into floccus, after setting up nextcloud.
