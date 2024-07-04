inoremap ii <Esc>
tnoremap ii <C-\><C-n>
set number
set cursorline

highlight cursorlinenr cterm=bold ctermfg=red
highlight cursorline cterm=none
highlight LineNr ctermfg=grey
highlight Normal ctermbg=none guibg=none
highlight NonText ctermbg=none guibg=none

call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'm4xshen/autoclose.nvim'
call plug#end()

inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
