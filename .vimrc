set nu
set relativenumber
set ignorecase
set smartcase

inoremap jk <ESC>
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap 'f :vsc ReSharper.ReSharper_GotoRecentFiles<CR>
nnoremap 'r :vsc ReSharper.ReSharper_GotoText<Cr>

" Switch to absolute numbers when entering Insert mode
nnoremap i :set norelativenumber<CR>i
nnoremap I :set norelativenumber<CR>I
nnoremap a :set norelativenumber<CR>a
nnoremap A :set norelativenumber<CR>A
nnoremap o :set norelativenumber<CR>o
nnoremap O :set norelativenumber<CR>O
nnoremap c :set norelativenumber<CR>c
nnoremap C :set norelativenumber<CR>C
nnoremap s :set norelativenumber<CR>s
nnoremap S :set norelativenumber<CR>S

" Switch back to hybrid relative numbers when leaving Insert mode
inoremap <Esc> <Esc>:set relativenumber<CR>
inoremap <C-c> <Esc>:set relativenumber<CR>
inoremap jk <Esc>:set relativenumber<CR>
