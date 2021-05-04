" Turn on syntax highligting
  syntax on

" Turn on termguicolors if terminal supports
if (has('terminguicolors'))
  set termguicolors
endif

" Set the colorscheme and theme
  let g:material_terminal_italics = 1
  let g:material_theme_style = 'ocean'
  colorscheme material
  let g:airline_theme = 'material'

