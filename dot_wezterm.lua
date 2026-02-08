local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("ZedMono Nerd Font Mono")
config.font_size = 14.0
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.native_macos_fullscreen_mode = false
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},
}

config.unix_domains = {
	{
		name = "unix",
	},
}

config.ssh_backend = "LibSsh"
config.ssh_domains = {
	{
		name = "drakking",
		remote_address = "drakking",
		remote_wezterm_path = "/opt/homebrew/bin/wezterm",
	},
}

config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	{
		key = "t",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			local current = wezterm.mux.get_active_workspace()

			if current == "scratch" then
				window:perform_action(act.SwitchToWorkspace({ name = "default" }), pane)
			else
				window:perform_action(
					act.SwitchToWorkspace({
						name = "scratch",
					}),
					pane
				)
			end
		end),
	},

	{
		key = ",",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			local tab = window:active_tab()
			local panes = tab:panes()

			if #panes == 1 then
				pane:split({
					direction = "Bottom",
					size = 0.4,
				})
			else
				local bottom_pane = panes[#panes]
				window:perform_action(act.CloseCurrentPane({ confirm = false }), bottom_pane)
			end
		end),
	},

	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "+", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },

	-- Workspace management (like tmux sessions)
	{ key = "s", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "WORKSPACES" }) },
	{
		key = "w",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new workspace name:",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
				end
			end),
		}),
	},

	-- Reload config
	{ key = "r", mods = "LEADER", action = act.ReloadConfiguration },
}

-- Status bar (right side showing workspace name)
wezterm.on("update-right-status", function(window, _)
	local workspace = wezterm.mux.get_active_workspace()
	window:set_right_status(wezterm.format({
		{ Foreground = { Color = "#89b4fa" } },
		{ Text = " " .. workspace .. " " },
	}))
end)

return config
