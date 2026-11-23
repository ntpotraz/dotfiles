set nu
set relativenumber
set ignorecase
set smartcase
set scrolloff=8

" Commenting (matches Neovim / Zed)
xnoremap gc :vsc Edit.ToggleLineComment<CR>
nnoremap gcc :vsc Edit.ToggleLineComment<CR>

" Fuzzy finding / search
nnoremap 'f :vsc ReSharper.ReSharper_GotoRecentFiles<CR>
nnoremap 'r :vsc ReSharper.ReSharper_GotoText<CR>

" Code actions (matches Zed)
nnoremap <Space> <Nop>
nnoremap gr :vsc Edit.FindAllReferences<CR>
nnoremap <Space>rn :vsc Refactor.Rename<CR>
nnoremap <Space>f :vsc Edit.QuickInfo<CR>

" Window splits (replaces 's' substitute, same as Zed)
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>

" Pane navigation (matches Zed)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Tool windows from editor (matches Zed)
nnoremap <C-n> :vsc View.SolutionExplorer<CR>
nnoremap <C-g> :vsc View.GitChanges<CR>
nnoremap <C-t> :vsc View.Terminal<CR>

" Navigation & misc
nnoremap Y y$
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

" Switch to absolute numbers when entering Insert mode
nnoremap i :set norelativenumber<CR>i
nnoremap I :set norelativenumber<CR>I
nnoremap a :set norelativenumber<CR>a
nnoremap A :set norelativenumber<CR>A
nnoremap o :set norelativenumber<CR>o
nnoremap O :set norelativenumber<CR>O
nnoremap c :set norelativenumber<CR>c
nnoremap C :set norelativenumber<CR>C
nnoremap S :set norelativenumber<CR>S

" Switch back to hybrid relative numbers when leaving Insert mode
inoremap <Esc> <Esc>:set relativenumber<CR>
inoremap <C-c> <Esc>:set relativenumber<CR>
inoremap jk <Esc>:set relativenumber<CR>
