"general
let g:netrw_banner = 0
let mapleader = ","
set relativenumber
set cursorline
" no swp files
set shortmess=a

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

" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" reload vimrc
nnoremap <leader>rv :source $MYVIMRC<cr>

" nerdtree stuff
nnoremap ,nn :NERDTreeToggle<CR>
nnoremap ,l :NERDTreeFind<CR>

" move line down
nnoremap <C-j> ddpk<CR>
" move line up
nnoremap <C-k> ddkkpk<CR>

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

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" CtrlP plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

" close all tabs but current
nnoremap cat :tabonly<CR> 

" wrap into quotes
nnoremap w" ciw""<Esc>P

" comments plugin
source ~/.vcomments.vim
nnoremap gc :call Comment()<CR>
nnoremap gC :call Uncomment()<CR>

" Elixir related stuff
autocmd BufWritePost *.ex call FormatElixir()
autocmd BufWritePost *.exs call FormatElixir()

function FormatElixir()
  :silent ! mix format
  :silent e
endfunction
