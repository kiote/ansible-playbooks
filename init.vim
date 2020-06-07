"general
let g:netrw_banner = 0
set relativenumber

"plugins
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'elixir-editors/vim-elixir'
Plug 'morhetz/gruvbox'
Plug 'mileszs/ack.vim'
call plug#end()

"nerdtree stuff
nnoremap ,nn :NERDTreeToggle<CR>
nnoremap ,l :NERDTreeFind<CR>

"color scheme
autocmd vimenter * colorscheme gruvbox

