"general
let g:netrw_banner = 0
set relativenumber

"plugins
call plug#begin()
Plug 'airblade/vim-gitgutter'
"Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-editors/vim-elixir'
"Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
