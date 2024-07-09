# mpv-ytdlautoformat
A simple mpv script to automatically change `ytdl-format`, for Youtube by default, but more domains can be added as desired.

This script supports and works with multi-purpose playlists. For example, if you have a playlist that includes Youtube URLs, Vimeo URLs and local files.

If the URL is Youtube, `ytdl-format` is set to: avc1 codec (By default, can be changed).

Otherwise, `ytdl-format` is set to: Best video quality.

# Options
If you would like to add more domains to have `ytdl-format` automatiaclly changed for them, simply add them to the `StreamSource` set.

To adjust quality of matched domains, edit `ytdlChange` value.

# How is this script useful?
Youtube limits the download speed of every other codec then AVC1.

# Changes to mpv configuration made by the script
The script will override any `ytdl-format` you have set in `mpv.conf` or in commandline to the values you have set within the script.

No files are edited or changed in any way, the script simply changes `ytdl-format` value, so whatever is in `mpv.conf` or CLI is ignored.

# How to install
Simply place `ytdlautoformat.lua` in the corresponding mpv scripts folder of your operating system:

- Windows: `%APPDATA%\mpv\scripts\` or `C:\users\USERNAME\AppData\Roaming\mpv\scripts\`
- Linux: `~/.config/mpv/scripts/` or `/home/USERNAME/.config/mpv/scripts/`
- Mac: `~/.config/mpv/scripts/` or `/Users/USERNAME/.config/mpv/scripts/`

# How to uninstall
The script doesn't change or alter configuration in other files, so removing the `ytdlautoformat.lua` script from the mpv scripts folder is all that is needed to uninstall/disable.

# Preview
A screenshot of the script running and showing process and changes in a playlist.

![ytdl-autoformat-demo](https://github.com/Samillion/mpv-ytdlautoformat/assets/17427046/57d132bc-ae4c-4ec5-b924-a61354754466)
