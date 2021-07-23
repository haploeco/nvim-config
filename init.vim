let &packpath = &runtimepath
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/themes/material.vim


" Enable indentation matching for =>'s
  filetype plugin indent on

" Some basics:
  filetype plugin on

" Disables automatic commenting on newline:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
  map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
  map <leader>o :setlocal spell! spelllang=en_us<CR>

" Nerd tree
  map <leader>n :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Check file in shellcheck:
  map <leader>s :!clear && shellcheck %<CR>

" Replace all is aliased to S.
"  nnoremap S :%s//g<Left><Left>

" Vimwiki and Taskwiki
  let g:vimwiki_list = [{'path':'~/projects/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
  let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown', '.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" Add a (.md) to autocreated links
  let g:vimwiki_markdown_link_ext = 1

  let g:taskwiki_markup_syntax = 'markdown'
  let g:taskwiki_disable_concealcursor = 1
  let g:markdown_folding = 1

  autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
  autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
  autocmd BufRead,BufNewFile *.tex set filetype=tex

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
  " vnoremap <C-c> "+y
  " map <C-p> "+P

" Enable Goyo by default for mutt writting
" Goyo's width will be the line limit in mutt.
  autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
  autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=light

" Automatically deletes all trailing whitespace on save.
  autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and vifm configs with new material:
  autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
  autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
  autocmd BufWritePost *Xresources,Xresources*,*Xdefaults,*xresources !xrdb -merge %
