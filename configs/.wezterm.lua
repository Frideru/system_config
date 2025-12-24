local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font_size = 10
config.color_scheme = 'Apple System Colors'

config.keys = {
  --
  -- Разделение панели
  -- 
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

  --
  -- Перемещение фокуса
  -- 
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
  },

  --
  -- Перемещение окон
  --
  -- ПЕРЕМЕЩЕНИЕ (смена мест) панелей
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.RotatePanes 'CounterClockwise',
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.RotatePanes 'Clockwise',
  },

  --
  -- Изменение размера окон
  -- 
  -- Изменить размер ВЛЕВО
  {
    key = 'LeftArrow',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  -- Изменить размер ВПРАВО
  {
    key = 'RightArrow',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  -- Изменить размер ВВЕРХ
  {
    key = 'UpArrow',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  -- Изменить размер ВНИЗ
  {
    key = 'DownArrow',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
}

return config
