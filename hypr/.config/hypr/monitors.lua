hl.monitor({
	output = "HDMI-A-1",
	mode = "3840x2160@119.88",
	position = "0x0",
	scale = "1",
	bitdepth = 10,
	--cm = "hdr",
	--sdrbrightness = "1.2",
	--sdrsaturation = ".97",
})
hl.monitor({
	output = "DP-1",
	mode = "preferred",
	position = "-2560x1080",
	scale = "1",
	disabled = true,
})
hl.monitor({
	output = "DP-2",
	mode = "preferred",
	position = "-1920x0",
	scale = "1",
	disabled = true,
})
