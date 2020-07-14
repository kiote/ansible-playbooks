"general
let g:netrw_banner = 0
let mapleader = ","
set relativenumber
" no swp files
set shortmess=a

"plugins
call plug#begin()
Plug 'airblade/vim-gitgutter'
"Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-editors/vim-elixir'
"Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }
Plug 'mileszs/ack.vim'
" Color schemes
Plug 'morhetz/gruvbox'
Plug 'stillwwater/vim-nebula'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
call plug#end()

set foldmethod=syntax   
set foldnestmax=10
set nofoldenable

" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" reload vimrc
nnoremap <leader>rv :source $MYVIMRC<cr>

" no arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" switch between splits
nnoremap <C-l> <C-w><Right>
nnoremap <C-h> <C-w><Left>

" nerdtree stuff
nnoremap ,nn :NERDTreeToggle<CR>
nnoremap ,l :NERDTreeFind<CR>

" move line down
nnoremap <C-j> ddpk<CR>
" move line up
nnoremap <C-k> ddkkpk<CR>

"color scheme
set background=light
autocmd vimenter * colorscheme nebula

set cursorline
highlight LineNR cterm=none ctermfg=Yellow ctermbg=none

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

nnoremap ctf :call InitExUnit()<CR>
nnoremap ttf :call TestThisFile()<CR>
nnoremap tto :call TestTagOnly()<CR>

function TestThisFile()
  execute '!mix test ' . @%
endfunction

function TestTagOnly()
  execute '!mix test --only only'
endfunction

function FormatElixir()
  silent execute '!mix format ' . @%
  :silent e
endfunction

function InitExUnit()
  let file_name = @%
  let test_folder = substitute(file_name, 'lib\/', 'test\/', "")
  let full_path_list = split(test_folder, "/")
  let fname = full_path_list[-1]
  let fname_and_ext_list = split(fname, '\.')
  let test_fname = fname_and_ext_list[0] . '_test.exs'
  let final_test_dir = join(full_path_list[0:-2], '/')
  let final_name = final_test_dir . '/' . test_fname
  silent execute '!mkdir -p ' . final_test_dir
  silent execute '!touch ' . final_name
  silent execute 'vsplit ' . final_name
endfunction
