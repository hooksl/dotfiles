-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This will hold the configuration.
-- local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'tokyonight_storm'
--
-- config.font = wezterm.font 'JetBrains Mono'
local config={
    -- color_scheme = 'tokyonight_storm',
    color_scheme = 'Catppuccin Mocha',
    font= wezterm.font('JetBrainsMono Nerd Font', { weight = 'Regular', italic = false }),
    font_size = 15.0,
    -- default_cursor_style = "BlinkingBar",

    show_tabs_in_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    window_decorations="RESIZE",
    window_padding={
        left=0,
        right=0,
        top=0,
        bottom=0,
    },
    window_background_opacity= 0.95,
    macos_window_background_blur = 80,
    text_background_opacity=0.9,
}

-- and finally, return the configuration to wezterm
return config
