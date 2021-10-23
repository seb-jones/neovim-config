"
" Plugins
"

call plug#begin('~/.local/share/nvim/plugged')

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'sheerun/vim-polyglot'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cohama/lexima.vim'
Plug 'majutsushi/tagbar'
Plug 'pechorin/any-jump.vim'
Plug 'RRethy/vim-illuminate'
Plug 'unblevable/quick-scope'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'camilledejoye/phpactor-mappings'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-tailwindcss', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'phpactor/coc-phpactor', {'do': 'yarn install --frozen-lockfile && yarn run build'}

call plug#end()

set termguicolors
set title
colorscheme onehalfdark
set background=dark
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
set tabstop=4
set shiftwidth=4
set expandtab
set number
set encoding=utf-8
set relativenumber

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
" FZF
"
nnoremap <C-p> :FZF<CR>
let g:fzf_layout = { 'down': '40%' }

command!      -bang -nargs=* Rgf                        call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

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

"
" PHPactor
"
let g:phpactorActivateOverlapingMappings = v:true

" Prevent COC PHPactor from doubling up dollar signs at the start of variables
autocmd FileType php set iskeyword+=$

