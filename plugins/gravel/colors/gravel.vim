" generated from ~/.dotfiles/config/theme; do not edit by hand
" gravel: Alabaster rules (only strings, constants, comments and top-level
" definitions are colored) with gruvbox-material hues. Follows &background.
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'gravel'

if &background ==# 'dark'
  hi Normal guifg=#d4be98 guibg=#1d2021 guisp=NONE gui=NONE ctermfg=180 ctermbg=234 cterm=NONE
  hi NormalFloat guifg=#d4be98 guibg=#282828 guisp=NONE gui=NONE ctermfg=180 ctermbg=235 cterm=NONE
  hi FloatBorder guifg=#928374 guibg=#282828 guisp=NONE gui=NONE ctermfg=244 ctermbg=235 cterm=NONE
  hi CursorLine guifg=NONE guibg=#282828 guisp=NONE gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
  hi CursorColumn guifg=NONE guibg=#282828 guisp=NONE gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
  hi ColorColumn guifg=NONE guibg=#282828 guisp=NONE gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
  hi Visual guifg=NONE guibg=#32302f guisp=NONE gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
  hi VisualNOS guifg=NONE guibg=#32302f guisp=NONE gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
  hi NonText guifg=#3c3836 guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
  hi EndOfBuffer guifg=#3c3836 guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
  hi Whitespace guifg=#3c3836 guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
  hi SpecialKey guifg=#3c3836 guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
  hi VertSplit guifg=#3c3836 guibg=#1d2021 guisp=NONE gui=NONE ctermfg=237 ctermbg=234 cterm=NONE
  hi WinSeparator guifg=#3c3836 guibg=#1d2021 guisp=NONE gui=NONE ctermfg=237 ctermbg=234 cterm=NONE
  hi LineNr guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi LineNrAbove guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi LineNrBelow guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi CursorLineNr guifg=#d4be98 guibg=#282828 guisp=NONE gui=NONE ctermfg=180 ctermbg=235 cterm=NONE
  hi SignColumn guifg=#928374 guibg=#1d2021 guisp=NONE gui=NONE ctermfg=244 ctermbg=234 cterm=NONE
  hi FoldColumn guifg=#928374 guibg=#1d2021 guisp=NONE gui=NONE ctermfg=244 ctermbg=234 cterm=NONE
  hi Folded guifg=#a89984 guibg=#282828 guisp=NONE gui=NONE ctermfg=138 ctermbg=235 cterm=NONE
  hi StatusLine guifg=#d4be98 guibg=#32302f guisp=NONE gui=NONE ctermfg=180 ctermbg=236 cterm=NONE
  hi StatusLineNC guifg=#a89984 guibg=#282828 guisp=NONE gui=NONE ctermfg=138 ctermbg=235 cterm=NONE
  hi StatusLineTerm guifg=#d4be98 guibg=#32302f guisp=NONE gui=NONE ctermfg=180 ctermbg=236 cterm=NONE
  hi StatusLineTermNC guifg=#a89984 guibg=#282828 guisp=NONE gui=NONE ctermfg=138 ctermbg=235 cterm=NONE
  hi TabLine guifg=#a89984 guibg=#282828 guisp=NONE gui=NONE ctermfg=138 ctermbg=235 cterm=NONE
  hi TabLineFill guifg=#a89984 guibg=#282828 guisp=NONE gui=NONE ctermfg=138 ctermbg=235 cterm=NONE
  hi TabLineSel guifg=#d4be98 guibg=#1d2021 guisp=NONE gui=NONE ctermfg=180 ctermbg=234 cterm=NONE
  hi Pmenu guifg=#d4be98 guibg=#282828 guisp=NONE gui=NONE ctermfg=180 ctermbg=235 cterm=NONE
  hi PmenuSel guifg=#1d2021 guibg=#d4be98 guisp=NONE gui=NONE ctermfg=234 ctermbg=180 cterm=NONE
  hi PmenuSbar guifg=NONE guibg=#282828 guisp=NONE gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
  hi PmenuThumb guifg=NONE guibg=#928374 guisp=NONE gui=NONE ctermfg=NONE ctermbg=244 cterm=NONE
  hi WildMenu guifg=#1d2021 guibg=#d4be98 guisp=NONE gui=NONE ctermfg=234 ctermbg=180 cterm=NONE
  hi Search guifg=#1d2021 guibg=#928374 guisp=NONE gui=NONE ctermfg=234 ctermbg=244 cterm=NONE
  hi IncSearch guifg=#1d2021 guibg=#2bb8fa guisp=NONE gui=NONE ctermfg=234 ctermbg=39 cterm=NONE
  hi CurSearch guifg=#1d2021 guibg=#2bb8fa guisp=NONE gui=NONE ctermfg=234 ctermbg=39 cterm=NONE
  hi QuickFixLine guifg=NONE guibg=#32302f guisp=NONE gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
  hi MatchParen guifg=#d4be98 guibg=#32302f guisp=NONE gui=underline ctermfg=180 ctermbg=236 cterm=underline
  hi Directory guifg=#7daea3 guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
  hi Underlined guifg=#7daea3 guibg=NONE guisp=NONE gui=underline ctermfg=109 ctermbg=NONE cterm=underline
  hi Conceal guifg=#a89984 guibg=NONE guisp=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
  hi ModeMsg guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi MoreMsg guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Question guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi WarningMsg guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
  hi DiagnosticWarn guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
  hi DiagnosticInfo guifg=#a89984 guibg=NONE guisp=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
  hi DiagnosticHint guifg=#a89984 guibg=NONE guisp=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
  hi DiagnosticOk guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
  hi DiagnosticUnderlineError guifg=NONE guibg=NONE guisp=#ea6962 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi DiagnosticUnderlineWarn guifg=NONE guibg=NONE guisp=#e78a4e gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi DiagnosticUnderlineInfo guifg=NONE guibg=NONE guisp=#a89984 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi DiagnosticUnderlineHint guifg=NONE guibg=NONE guisp=#a89984 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellBad guifg=NONE guibg=NONE guisp=#ea6962 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellCap guifg=NONE guibg=NONE guisp=#a89984 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellLocal guifg=NONE guibg=NONE guisp=#a89984 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellRare guifg=NONE guibg=NONE guisp=#a89984 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi DiffAdd guifg=NONE guibg=#3d4220 guisp=NONE gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
  hi DiffDelete guifg=NONE guibg=#472322 guisp=NONE gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
  hi DiffChange guifg=NONE guibg=#282828 guisp=NONE gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
  hi DiffText guifg=NONE guibg=#424a3e guisp=NONE gui=NONE ctermfg=NONE ctermbg=238 cterm=NONE
  hi GitGutterAdd guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
  hi GitGutterChange guifg=#7daea3 guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
  hi GitGutterDelete guifg=#ea6962 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
  hi GitGutterChangeDelete guifg=#ea6962 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
  hi Cursor guifg=#1d2021 guibg=#d4be98 guisp=NONE gui=NONE ctermfg=234 ctermbg=180 cterm=NONE
  hi lCursor guifg=#1d2021 guibg=#d4be98 guisp=NONE gui=NONE ctermfg=234 ctermbg=180 cterm=NONE
  hi TermCursor guifg=#1d2021 guibg=#d4be98 guisp=NONE gui=NONE ctermfg=234 ctermbg=180 cterm=NONE
  hi Identifier guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Statement guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Conditional guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Repeat guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Label guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Operator guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Keyword guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Exception guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi PreProc guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Include guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Define guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Macro guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi PreCondit guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Type guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi StorageClass guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Structure guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Typedef guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Special guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Tag guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Debug guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi Title guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi String guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
  hi Character guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
  hi SpecialChar guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
  hi Constant guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
  hi Number guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
  hi Float guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
  hi Boolean guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
  hi Comment guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
  hi SpecialComment guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
  hi Todo guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
  hi Function guifg=#7daea3 guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
  hi Delimiter guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi Noise guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi Error guifg=#ea6962 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
  hi ErrorMsg guifg=#ea6962 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
  hi DiagnosticError guifg=#ea6962 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
  hi jsFuncCall guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi jsDecoratorFunction guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi rubyHelper guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi pythonBuiltin guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi pythonDecoratorName guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi rustFuncCall guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi sqlFunction guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi mysqlFunction guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi cssFunctionName guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi luaFunction guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi vimFuncName guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
  hi htmlH1 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
  hi htmlH2 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
  hi htmlH3 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
  hi htmlH4 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
  hi htmlH5 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
  hi htmlH6 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
  hi markdownH1 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
  hi markdownH2 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
  hi markdownH3 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
  hi markdownH4 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
  hi markdownH5 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
  hi markdownH6 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
  hi mkdHeading guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi markdownHeadingDelimiter guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi mkdCode guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
  hi mkdCodeDelimiter guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi mkdCodeStart guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi mkdCodeEnd guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi markdownCode guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
  hi markdownCodeBlock guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
  hi markdownCodeDelimiter guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi mkdBlockquote guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
  hi markdownBlockquote guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
  hi mkdLink guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
  hi markdownLinkText guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
  hi mkdURL guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi mkdInlineURL guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
  hi mkdLinkDef guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
  hi markdownUrl guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi mkdListItem guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi markdownListMarker guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi markdownOrderedListMarker guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi mkdRule guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi markdownRule guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi mkdDelimiter guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi htmlBold guifg=#d4be98 guibg=NONE guisp=NONE gui=bold ctermfg=180 ctermbg=NONE cterm=bold
  hi mkdBold guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi markdownBold guifg=#d4be98 guibg=NONE guisp=NONE gui=bold ctermfg=180 ctermbg=NONE cterm=bold
  hi htmlItalic guifg=#d4be98 guibg=NONE guisp=NONE gui=italic ctermfg=180 ctermbg=NONE cterm=italic
  hi mkdItalic guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
  hi markdownItalic guifg=#d4be98 guibg=NONE guisp=NONE gui=italic ctermfg=180 ctermbg=NONE cterm=italic
  hi htmlBoldItalic guifg=#d4be98 guibg=NONE guisp=NONE gui=bold,italic ctermfg=180 ctermbg=NONE cterm=bold,italic
  hi markdownBoldItalic guifg=#d4be98 guibg=NONE guisp=NONE gui=bold,italic ctermfg=180 ctermbg=NONE cterm=bold,italic
  let g:terminal_ansi_colors = ['#3c3836', '#ea6962', '#a9b665', '#d8a657', '#7daea3', '#d3869b', '#89b482', '#d4be98', '#928374', '#ff8880', '#c2d07e', '#f3c071', '#96c7bc', '#ee9fb4', '#a2ce9a', '#eed8b1']
  if has('nvim')
    hi Added guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
    hi Changed guifg=#7daea3 guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
    hi Removed guifg=#ea6962 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
    hi OkMsg guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
    hi PreInsert guifg=#a89984 guibg=NONE guisp=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
    hi WinBar guifg=#d4be98 guibg=#1d2021 guisp=NONE gui=NONE ctermfg=180 ctermbg=234 cterm=NONE
    hi WinBarNC guifg=#a89984 guibg=#1d2021 guisp=NONE gui=NONE ctermfg=138 ctermbg=234 cterm=NONE
    hi FloatShadow guifg=NONE guibg=#3c3836 guisp=NONE gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
    hi FloatShadowThrough guifg=NONE guibg=#3c3836 guisp=NONE gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
    hi PmenuShadow guifg=NONE guibg=#3c3836 guisp=NONE gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
    hi PmenuShadowThrough guifg=NONE guibg=#3c3836 guisp=NONE gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
    hi DiagnosticUnderlineOk guifg=NONE guibg=NONE guisp=#a9b665 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
    hi DiagnosticDeprecated guifg=NONE guibg=NONE guisp=#a89984 gui=strikethrough ctermfg=NONE ctermbg=NONE cterm=strikethrough
    hi @lsp.mod.deprecated guifg=NONE guibg=NONE guisp=#a89984 gui=strikethrough ctermfg=NONE ctermbg=NONE cterm=strikethrough
    hi NvimInternalError guifg=#1d2021 guibg=#ea6962 guisp=NONE gui=NONE ctermfg=234 ctermbg=167 cterm=NONE
    hi NvimFigureBrace guifg=#ea6962 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
    hi NvimSingleQuotedUnknownEscape guifg=#ea6962 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
    hi NvimInvalidSingleQuotedUnknownEscape guifg=#ea6962 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
    hi @variable guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @variable.builtin guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @variable.parameter guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @variable.member guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @property guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @function.call guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @function.method.call guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @function.builtin guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @function.macro guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @constructor guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @keyword guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @keyword.function guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @keyword.return guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @keyword.conditional guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @keyword.repeat guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @keyword.import guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @keyword.operator guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @keyword.exception guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @keyword.modifier guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @keyword.type guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @keyword.coroutine guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @keyword.directive guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @operator guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @type guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @type.builtin guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @type.definition guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @module guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @module.builtin guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @label guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @attribute guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @attribute.builtin guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @tag guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @tag.attribute guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @tag.builtin guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @markup guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @lsp.type.function guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @lsp.type.method guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @lsp.type.variable guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @lsp.type.parameter guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @lsp.type.property guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @lsp.type.namespace guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @lsp.type.type guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @lsp.type.class guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @lsp.type.macro guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @lsp.type.keyword guifg=#d4be98 guibg=NONE guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
    hi @string guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
    hi @string.escape guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
    hi @string.regexp guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
    hi @string.special guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
    hi @character guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
    hi @character.special guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
    hi @diff.plus guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
    hi @constant guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
    hi @constant.builtin guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
    hi @constant.macro guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
    hi @number guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
    hi @number.float guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
    hi @boolean guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
    hi @string.special.symbol guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
    hi @gravel.constant guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
    hi @comment guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
    hi @comment.documentation guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
    hi @comment.todo guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
    hi @comment.note guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
    hi @comment.warning guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
    hi @function guifg=#7daea3 guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
    hi @function.method guifg=#7daea3 guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
    hi @lsp.typemod.function.declaration guifg=#7daea3 guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
    hi @lsp.typemod.method.declaration guifg=#7daea3 guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
    hi @diff.delta guifg=#7daea3 guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
    hi @punctuation guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
    hi @punctuation.delimiter guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
    hi @punctuation.bracket guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
    hi @punctuation.special guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
    hi @comment.error guifg=#ea6962 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
    hi @error guifg=#ea6962 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
    hi @diff.minus guifg=#ea6962 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
    hi @markup.heading guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
    hi @markup.heading.1 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
    hi @markup.heading.2 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
    hi @markup.heading.3 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
    hi @markup.heading.4 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
    hi @markup.heading.5 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
    hi @markup.heading.6 guifg=#7daea3 guibg=NONE guisp=NONE gui=bold ctermfg=109 ctermbg=NONE cterm=bold
    hi @markup.raw guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
    hi @markup.raw.block guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
    hi @markup.quote guifg=#e78a4e guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
    hi @markup.link guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
    hi @markup.link.label guifg=#a6d29f guibg=NONE guisp=NONE gui=NONE ctermfg=151 ctermbg=NONE cterm=NONE
    hi @markup.link.url guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
    hi @markup.list guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
    hi @markup.list.checked guifg=#a9b665 guibg=NONE guisp=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
    hi @markup.list.unchecked guifg=#928374 guibg=NONE guisp=NONE gui=NONE ctermfg=244 ctermbg=NONE cterm=NONE
    hi @markup.strong guifg=#d4be98 guibg=NONE guisp=NONE gui=bold ctermfg=180 ctermbg=NONE cterm=bold
    hi @markup.italic guifg=#d4be98 guibg=NONE guisp=NONE gui=italic ctermfg=180 ctermbg=NONE cterm=italic
    hi @markup.strikethrough guifg=#928374 guibg=NONE guisp=NONE gui=strikethrough ctermfg=244 ctermbg=NONE cterm=strikethrough
    let g:terminal_color_0 = '#3c3836'
    let g:terminal_color_1 = '#ea6962'
    let g:terminal_color_2 = '#a9b665'
    let g:terminal_color_3 = '#d8a657'
    let g:terminal_color_4 = '#7daea3'
    let g:terminal_color_5 = '#d3869b'
    let g:terminal_color_6 = '#89b482'
    let g:terminal_color_7 = '#d4be98'
    let g:terminal_color_8 = '#928374'
    let g:terminal_color_9 = '#ff8880'
    let g:terminal_color_10 = '#c2d07e'
    let g:terminal_color_11 = '#f3c071'
    let g:terminal_color_12 = '#96c7bc'
    let g:terminal_color_13 = '#ee9fb4'
    let g:terminal_color_14 = '#a2ce9a'
    let g:terminal_color_15 = '#eed8b1'
  endif
else
  hi Normal guifg=#654735 guibg=#fbf1c7 guisp=NONE gui=NONE ctermfg=239 ctermbg=230 cterm=NONE
  hi NormalFloat guifg=#654735 guibg=#fdf8e4 guisp=NONE gui=NONE ctermfg=239 ctermbg=230 cterm=NONE
  hi FloatBorder guifg=#978974 guibg=#fdf8e4 guisp=NONE gui=NONE ctermfg=102 ctermbg=230 cterm=NONE
  hi CursorLine guifg=NONE guibg=#f2e5bc guisp=NONE gui=NONE ctermfg=NONE ctermbg=223 cterm=NONE
  hi CursorColumn guifg=NONE guibg=#f2e5bc guisp=NONE gui=NONE ctermfg=NONE ctermbg=223 cterm=NONE
  hi ColorColumn guifg=NONE guibg=#f2e5bc guisp=NONE gui=NONE ctermfg=NONE ctermbg=223 cterm=NONE
  hi Visual guifg=NONE guibg=#ebdbb2 guisp=NONE gui=NONE ctermfg=NONE ctermbg=187 cterm=NONE
  hi VisualNOS guifg=NONE guibg=#ebdbb2 guisp=NONE gui=NONE ctermfg=NONE ctermbg=187 cterm=NONE
  hi NonText guifg=#d5c4a1 guibg=NONE guisp=NONE gui=NONE ctermfg=187 ctermbg=NONE cterm=NONE
  hi EndOfBuffer guifg=#d5c4a1 guibg=NONE guisp=NONE gui=NONE ctermfg=187 ctermbg=NONE cterm=NONE
  hi Whitespace guifg=#d5c4a1 guibg=NONE guisp=NONE gui=NONE ctermfg=187 ctermbg=NONE cterm=NONE
  hi SpecialKey guifg=#d5c4a1 guibg=NONE guisp=NONE gui=NONE ctermfg=187 ctermbg=NONE cterm=NONE
  hi VertSplit guifg=#d5c4a1 guibg=#fbf1c7 guisp=NONE gui=NONE ctermfg=187 ctermbg=230 cterm=NONE
  hi WinSeparator guifg=#d5c4a1 guibg=#fbf1c7 guisp=NONE gui=NONE ctermfg=187 ctermbg=230 cterm=NONE
  hi LineNr guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi LineNrAbove guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi LineNrBelow guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi CursorLineNr guifg=#654735 guibg=#f2e5bc guisp=NONE gui=NONE ctermfg=239 ctermbg=223 cterm=NONE
  hi SignColumn guifg=#978974 guibg=#fbf1c7 guisp=NONE gui=NONE ctermfg=102 ctermbg=230 cterm=NONE
  hi FoldColumn guifg=#978974 guibg=#fbf1c7 guisp=NONE gui=NONE ctermfg=102 ctermbg=230 cterm=NONE
  hi Folded guifg=#6e6257 guibg=#fdf8e4 guisp=NONE gui=NONE ctermfg=241 ctermbg=230 cterm=NONE
  hi StatusLine guifg=#654735 guibg=#ebdbb2 guisp=NONE gui=NONE ctermfg=239 ctermbg=187 cterm=NONE
  hi StatusLineNC guifg=#6e6257 guibg=#fdf8e4 guisp=NONE gui=NONE ctermfg=241 ctermbg=230 cterm=NONE
  hi StatusLineTerm guifg=#654735 guibg=#ebdbb2 guisp=NONE gui=NONE ctermfg=239 ctermbg=187 cterm=NONE
  hi StatusLineTermNC guifg=#6e6257 guibg=#fdf8e4 guisp=NONE gui=NONE ctermfg=241 ctermbg=230 cterm=NONE
  hi TabLine guifg=#6e6257 guibg=#fdf8e4 guisp=NONE gui=NONE ctermfg=241 ctermbg=230 cterm=NONE
  hi TabLineFill guifg=#6e6257 guibg=#fdf8e4 guisp=NONE gui=NONE ctermfg=241 ctermbg=230 cterm=NONE
  hi TabLineSel guifg=#654735 guibg=#fbf1c7 guisp=NONE gui=NONE ctermfg=239 ctermbg=230 cterm=NONE
  hi Pmenu guifg=#654735 guibg=#fdf8e4 guisp=NONE gui=NONE ctermfg=239 ctermbg=230 cterm=NONE
  hi PmenuSel guifg=#fbf1c7 guibg=#3c3836 guisp=NONE gui=NONE ctermfg=230 ctermbg=237 cterm=NONE
  hi PmenuSbar guifg=NONE guibg=#fdf8e4 guisp=NONE gui=NONE ctermfg=NONE ctermbg=230 cterm=NONE
  hi PmenuThumb guifg=NONE guibg=#978974 guisp=NONE gui=NONE ctermfg=NONE ctermbg=102 cterm=NONE
  hi WildMenu guifg=#fbf1c7 guibg=#3c3836 guisp=NONE gui=NONE ctermfg=230 ctermbg=237 cterm=NONE
  hi Search guifg=#fbf1c7 guibg=#978974 guisp=NONE gui=NONE ctermfg=230 ctermbg=102 cterm=NONE
  hi IncSearch guifg=#1d2021 guibg=#2bb8fa guisp=NONE gui=NONE ctermfg=234 ctermbg=39 cterm=NONE
  hi CurSearch guifg=#1d2021 guibg=#2bb8fa guisp=NONE gui=NONE ctermfg=234 ctermbg=39 cterm=NONE
  hi QuickFixLine guifg=NONE guibg=#ebdbb2 guisp=NONE gui=NONE ctermfg=NONE ctermbg=187 cterm=NONE
  hi MatchParen guifg=#654735 guibg=#ebdbb2 guisp=NONE gui=underline ctermfg=239 ctermbg=187 cterm=underline
  hi Directory guifg=#36616b guibg=NONE guisp=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE
  hi Underlined guifg=#36616b guibg=NONE guisp=NONE gui=underline ctermfg=240 ctermbg=NONE cterm=underline
  hi Conceal guifg=#6e6257 guibg=NONE guisp=NONE gui=NONE ctermfg=241 ctermbg=NONE cterm=NONE
  hi ModeMsg guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi MoreMsg guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Question guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi WarningMsg guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  hi DiagnosticWarn guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  hi DiagnosticInfo guifg=#6e6257 guibg=NONE guisp=NONE gui=NONE ctermfg=241 ctermbg=NONE cterm=NONE
  hi DiagnosticHint guifg=#6e6257 guibg=NONE guisp=NONE gui=NONE ctermfg=241 ctermbg=NONE cterm=NONE
  hi DiagnosticOk guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
  hi DiagnosticUnderlineError guifg=NONE guibg=NONE guisp=#b33a3a gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi DiagnosticUnderlineWarn guifg=NONE guibg=NONE guisp=#a54e02 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi DiagnosticUnderlineInfo guifg=NONE guibg=NONE guisp=#6e6257 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi DiagnosticUnderlineHint guifg=NONE guibg=NONE guisp=#6e6257 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellBad guifg=NONE guibg=NONE guisp=#b33a3a gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellCap guifg=NONE guibg=NONE guisp=#6e6257 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellLocal guifg=NONE guibg=NONE guisp=#6e6257 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellRare guifg=NONE guibg=NONE guisp=#6e6257 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi DiffAdd guifg=NONE guibg=#e3e8c0 guisp=NONE gui=NONE ctermfg=NONE ctermbg=187 cterm=NONE
  hi DiffDelete guifg=NONE guibg=#f4d6cc guisp=NONE gui=NONE ctermfg=NONE ctermbg=224 cterm=NONE
  hi DiffChange guifg=NONE guibg=#fdf8e4 guisp=NONE gui=NONE ctermfg=NONE ctermbg=230 cterm=NONE
  hi DiffText guifg=NONE guibg=#d3db9f guisp=NONE gui=NONE ctermfg=NONE ctermbg=187 cterm=NONE
  hi GitGutterAdd guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
  hi GitGutterChange guifg=#36616b guibg=NONE guisp=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE
  hi GitGutterDelete guifg=#b33a3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
  hi GitGutterChangeDelete guifg=#b33a3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
  hi Cursor guifg=#fbf1c7 guibg=#654735 guisp=NONE gui=NONE ctermfg=230 ctermbg=239 cterm=NONE
  hi lCursor guifg=#fbf1c7 guibg=#654735 guisp=NONE gui=NONE ctermfg=230 ctermbg=239 cterm=NONE
  hi TermCursor guifg=#fbf1c7 guibg=#654735 guisp=NONE gui=NONE ctermfg=230 ctermbg=239 cterm=NONE
  hi Identifier guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Statement guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Conditional guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Repeat guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Label guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Operator guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Keyword guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Exception guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi PreProc guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Include guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Define guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Macro guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi PreCondit guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Type guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi StorageClass guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Structure guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Typedef guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Special guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Tag guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Debug guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi Title guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi String guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
  hi Character guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
  hi SpecialChar guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
  hi Constant guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
  hi Number guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
  hi Float guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
  hi Boolean guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
  hi Comment guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  hi SpecialComment guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  hi Todo guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  hi Function guifg=#36616b guibg=NONE guisp=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE
  hi Delimiter guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi Noise guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi Error guifg=#b33a3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
  hi ErrorMsg guifg=#b33a3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
  hi DiagnosticError guifg=#b33a3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
  hi jsFuncCall guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi jsDecoratorFunction guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi rubyHelper guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi pythonBuiltin guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi pythonDecoratorName guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi rustFuncCall guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi sqlFunction guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi mysqlFunction guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi cssFunctionName guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi luaFunction guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi vimFuncName guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
  hi htmlH1 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
  hi htmlH2 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
  hi htmlH3 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
  hi htmlH4 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
  hi htmlH5 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
  hi htmlH6 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
  hi markdownH1 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
  hi markdownH2 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
  hi markdownH3 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
  hi markdownH4 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
  hi markdownH5 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
  hi markdownH6 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
  hi mkdHeading guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi markdownHeadingDelimiter guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi mkdCode guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
  hi mkdCodeDelimiter guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi mkdCodeStart guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi mkdCodeEnd guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi markdownCode guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
  hi markdownCodeBlock guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
  hi markdownCodeDelimiter guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi mkdBlockquote guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  hi markdownBlockquote guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
  hi mkdLink guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
  hi markdownLinkText guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
  hi mkdURL guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi mkdInlineURL guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
  hi mkdLinkDef guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
  hi markdownUrl guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi mkdListItem guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi markdownListMarker guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi markdownOrderedListMarker guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi mkdRule guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi markdownRule guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi mkdDelimiter guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi htmlBold guifg=#654735 guibg=NONE guisp=NONE gui=bold ctermfg=239 ctermbg=NONE cterm=bold
  hi mkdBold guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi markdownBold guifg=#654735 guibg=NONE guisp=NONE gui=bold ctermfg=239 ctermbg=NONE cterm=bold
  hi htmlItalic guifg=#654735 guibg=NONE guisp=NONE gui=italic ctermfg=239 ctermbg=NONE cterm=italic
  hi mkdItalic guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
  hi markdownItalic guifg=#654735 guibg=NONE guisp=NONE gui=italic ctermfg=239 ctermbg=NONE cterm=italic
  hi htmlBoldItalic guifg=#654735 guibg=NONE guisp=NONE gui=bold,italic ctermfg=239 ctermbg=NONE cterm=bold,italic
  hi markdownBoldItalic guifg=#654735 guibg=NONE guisp=NONE gui=bold,italic ctermfg=239 ctermbg=NONE cterm=bold,italic
  let g:terminal_ansi_colors = ['#3c3836', '#b33a3a', '#556011', '#8f5a00', '#36616b', '#83526f', '#28553a', '#a89984', '#7c6f64', '#981e24', '#404900', '#714601', '#1f4b54', '#6b3c58', '#103f26', '#8f816c']
  if has('nvim')
    hi Added guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
    hi Changed guifg=#36616b guibg=NONE guisp=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE
    hi Removed guifg=#b33a3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
    hi OkMsg guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
    hi PreInsert guifg=#6e6257 guibg=NONE guisp=NONE gui=NONE ctermfg=241 ctermbg=NONE cterm=NONE
    hi WinBar guifg=#654735 guibg=#fbf1c7 guisp=NONE gui=NONE ctermfg=239 ctermbg=230 cterm=NONE
    hi WinBarNC guifg=#6e6257 guibg=#fbf1c7 guisp=NONE gui=NONE ctermfg=241 ctermbg=230 cterm=NONE
    hi FloatShadow guifg=NONE guibg=#d5c4a1 guisp=NONE gui=NONE ctermfg=NONE ctermbg=187 cterm=NONE
    hi FloatShadowThrough guifg=NONE guibg=#d5c4a1 guisp=NONE gui=NONE ctermfg=NONE ctermbg=187 cterm=NONE
    hi PmenuShadow guifg=NONE guibg=#d5c4a1 guisp=NONE gui=NONE ctermfg=NONE ctermbg=187 cterm=NONE
    hi PmenuShadowThrough guifg=NONE guibg=#d5c4a1 guisp=NONE gui=NONE ctermfg=NONE ctermbg=187 cterm=NONE
    hi DiagnosticUnderlineOk guifg=NONE guibg=NONE guisp=#556011 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
    hi DiagnosticDeprecated guifg=NONE guibg=NONE guisp=#6e6257 gui=strikethrough ctermfg=NONE ctermbg=NONE cterm=strikethrough
    hi @lsp.mod.deprecated guifg=NONE guibg=NONE guisp=#6e6257 gui=strikethrough ctermfg=NONE ctermbg=NONE cterm=strikethrough
    hi NvimInternalError guifg=#fbf1c7 guibg=#b33a3a guisp=NONE gui=NONE ctermfg=230 ctermbg=131 cterm=NONE
    hi NvimFigureBrace guifg=#b33a3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
    hi NvimSingleQuotedUnknownEscape guifg=#b33a3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
    hi NvimInvalidSingleQuotedUnknownEscape guifg=#b33a3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
    hi @variable guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @variable.builtin guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @variable.parameter guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @variable.member guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @property guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @function.call guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @function.method.call guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @function.builtin guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @function.macro guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @constructor guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @keyword guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @keyword.function guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @keyword.return guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @keyword.conditional guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @keyword.repeat guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @keyword.import guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @keyword.operator guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @keyword.exception guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @keyword.modifier guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @keyword.type guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @keyword.coroutine guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @keyword.directive guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @operator guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @type guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @type.builtin guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @type.definition guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @module guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @module.builtin guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @label guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @attribute guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @attribute.builtin guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @tag guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @tag.attribute guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @tag.builtin guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @markup guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @lsp.type.function guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @lsp.type.method guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @lsp.type.variable guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @lsp.type.parameter guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @lsp.type.property guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @lsp.type.namespace guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @lsp.type.type guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @lsp.type.class guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @lsp.type.macro guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @lsp.type.keyword guifg=#654735 guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
    hi @string guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
    hi @string.escape guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
    hi @string.regexp guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
    hi @string.special guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
    hi @character guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
    hi @character.special guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
    hi @diff.plus guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
    hi @constant guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
    hi @constant.builtin guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
    hi @constant.macro guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
    hi @number guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
    hi @number.float guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
    hi @boolean guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
    hi @string.special.symbol guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
    hi @gravel.constant guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
    hi @comment guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
    hi @comment.documentation guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
    hi @comment.todo guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
    hi @comment.note guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
    hi @comment.warning guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
    hi @function guifg=#36616b guibg=NONE guisp=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE
    hi @function.method guifg=#36616b guibg=NONE guisp=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE
    hi @lsp.typemod.function.declaration guifg=#36616b guibg=NONE guisp=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE
    hi @lsp.typemod.method.declaration guifg=#36616b guibg=NONE guisp=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE
    hi @diff.delta guifg=#36616b guibg=NONE guisp=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE
    hi @punctuation guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
    hi @punctuation.delimiter guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
    hi @punctuation.bracket guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
    hi @punctuation.special guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
    hi @comment.error guifg=#b33a3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
    hi @error guifg=#b33a3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
    hi @diff.minus guifg=#b33a3a guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
    hi @markup.heading guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
    hi @markup.heading.1 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
    hi @markup.heading.2 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
    hi @markup.heading.3 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
    hi @markup.heading.4 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
    hi @markup.heading.5 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
    hi @markup.heading.6 guifg=#36616b guibg=NONE guisp=NONE gui=bold ctermfg=240 ctermbg=NONE cterm=bold
    hi @markup.raw guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
    hi @markup.raw.block guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
    hi @markup.quote guifg=#a54e02 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
    hi @markup.link guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
    hi @markup.link.label guifg=#28553a guibg=NONE guisp=NONE gui=NONE ctermfg=237 ctermbg=NONE cterm=NONE
    hi @markup.link.url guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
    hi @markup.list guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
    hi @markup.list.checked guifg=#556011 guibg=NONE guisp=NONE gui=NONE ctermfg=58 ctermbg=NONE cterm=NONE
    hi @markup.list.unchecked guifg=#978974 guibg=NONE guisp=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
    hi @markup.strong guifg=#654735 guibg=NONE guisp=NONE gui=bold ctermfg=239 ctermbg=NONE cterm=bold
    hi @markup.italic guifg=#654735 guibg=NONE guisp=NONE gui=italic ctermfg=239 ctermbg=NONE cterm=italic
    hi @markup.strikethrough guifg=#978974 guibg=NONE guisp=NONE gui=strikethrough ctermfg=102 ctermbg=NONE cterm=strikethrough
    let g:terminal_color_0 = '#3c3836'
    let g:terminal_color_1 = '#b33a3a'
    let g:terminal_color_2 = '#556011'
    let g:terminal_color_3 = '#8f5a00'
    let g:terminal_color_4 = '#36616b'
    let g:terminal_color_5 = '#83526f'
    let g:terminal_color_6 = '#28553a'
    let g:terminal_color_7 = '#a89984'
    let g:terminal_color_8 = '#7c6f64'
    let g:terminal_color_9 = '#981e24'
    let g:terminal_color_10 = '#404900'
    let g:terminal_color_11 = '#714601'
    let g:terminal_color_12 = '#1f4b54'
    let g:terminal_color_13 = '#6b3c58'
    let g:terminal_color_14 = '#103f26'
    let g:terminal_color_15 = '#8f816c'
  endif
endif

hi! link CocErrorSign DiagnosticError
hi! link CocWarningSign DiagnosticWarn
hi! link CocInfoSign DiagnosticInfo
hi! link CocHintSign DiagnosticHint
hi! link CocErrorHighlight DiagnosticUnderlineError
hi! link CocWarningHighlight DiagnosticUnderlineWarn
hi! link CocInfoHighlight DiagnosticUnderlineInfo
hi! link CocHintHighlight DiagnosticUnderlineHint
hi! link CocFloating NormalFloat
hi! link CocMenuSel PmenuSel
hi! link DiagnosticSignError DiagnosticError
hi! link DiagnosticSignWarn DiagnosticWarn
hi! link DiagnosticSignInfo DiagnosticInfo
hi! link DiagnosticSignHint DiagnosticHint
hi! link DiagnosticVirtualTextError DiagnosticError
hi! link DiagnosticVirtualTextWarn DiagnosticWarn
hi! link DiagnosticVirtualTextInfo DiagnosticInfo
hi! link DiagnosticVirtualTextHint DiagnosticHint
