🇺🇸 **English** · 🇧🇷 [Português](README.pt.md)

# gravel

A colorscheme for Vim and Neovim, with matching lightline and lualine themes, built on two existing works: the **highlighting rules** of Nikita Prokopov's (tonsky) [article on syntax highlighting](https://tonsky.me/blog/syntax-highlighting/) and his [Alabaster](https://github.com/tonsky/sublime-scheme-alabaster) theme, painted with the **hues** of [gruvbox-material](https://github.com/sainnhe/gruvbox-material).

## The rules

- Only strings, constants, comments and top-level definitions get a color.
- Keywords, function calls and variables stay in the base text color.
- Few colors, no bold or italic in code (markdown and HTML keep their headings, bold and italic), and red kept for errors.
- One accent, used only by the interface (the current search match, the status line in insert mode), never to color code.

gravel reads `background` when it loads: `set background=dark` or `light`, then `colorscheme gravel`.

## Files

| File | What it is |
|---|---|
| `colors/gravel.vim` | the colorscheme (Vim and Neovim) |
| `after/queries/elixir/highlights.scm` | treesitter queries so Elixir follows the same rules in Neovim |
| `autoload/lightline/colorscheme/gravel.vim` | lightline theme |
| `lua/lualine/themes/gravel.lua` | lualine theme |

## Using it

```vim
colorscheme gravel
let g:lightline = {'colorscheme': 'gravel'}
```

```lua
vim.cmd.colorscheme('gravel')
require('lualine').setup({ options = { theme = 'gravel' } })
```

## How it is made

Every file here except this README is generated from a single palette that also produces matching tmux, iTerm2 and Claude Code themes, kept in the author's private dotfiles. Edits made directly to the generated files are overwritten on the next generation.

## Credits

- **Rules:** [Nikita Prokopov (tonsky)](https://tonsky.me/), from his [article](https://tonsky.me/blog/syntax-highlighting/) and the [Alabaster](https://github.com/tonsky/sublime-scheme-alabaster) theme (MIT, © 2018 Nikita Prokopov).
- **Hues:** [gruvbox-material](https://github.com/sainnhe/gruvbox-material) by sainnhe (MIT, © 2020 sainnhe), itself derived from [gruvbox](https://github.com/morhetz/gruvbox) by Pavel Pertsev.

No code was copied from either project: gravel takes Alabaster's rules and gruvbox-material's colour values, and generates its own files.

## License

MIT, like the rest of this repository.
