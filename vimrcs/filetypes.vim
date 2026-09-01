" All autocmds in this file run in one group, cleared on re-source
" (repo convention: no autocmd outside an augroup).
augroup filetype_settings
  autocmd!
augroup END

""""""""""""""""""""""""""""""
" => Ruby / Rails section
""""""""""""""""""""""""""""""
au filetype_settings BufNewFile,BufRead *.rb,*.rake,Gemfile,Rakefile,Guardfile,Capfile set filetype=ruby
au filetype_settings BufNewFile,BufRead *.erb set filetype=eruby

au filetype_settings FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au filetype_settings FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab


""""""""""""""""""""""""""""""
" => Elixir / Phoenix section
""""""""""""""""""""""""""""""
au filetype_settings BufNewFile,BufRead *.heex set filetype=heex
au filetype_settings BufNewFile,BufRead *.leex set filetype=eelixir
au filetype_settings BufNewFile,BufRead *.ex,*.exs set filetype=elixir

au filetype_settings FileType elixir,heex,eelixir setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au filetype_settings FileType python syn keyword pythonDecorator True None False self

au filetype_settings BufNewFile,BufRead *.jinja set syntax=htmljinja

au filetype_settings FileType python set cindent
au filetype_settings FileType python set cinkeys-=0#
au filetype_settings FileType python set indentkeys-=0#


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au filetype_settings FileType javascript call JavaScriptFold()
au filetype_settings FileType javascript setl fen
au filetype_settings FileType javascript setl nocindent

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX')
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color
    endif
endif


""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
autocmd filetype_settings BufRead *.twig set syntax=html filetype=html

au filetype_settings FileType gitcommit call setpos('.', [0, 1, 1, 0])
