--------------------------
-------  PROGRAMS  -------
--------------------------
local terminal = "wezterm"
local fileManager = "dolphin"
local menu = "hyprlauncher"
local logout = "wlogout"

--------------------------
------ KEYBINDINGS -------
--------------------------
local mainMod = "SUPER"
local binds = {}

--------------------------
-------- PARAMS ----------
--------------------------
local resizeStep = 20

--------------------------
------- Main apps --------
--------------------------
--- Terminal
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
--- Close window
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
--- Search
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
--- Logout/shutdown
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(logout))

--------------------------
---- Window handling -----
--------------------------
-- Fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen("maximized", "toggle"))
-- Window focus navigation
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Window rearrangement-
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Window resize mode
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
	-- Resizing using VIM keys (repeating enabled)
	hl.bind("L", hl.dsp.window.resize({ x = resizeStep, y = 0, relative = true }), { repeating = true }) -- Expand right
	hl.bind("H", hl.dsp.window.resize({ x = (0 - resizeStep), y = 0, relative = true }), { repeating = true }) -- Expand left
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = (0 - resizeStep), relative = true }), { repeating = true }) -- Expand up
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = resizeStep, relative = true }), { repeating = true }) -- Expand down

	-- Press Escape to return to normal mode
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- V or H split group
hl.bind(mainMod .. " + SHIFT + V ", hl.dsp.exec_cmd("hyperctl dispatch hy3:makegroup h"))
hl.bind(mainMod .. " + V ", hl.dsp.exec_cmd("hyperctl dispatch hy3:makegroup v"))

--------------------------
-- Workspace management --
--------------------------
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

--------------------------
--- Audio/media control --
--------------------------
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)

---------->>> UNCONFIRMED
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

----------<<< UNCONFIRMED

-- Return configuration data to the file that require()'s this one
return {
	mainMod = mainMod,
	closeWindowBind = closeWindowBind,
}
