" generated from ~/.dotfiles/config/theme; do not edit by hand
" gravel for lightline: picks the palette from &background when loaded.
let s:dark = {}
let s:dark.normal = {'left': [['#d4be98', '#3c3836', 180, 237, 'bold'], ['#d4be98', '#32302f', 180, 236]], 'middle': [['#a89984', '#282828', 138, 235]], 'right': [['#d4be98', '#32302f', 180, 236], ['#a89984', '#282828', 138, 235]]}
let s:dark.insert = {'left': [['#1d2021', '#2bb8fa', 234, 39, 'bold'], ['#d4be98', '#32302f', 180, 236]], 'middle': [['#a89984', '#282828', 138, 235]], 'right': [['#d4be98', '#32302f', 180, 236], ['#a89984', '#282828', 138, 235]]}
let s:dark.visual = {'left': [['#1d2021', '#d4be98', 234, 180, 'bold'], ['#d4be98', '#32302f', 180, 236]], 'middle': [['#a89984', '#282828', 138, 235]], 'right': [['#d4be98', '#32302f', 180, 236], ['#a89984', '#282828', 138, 235]]}
let s:dark.replace = {'left': [['#1d2021', '#ea6962', 234, 167, 'bold'], ['#d4be98', '#32302f', 180, 236]], 'middle': [['#a89984', '#282828', 138, 235]], 'right': [['#d4be98', '#32302f', 180, 236], ['#a89984', '#282828', 138, 235]]}
let s:dark.inactive = {'left': [['#a89984', '#282828', 138, 235], ['#a89984', '#282828', 138, 235]], 'middle': [['#a89984', '#282828', 138, 235]], 'right': [['#a89984', '#282828', 138, 235], ['#a89984', '#282828', 138, 235]]}
let s:dark.tabline = {'left': [['#a89984', '#282828', 138, 235]], 'tabsel': [['#d4be98', '#3c3836', 180, 237, 'bold']], 'middle': [['#a89984', '#282828', 138, 235]], 'right': [['#a89984', '#282828', 138, 235]]}
let s:dark.normal.error = [['#1d2021', '#ea6962', 234, 167]]
let s:dark.normal.warning = [['#1d2021', '#e78a4e', 234, 173]]
let s:light = {}
let s:light.normal = {'left': [['#654735', '#d5c4a1', 239, 187, 'bold'], ['#654735', '#ebdbb2', 239, 187]], 'middle': [['#6e6257', '#f2e5bc', 241, 223]], 'right': [['#654735', '#ebdbb2', 239, 187], ['#6e6257', '#f2e5bc', 241, 223]]}
let s:light.insert = {'left': [['#1d2021', '#2bb8fa', 234, 39, 'bold'], ['#654735', '#ebdbb2', 239, 187]], 'middle': [['#6e6257', '#f2e5bc', 241, 223]], 'right': [['#654735', '#ebdbb2', 239, 187], ['#6e6257', '#f2e5bc', 241, 223]]}
let s:light.visual = {'left': [['#fbf1c7', '#3c3836', 230, 237, 'bold'], ['#654735', '#ebdbb2', 239, 187]], 'middle': [['#6e6257', '#f2e5bc', 241, 223]], 'right': [['#654735', '#ebdbb2', 239, 187], ['#6e6257', '#f2e5bc', 241, 223]]}
let s:light.replace = {'left': [['#fbf1c7', '#b33a3a', 230, 131, 'bold'], ['#654735', '#ebdbb2', 239, 187]], 'middle': [['#6e6257', '#f2e5bc', 241, 223]], 'right': [['#654735', '#ebdbb2', 239, 187], ['#6e6257', '#f2e5bc', 241, 223]]}
let s:light.inactive = {'left': [['#6e6257', '#f2e5bc', 241, 223], ['#6e6257', '#f2e5bc', 241, 223]], 'middle': [['#6e6257', '#f2e5bc', 241, 223]], 'right': [['#6e6257', '#f2e5bc', 241, 223], ['#6e6257', '#f2e5bc', 241, 223]]}
let s:light.tabline = {'left': [['#6e6257', '#f2e5bc', 241, 223]], 'tabsel': [['#654735', '#d5c4a1', 239, 187, 'bold']], 'middle': [['#6e6257', '#f2e5bc', 241, 223]], 'right': [['#6e6257', '#f2e5bc', 241, 223]]}
let s:light.normal.error = [['#fbf1c7', '#b33a3a', 230, 131]]
let s:light.normal.warning = [['#fbf1c7', '#a54e02', 230, 130]]
let g:lightline#colorscheme#gravel#palette = &background ==# 'light' ? s:light : s:dark
