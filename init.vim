"general
let g:netrw_banner = 0
set relativenumber

"plugins
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'elixir-editors/vim-elixir'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
call plug#end()

"nerdtree stuff
nnoremap ,nn :NERDTreeToggle<CR>
nnoremap ,l :NERDTreeFind<CR>

"color scheme
autocmd vimenter * colorscheme gruvbox

" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

