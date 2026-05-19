local terminal = "kitty"
local fileManager = "nautilus"
local menu = "wofi --show drun"
local main_mod = "SUPER"

hl.bind(main_mod .. " + Return", hl.dsp.exec_cmd(terminal), { release = true })
hl.bind(main_mod .. " + Q", hl.dsp.window.close())
hl.bind(
	main_mod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshurdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(main_mod .. " + B", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind("CTRL + SHIFT + 1", hl.dsp.exec_cmd("~/.config/hypr/monitortogle.sh DP-1"))
hl.bind("CTRL + SHIFT + 2", hl.dsp.exec_cmd("~/.config/hypr/monitortogle.sh DP-2"))
hl.bind(main_mod .. " + SHIFT + M", hl.dsp.exec_cmd(terminal .. " yazi ~/mnt/plex/Movies"))
hl.bind(main_mod .. " + SHIFT + O", hl.dsp.exec_cmd(terminal .. " yazi ~/.config/hypr"))
hl.bind(main_mod .. " + SHIFT + Z", hl.dsp.exec_cmd("zen-browser"))
hl.bind(main_mod .. " + SHIFT + A", hl.dsp.exec_cmd("helium-browser"))
hl.bind(main_mod .. " + SHIFT + R", hl.dsp.exec_cmd("rustdesk"))
hl.bind(main_mod .. " + SHIFT + DELETE", hl.dsp.exec_cmd("shutdown now"))
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(main_mod .. " + V", hl.dsp.exec_cmd(terminal .. " --class clipse -e clipse"))
hl.bind(main_mod .. " + SHIFT + Q", hl.dsp.exec_cmd("sh -c 'wl-paste --no-newline | xargs -r mpv --'"))

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("CTRL + DELETE", hl.dsp.exec_cmd("hyprlock"))
hl.bind(main_mod .. " + A", hl.dsp.exec_cmd("anyrun"))
hl.bind(main_mod .. " + H", hl.dsp.focus({ direction = "left" }), { bypass = true, locked = true })
hl.bind(main_mod .. " + J", hl.dsp.focus({ direction = "down" }), { bypass = true })
hl.bind(main_mod .. " + K", hl.dsp.focus({ direction = "up" }), { bypass = true })
hl.bind(main_mod .. " + L", hl.dsp.focus({ direction = "right" }), { bypass = true, locked = true })

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }), { bypass = true })
	hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { bypass = true })
end

hl.bind(main_mod .. " + CTRL + H", hl.dsp.layout("swapcol l"), { bypass = true })
hl.bind(main_mod .. " + CTRL + L", hl.dsp.layout("swapcol r"), { bypass = true })
hl.bind(main_mod .. " + CTRL + J", hl.dsp.layout("consume_or_expel prev"), { bypass = true })
hl.bind(main_mod .. " + CTRL + K", hl.dsp.layout("consume_or_expel next"), { bypass = true })
hl.bind(main_mod .. " + CTRL + comma", hl.dsp.layout("colresize +conf"), { bypass = true })
hl.bind(main_mod .. " + CTRL + period", hl.dsp.layout("colresize -conf"), { bypass = true })

hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(main_mod .. " + CTRL + D", hl.dsp.exec_cmd("playerctl next"), { bypass = true, locked = true })
hl.bind(main_mod .. " + CTRL + SPACE", hl.dsp.exec_cmd("playerctl play-pause"), { bypass = true, locked = true })
hl.bind(main_mod .. " + CTRL + A", hl.dsp.exec_cmd("playerctl previous"), { bypass = true, locked = true })
hl.bind(
	main_mod .. " + CTRL + S",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
	{ bypass = true, locked = true, repeating = true }
)
hl.bind(
	main_mod .. " + CTRL + W",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"),
	{ bypass = true, locked = true, repeating = true }
)
hl.bind(
	main_mod .. " + CTRL + E",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ toggle"),
	{ bypass = true, locked = true }
)
