" Turn on syntax highligting
  syntax on

" Turn on termguicolors if terminal supports
if (has('termguicolors'))
  set termguicolors
endif

" Set the colorscheme and theme
  let g:material_terminal_italics = 1
  let g:material_theme_style = 'palenight-community'
  colorscheme material
  let g:airline_theme = 'material'

" Turn on transparent background capability
  hi Normal guibg=NONE ctermbg=NONE
