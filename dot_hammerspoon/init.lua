PaperWM = hs.loadSpoon("PaperWM")
PaperWM:bindHotkeys({
	-- move windows around in tiled grid
	swap_left = { { "ctrl", "alt" }, "left" },
	swap_right = { { "ctrl", "alt" }, "right" },
	swap_up = { { "ctrl", "alt" }, "up" },
	swap_down = { { "ctrl", "alt" }, "down" },

	-- position and resize focused window
	center_window = { { "alt", "ctrl" }, "c" },
	full_width = { { "alt", "ctrl" }, "f" },
	cycle_width = { { "alt", "ctrl" }, "r" },

	-- move focused window into / out of a column
	slurp_in = { { "alt", "ctrl" }, "i" },
	barf_out = { { "alt", "ctrl" }, "o" },

	-- move the focused window into / out of the tiling layer
	toggle_floating = { { "alt", "ctrl" }, "m" },
	focus_floating = { { "alt", "ctrl", "shift" }, "f" },

	-- focus the first / second / etc window in the current space
	focus_window_1 = { { "cmd", "shift" }, "1" },
	focus_window_2 = { { "cmd", "shift" }, "2" },
	focus_window_3 = { { "cmd", "shift" }, "3" },
	focus_window_4 = { { "cmd", "shift" }, "4" },
	focus_window_5 = { { "cmd", "shift" }, "5" },
	focus_window_6 = { { "cmd", "shift" }, "6" },
	focus_window_7 = { { "cmd", "shift" }, "7" },
	focus_window_8 = { { "cmd", "shift" }, "8" },
	focus_window_9 = { { "cmd", "shift" }, "9" },

	-- move focused window to a new space and tile
	move_window_1 = { { "alt", "ctrl", "shift" }, "1" },
	move_window_2 = { { "alt", "ctrl", "shift" }, "2" },
	move_window_3 = { { "alt", "ctrl", "shift" }, "3" },
	move_window_4 = { { "alt", "ctrl", "shift" }, "4" },
	move_window_5 = { { "alt", "ctrl", "shift" }, "5" },
	move_window_6 = { { "alt", "ctrl", "shift" }, "6" },
	move_window_7 = { { "alt", "ctrl", "shift" }, "7" },
	move_window_8 = { { "alt", "ctrl", "shift" }, "8" },
	move_window_9 = { { "alt", "ctrl", "shift" }, "9" },
})

-- Manually manage ghostty to avoid global term and tabs from getting messy
PaperWM.window_filter:rejectApp("Ghostty")
PaperWM.window_ratios = { 1 / 4, 1 / 2, 3 / 4 }

PaperWM:start()

-- Focus + auto-center: ctrl+alt+hjkl
local Direction = PaperWM.windows.Direction
local dirKeys = { h = Direction.LEFT, l = Direction.RIGHT, k = Direction.UP, j = Direction.DOWN }
for key, dir in pairs(dirKeys) do
	hs.hotkey.bind({ "ctrl", "alt" }, key, function()
		PaperWM.windows.focusWindow(dir)
		PaperWM.windows.centerWindow()
	end)
end

-- Space switching with delayed refocus
local function switchAndRefocus(fn, ...)
	local args = table.pack(...)
	fn(table.unpack(args))
	hs.timer.doAfter(0.3, function()
		local win = hs.window.focusedWindow()
		if win then win:focus() end
	end)
end

for i = 1, 9 do
	hs.hotkey.bind({ "alt", "ctrl" }, tostring(i), function()
		switchAndRefocus(PaperWM.space.switchToSpace, i)
	end)
end
hs.hotkey.bind({ "alt", "ctrl" }, ",", function()
	switchAndRefocus(PaperWM.space.incrementSpace, Direction.LEFT)
end)
hs.hotkey.bind({ "alt", "ctrl" }, ".", function()
	switchAndRefocus(PaperWM.space.incrementSpace, Direction.RIGHT)
end)
