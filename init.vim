"
" Plugins
"

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'Shougo/context_filetype.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'

Plug 'flazz/vim-colorschemes'
Plug 'jwalton512/vim-blade'
Plug 'posva/vim-vue'
Plug 'niftylettuce/vim-jinja'

Plug 'jremmen/vim-ripgrep'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-tag'

Plug 'phpactor/phpactor' , { 'do': 'composer install', 'for': 'php' }
" Plug 'kristijanhusak/deoplete-phpactor'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'cohama/lexima.vim'
Plug 'majutsushi/tagbar'

Plug 'pechorin/any-jump.vim'
Plug 'RRethy/vim-illuminate'

Plug 'unblevable/quick-scope'

Plug 'w0rp/ale'

Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'elzr/vim-json'

call plug#end()

" colors gruvbox
" set background=dark
" colorscheme hemisu

colorscheme gruvbox
set background=dark

set tabstop=4
set shiftwidth=4
set expandtab

set number

set encoding=utf-8

" Window Keymaps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" tnoremap <C-h> <C-\><C-N><C-w>h
" tnoremap <C-j> <C-\><C-N><C-w>j
" tnoremap <C-k> <C-\><C-N><C-w>k
" tnoremap <C-l> <C-\><C-N><C-w>l

nnoremap <C-Up> :resize +5<CR>
nnoremap <C-Down> :resize -5<CR>
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Right> :vertical resize +5<CR>
" tnoremap <C-Up> :resize +5<CR>
" tnoremap <C-Down> :resize -5<CR>
" tnoremap <C-Left> :vertical resize -5<CR>
" tnoremap <C-Right> :vertical resize +5<CR>

nnoremap <C-s> :vsp<CR>
nnoremap <C-_> :sp<CR>

" Buffer Keymaps
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" Tab Keymaps
nnoremap tj  :tabfirst<CR>
nnoremap tl  :tabnext<CR>
nnoremap th  :tabprev<CR>
nnoremap tk  :tablast<CR>
nnoremap tt  :tabnew<CR>
nnoremap tx  :tabclose<CR>

" Quicklist Keymaps
nnoremap [c :cp<CR>
nnoremap ]c :cn<CR>

" Soft Wrap
set wrap linebreak nolist

" Disable Beep
set belloff=all

set hlsearch
set incsearch

" Map double-space to clear highlighting
map <silent> <Space> :noh<CR>

" Highlight current line when not in insert mode
set cul
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul
autocmd WinLeave * setlocal nocul
autocmd WinEnter * setlocal cul

" :bufonly closes all but the current buffer
command Bufonly :%bd|e#

"
" Deoplete
"
" let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('buffer', 'filetypes', ['php', 'c', 'cpp', ])
call deoplete#custom#source('file', 'filetypes', ['php', 'c', 'cpp'])
call deoplete#custom#source('ultisnips', 'filetypes', ['php', 'c', 'cpp'])

" call deoplete#custom#source('phpactor', 'filetypes', ['php'])

call deoplete#custom#source('tag', 'filetypes', ['c', 'cpp'])

"
" Phpactor
"

let g:phpactorOmniAutoClassImport = v:true

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

"
" FZF
"
nnoremap <C-p> :FZF<CR>
let g:fzf_layout = { 'down': '40%' }

"
" Fix syntax highlighting on vue files
"
autocmd FileType vue syntax sync fromstart
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

"
" Use '+' register (and thus the system clipboard) for all unnamed 
" clipboard-based operations
"
set clipboard+=unnamedplus

"
" Map and Configure Tagbar
"
nnoremap <C-n> :Tagbar<CR>

let g:tagbar_autoclose=1
let g:tagbar_compact=1

"
" Set terminal escape key to 'Control + /'
" 
:tnoremap <C-q> <C-\><C-n>

"
" Configure linters
"
let g:ale_linters = {
           \   'php': ['phpcs'],
           \   'javascript': ['eslint'],
           \   'c': [],
           \}

let g:ale_fixers = {
            \   'php': ['phpcbf'],
            \   'javascript': ['eslint'],
            \   'vue': ['eslint'],
            \   'c': ['clang-format'],
            \}

let g:ale_c_cppcheck_options='--enable=all'
let g:ale_php_phpcs_options='--standard=PSR2'
let g:ale_php_phpcbf_options='--standard=PSR2'
let g:ale_php_phpcbf_use_global = 1

let g:ale_c_clangformat_options='-style=file'

let g:ale_fix_on_save = 1

" If I don't do this, phpcbf fails on any file in the exclude-pattern :/
" let g:ale_php_phpcbf_executable = $HOME.'/.support/phpcbf-helper.sh'
" in order to get the alternate executable working you have to declare it as
" use global, even though it's not 'global' :/
"let g:ale_php_phpcbf_use_global = 1

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

"
" Enable persistent undo
"

set undofile

"
" Auto-closing braces
"
" let g:lexima_enable_basic_rules=0

"
" Enable Mouse Controls
"
set mouse=a

set ignorecase
set smartcase

"
" Netrw config
"
let g:netrw_liststyle=3
let g:netrw_banner=0

"
" IndentLine Config
"
let g:indentLine_char = '|'

"
" Prevent Hiding of Double-Quote characters in JSON files
"
let g:vim_json_syntax_conceal = 0
