--[[

A simple mpv script to automatically change ytdl-format (yt-dlp)
specifically if the URL is Youtube or Twitch, by default.

Options:
- To add more domains, simply add them to the StreamSource set.
- To adjust quality, edit changedQuality value.
- To enable VP9 codec, change enableVP9 to true.

For more details:
https://github.com/Samillion/mpv-ytdlautoformat

--]]

local function Set (t)
	local set = {}
	for _, v in pairs(t) do set[v] = true end
	return set
end

-- Domains list for custom quality
local StreamSource = Set {
	'youtu.be', 'youtube.com', 'www.youtube.com',
	'twitch.tv', 'www.twitch.tv'
}

-- Do not edit from here on
local msg = require 'mp.msg'

local ytdlChange = "[vcodec^=?avc1]"
local ytdlDefault = "bestvideo+bestaudio/best"

local ytdlChanged = false
local oldpath = mp.get_property("path", "")

local function getStreamSource(path)
	local hostname = path:match '^%a+://([^/]+)/' or ''
	return hostname:match '([%w%.]+%w+)$'
end

local function ytdlAutoChange(name, value)
	if StreamSource[getStreamSource(string.lower(value))] then
		mp.set_property("ytdl-format", ytdlChange)
		msg.info("Domain match found, Changed ytdl-format: "..mp.get_property("ytdl-format"))
	end
	mp.unobserve_property(ytdlAutoChange)
end

local function ytdlCheck()
	if string.match(string.lower(oldpath), "^(%a+://)") then
		mp.set_property("ytdl-format", ytdlDefault)

		mp.observe_property("path", "string", ytdlAutoChange)
		ytdlChanged = true
	end
end

local function ytdlRevert(event)
	if ytdlChanged and event.reason == "error"  then
		mp.ovserve_property("path", "string", oldpath)
		msg.info("Reverting to: "..oldpath)
	end
end
mp.register_event("start-file", ytdlCheck)
mp.register_event("end-file", ytdlRevert)
