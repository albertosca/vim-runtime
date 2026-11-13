-- generated from ~/.dotfiles/config/theme; do not edit by hand
-- gravel for lualine: picks the palette from vim.o.background when loaded.
local themes = {}
themes.dark = {
  normal = { a = { fg = '#d4be98', bg = '#3c3836', gui = 'bold' }, b = { fg = '#d4be98', bg = '#32302f' }, c = { fg = '#a89984', bg = '#282828' } },
  insert = { a = { fg = '#1d2021', bg = '#2bb8fa', gui = 'bold' }, b = { fg = '#d4be98', bg = '#32302f' }, c = { fg = '#a89984', bg = '#282828' } },
  visual = { a = { fg = '#1d2021', bg = '#d4be98', gui = 'bold' }, b = { fg = '#d4be98', bg = '#32302f' }, c = { fg = '#a89984', bg = '#282828' } },
  replace = { a = { fg = '#1d2021', bg = '#ea6962', gui = 'bold' }, b = { fg = '#d4be98', bg = '#32302f' }, c = { fg = '#a89984', bg = '#282828' } },
  command = { a = { fg = '#d4be98', bg = '#3c3836', gui = 'bold' }, b = { fg = '#d4be98', bg = '#32302f' }, c = { fg = '#a89984', bg = '#282828' } },
  inactive = { a = { fg = '#a89984', bg = '#282828' }, b = { fg = '#a89984', bg = '#282828' }, c = { fg = '#a89984', bg = '#282828' } },
}
themes.light = {
  normal = { a = { fg = '#654735', bg = '#d5c4a1', gui = 'bold' }, b = { fg = '#654735', bg = '#ebdbb2' }, c = { fg = '#6e6257', bg = '#f2e5bc' } },
  insert = { a = { fg = '#1d2021', bg = '#2bb8fa', gui = 'bold' }, b = { fg = '#654735', bg = '#ebdbb2' }, c = { fg = '#6e6257', bg = '#f2e5bc' } },
  visual = { a = { fg = '#fbf1c7', bg = '#3c3836', gui = 'bold' }, b = { fg = '#654735', bg = '#ebdbb2' }, c = { fg = '#6e6257', bg = '#f2e5bc' } },
  replace = { a = { fg = '#fbf1c7', bg = '#b33a3a', gui = 'bold' }, b = { fg = '#654735', bg = '#ebdbb2' }, c = { fg = '#6e6257', bg = '#f2e5bc' } },
  command = { a = { fg = '#654735', bg = '#d5c4a1', gui = 'bold' }, b = { fg = '#654735', bg = '#ebdbb2' }, c = { fg = '#6e6257', bg = '#f2e5bc' } },
  inactive = { a = { fg = '#6e6257', bg = '#f2e5bc' }, b = { fg = '#6e6257', bg = '#f2e5bc' }, c = { fg = '#6e6257', bg = '#f2e5bc' } },
}
return vim.o.background == 'light' and themes.light or themes.dark
