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
Plug 'majutsushi/tagbar'
Plug 'pechorin/any-jump.vim'
Plug 'RRethy/vim-illuminate'
Plug 'unblevable/quick-scope'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tommcdo/vim-exchange'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-endwise'
Plug 'rhysd/git-messenger.vim'
Plug 'windwp/nvim-autopairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'phaazon/hop.nvim'
Plug 'brooth/far.vim'
Plug 'mattn/emmet-vim'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'camilledejoye/phpactor-mappings'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-tailwindcss', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'yaegassy/coc-blade', {'do': 'yarn install --frozen-lockfile'}
Plug 'github/copilot.vim'
Plug 'junegunn/goyo.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

if !empty(glob("$HOME/.local_init.vim"))
    source $HOME/.local_init.vim
endif

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
set norelativenumber

" Window Keymaps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-s> :vsp<CR>
nnoremap <C-S-s> :sp<CR>

nnoremap X :q<CR>

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

" Highlight current line when not in insert mode
set cul
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul
autocmd WinLeave * setlocal nocul
autocmd WinEnter * setlocal cul

" :bufonly closes all but the current buffer
command Bufonly :%bd|e#

"
" Sideways
"
nnoremap <C-Left> :SidewaysLeft<CR>
nnoremap <C-Right> :SidewaysRight<CR>

"
" FZF
"

let $FZF_DEFAULT_COMMAND='fd --type file --type symlink --hidden --no-ignore-vcs --exclude vendor --exclude node_modules --exclude .git'
let g:fzf_layout = { 'down': '40%' }

nnoremap <C-P> :Files<CR>
nnoremap <C-S-P> :Buffers<CR>

command!      -bang -nargs=* Rgf                        call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

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
" Enable Mouse Controls
"
set mouse=a

set ignorecase
set smartcase

"
" Clear highlighting on Return
"

noremap <CR><CR> <cmd>noh<CR>

"
" Go back to previous file on Backspace
"

nnoremap <BS> <C-^>

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
" Custom comment strings
"
autocmd FileType html.twig setlocal commentstring={#\ %s\ #}

"
" Hop plugin
"
lua require'hop'.setup { uppercase_labels = true, multi_windows = false, teasing = false, }

noremap <space> <cmd>lua require'hop'.hint_patterns({}, [=[\w\+[[:punct:]]*\\|[[:punct:]]\+\w*]=])<CR>

"
" Autopairs plugin
"
lua require'nvim-autopairs'.setup()

"
" PHPactor
"
let g:phpactorActivateOverlapingMappings = v:true


"
" Diff View Command
"
command Gd :DiffviewOpen

"
" Git Blame command
"
command Gb :Git blame

"
" COC
" Adapted from https://github.com/neoclide/coc.nvim#example-vim-configuration
"

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
