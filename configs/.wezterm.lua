local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font_size = 10
config.color_scheme = 'Apple System Colors'

config.keys = {
  -- Разделить панель ПО ВЕРТИКАЛИ (новая панель будет снизу)
  {
    key = 'x', 
    mods = 'ALT', 
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  -- Разделить панель ПО ГОРИЗОНТАЛИ (новая панель будет справа)
  {
    key = 'c', 
    mods = 'ALT', 
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
    -- Перемещение влево
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  -- Перемещение вправо
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  -- Перемещение вверх
  {
    key = 'UpArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  -- Перемещение вниз
  {
    key = 'DownArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  }
}

return config
