🇺🇸 [English](README.md) · 🇧🇷 **Português**

# gravel

Um colorscheme para Vim e Neovim, com temas de lightline e lualine no mesmo padrão, feito a partir de dois trabalhos existentes: as **regras de destaque** do [artigo sobre syntax highlighting](https://tonsky.me/blog/syntax-highlighting/) de Nikita Prokopov (tonsky) e o tema dele, o [Alabaster](https://github.com/tonsky/sublime-scheme-alabaster), pintados com as **cores** do [gruvbox-material](https://github.com/sainnhe/gruvbox-material).

## As regras

- Só strings, constantes, comentários e definições de nível superior ganham cor.
- Palavras-chave, chamadas de função e variáveis ficam na cor do texto.
- Poucas cores, sem negrito nem itálico no código (markdown e HTML mantêm títulos, negrito e itálico), e o vermelho guardado para erros.
- Um único destaque, usado só pela interface (o resultado de busca atual, a barra de status no modo de inserção), nunca para colorir código.

O gravel lê o `background` ao carregar: `set background=dark` ou `light`, e depois `colorscheme gravel`.

## Arquivos

| Arquivo | O que é |
|---|---|
| `colors/gravel.vim` | o colorscheme (Vim e Neovim) |
| `after/queries/elixir/highlights.scm` | queries de treesitter para o Elixir seguir as mesmas regras no Neovim |
| `autoload/lightline/colorscheme/gravel.vim` | tema do lightline |
| `lua/lualine/themes/gravel.lua` | tema do lualine |

## Como usar

```vim
colorscheme gravel
let g:lightline = {'colorscheme': 'gravel'}
```

```lua
vim.cmd.colorscheme('gravel')
require('lualine').setup({ options = { theme = 'gravel' } })
```

## Como é feito

Todos os arquivos daqui, menos este README, são gerados a partir de uma paleta única, que também gera os temas de tmux, iTerm2 e Claude Code no mesmo padrão e fica nos dotfiles privados do autor. Edição feita direto num arquivo gerado é sobrescrita na próxima geração.

## Créditos

- **Regras:** [Nikita Prokopov (tonsky)](https://tonsky.me/), do [artigo](https://tonsky.me/blog/syntax-highlighting/) e do tema [Alabaster](https://github.com/tonsky/sublime-scheme-alabaster) (MIT, © 2018 Nikita Prokopov).
- **Cores:** [gruvbox-material](https://github.com/sainnhe/gruvbox-material) de sainnhe (MIT, © 2020 sainnhe), que por sua vez deriva do [gruvbox](https://github.com/morhetz/gruvbox) de Pavel Pertsev.

Nenhum código foi copiado dos dois projetos: o gravel usa as regras do Alabaster e os valores de cor do gruvbox-material, e gera os próprios arquivos.

## Licença

MIT, como o resto deste repositório.
