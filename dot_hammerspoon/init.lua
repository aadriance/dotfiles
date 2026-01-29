PaperWM = hs.loadSpoon("PaperWM")
PaperWM:bindHotkeys({
	-- switch to a new focused window in tiled grid
	focus_left = { { "ctrl", "alt" }, "h" },
	focus_right = { { "ctrl", "alt" }, "l" },
	focus_up = { { "ctrl", "alt" }, "k" },
	focus_down = { { "ctrl", "alt" }, "j" },

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
	-- raise all floating windows on top of tiled windows
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

	-- switch to a new Mission Control space
	switch_space_l = { { "alt", "ctrl" }, "," },
	switch_space_r = { { "alt", "ctrl" }, "." },
	switch_space_1 = { { "alt", "ctrl" }, "1" },
	switch_space_2 = { { "alt", "ctrl" }, "2" },
	switch_space_3 = { { "alt", "ctrl" }, "3" },
	switch_space_4 = { { "alt", "ctrl" }, "4" },
	switch_space_5 = { { "alt", "ctrl" }, "5" },
	switch_space_6 = { { "alt", "ctrl" }, "6" },
	switch_space_7 = { { "alt", "ctrl" }, "7" },
	switch_space_8 = { { "alt", "ctrl" }, "8" },
	switch_space_9 = { { "alt", "ctrl" }, "9" },

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
