
"install vim-plug if it isnt installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"
" Colorschemes
Plug 'rakr/vim-one'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'daviesjamie/vim-base16-lightline' 

Plug 'rakr/vim-two-firewatch'
Plug 'rakr/vim-one'

Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
endif

Plug 'Shougo/echodoc.vim'

" navigate tmux panes like vim panes
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" General
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive' " git commands
Plug 'tpope/vim-rhubarb' " browse on github
Plug 'scrooloose/nerdtree' " file browser
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " install fzf command line
Plug 'junegunn/fzf.vim' " fzf fuzzy finder
Plug 'mileszs/ack.vim' " Ack for file serach
Plug 'adelarsq/vim-matchit'
Plug 'w0rp/ale' " Linting
Plug 'sheerun/vim-polyglot' " multiple languages
Plug 'terryma/vim-expand-region' " use + to expand visual selection
Plug 'PeterRincker/vim-argumentative' " motions for function args using ,
Plug 'neomake/neomake'
Plug 'janko/vim-test' 
Plug 'cristianbica/neomake-rspec'
Plug 'AndrewRadev/splitjoin.vim' " gS and gJ for smart splitting and joining of lines

Plug 'Shougo/neosnippet.vim' "snippets using <C-k>
Plug 'Shougo/neosnippet-snippets' " lots of useful snippets

" Markdown
Plug 'junegunn/goyo.vim' " minimal mode for editing text and markdown
Plug 'junegunn/limelight.vim' " highlights the current paragraph

" Go
Plug 'fatih/vim-go'


" Ember
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'dsawardekar/portkey'
Plug 'dsawardekar/ember.vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'poetic/vim-textobj-javascript'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'vim-utils/vim-ruby-fold'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'itmammoth/run-rspec.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'ngmy/vim-rubocop'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'junkblocker/patchreview-vim'
Plug 'codegram/vim-codereview'

"Python
Plug 'alfredodeza/pytest.vim'
Plug 'zchee/deoplete-jedi'

" Html
Plug 'alvan/vim-closetag'

call plug#end()

let mapleader = " "

syntax on
set background=light
let base16colorspace=256  " Access colors present in 256 colorspace
let g:terminal_ansi_colors=['#181818', '#ab4642', '#a1b56c', '#f7ca88', '#7cafc2', '#ba8baf', '#86c1b9', '#d8d8d8', '#585858', '#ab4642', '#a1b56c', '#f7ca88', '#7cafc2', '#ba8baf', '#86c1b9', '#86c1b9']
colorscheme base16-material-darker
set fillchars=vert:│
"set termguicolors
" Macvim
if has("gui_macvim")
  set macligatures
  set guifont=Fira\ Code:h15
  set linespace=5
  set guicursor+=a:blinkon0

  set guioptions-=e
  set guioptions-=m
  set guioptions-=l
  set guioptions-=r
  set guioptions-=b
  set guioptions-=v
  set guioptions-=L
  "set transparency=8
endif

"set number relativenumber
set nonumber
set signcolumn=yes
set linebreak
set scrolloff=5
set mouse=a

augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set tabstop=2
set shiftwidth=0
set expandtab

filetype on
filetype indent on
filetype plugin on

set hidden

set nofoldenable 
set incsearch
set hlsearch

set wildmenu
set wildcharm=<C-Z>

set previewheight=5

map <C-c> "*y
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Do not litter the source directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"let g:LanguageClient_serverCommands = {
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ 'ruby': [ 'solargraph',  'stdio' ],
"    \ }

let g:LanguageClient_autoStart = 1

" Minimal LSP configuration for JavaScript
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
endif


nnoremap <Leader>n :call LanguageClient_contextMenu()<CR>

" Completion
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:python_host_prog = '/Users/jackryan/.vim/virtualenv/py2/bin/python'
let g:python3_host_prog = '/Users/jackryan/.vim/virtualenv/py3/bin/python'

let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filter = 0
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#expand_word_forward = 0
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

call deoplete#custom#source('LanguageClient',
      \ 'min_pattern_length',
      \ 2)

let g:NERDTreeWinSize=30

let g:fzf_action = {
  \ 'ctrl-o': 'e',
  \ 'ctrl-t': 'tabedit',
  \ 'ctrl-h':  'botright split',
  \ 'ctrl-v':  'vertical botright split' }

" fzf

nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-p> :Files<CR>

" Find word under cursor in project
nnoremap <Leader>f :Ack! <C-r><C-w><CR>

" Quick access to git commands
nnoremap <Leader>gs :Gstatus<CR><C-w>10+
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>

" Replace visual selection with confirmation
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" quick find
nnoremap <C-f> :Ack! -F ""<left>

" Snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:neosnippet#snippets_directory='~/dotfiles/snippets'


" Ruby
"
"
let g:neomake_ruby_enabled_makers=['rspec']

let test#strategy = "vimux"
let g:neomake_logfile='/Users/jackryan/tmp/neomake.log'

"autocmd FileType ruby,eruby nmap <Leader>tf <Esc> :RunSpec<CR>
"autocmd FileType ruby,eruby nmap <Leader>tl <Esc> :RunSpecLine<CR>
"autocmd FileType ruby,eruby nmap <Leader>tt <Esc> :RunSpecLastRun<CR>
autocmd FileType ruby,eruby nmap <Leader>tf <Esc> :TestFile<CR>
autocmd FileType ruby,eruby nmap <Leader>tl <Esc> :TestNearest<CR>
autocmd FileType ruby,eruby nmap <Leader>tt <Esc> :TestLast<CR>
autocmd FileType ruby,eruby nmap <Leader>a :A<CR>

" Python
autocmd FileType python nmap <Leader>tf <Esc>:Pytest file<CR>
autocmd FileType python nmap <Leader>ta <Esc>:Pytest project<CR>
autocmd FileType python nmap <Leader>tt <Esc>:Pytest project<CR>

" Go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"
let g:go_auto_type_info = 1

autocmd FileType go nmap <Leader>ta :GoTest -short<cr>
autocmd FileType go nmap <Leader>tt :GoTest -short<cr>
autocmd Filetype go nmap <Leader>a <Plug>(go-alternate-edit)

" Ember 
nmap <Leader>a :A<CR>
nmap <Leader>v :R<CR>
nmap <Leader>rf <ESC>:ALEFix<CR>

command GenerateTest !echo "%" | sed -E 's/^app\/components\/(.*).js$/\1/' | xargs ember g component-test 

map <C-n> :NERDTreeToggle<CR>
map <Leader>l :NERDTreeFind<CR>

set diffopt+=vertical

" silver searcher / ripgrep
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

" Ruby
autocmd BufNewFile,BufRead *.markdown setfiletype octopress

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"au BufReadPost *.hbs set syntax=mustache
" Testing
let test#python#pytest#executable = 'script/test'

" Linting
let g:ale_set_highlights = 0
let g:ale_sign_warning = '!'
let g:ale_sign_error = 'X'
highlight link ALEWarningSign Number
highlight link ALEErrorSign Identifier

let g:ale_linters = {
\   'cs': ['OmniSharp']
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'ruby': ['rubocop'],
\   'python': ['black']
\}

let g:ale_javascript_prettier_use_local_config = 1

autocmd FileType javascript.jsx let g:ale_fix_on_save = 1

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.js"
let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.erb'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'

" LightLine
set laststatus=2 

let g:lightline = {
\ 'colorscheme': 'base16',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok'], ['make_running']]
\ },
\ 'inactive': {
\   'left': [['filename', 'modified']],
\   'right': [['make_running']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_function': {
\   'make_running': 'SpinnerText'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d !', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d X', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" Surround
"vmap " :'<,'>call Quote('"', '"')<CR> 
vmap ' :'<,'>call Quote("'", "'")<CR> 
vmap ` :'<,'>call Quote("`", "`")<CR> 
vmap ( :'<,'>call Surround('(', ')')<CR> 
vmap [ :'<,'>call Surround('[', ']')<CR> 
vmap { :'<,'>call Surround('{', '}')<CR> 

fun! Surround(s1, s2) range
  exe "normal vgvmboma\<Esc>"
  normal `a
  let lineA = line(".")
  let columnA = col(".")
  normal `b
  let lineB = line(".")
  let columnB = col(".")
  " exchange marks
  if lineA > lineB || lineA <= lineB && columnA > columnB
    " save b in c
    normal mc
    " store a in b
    normal `amb
    " set a to old b
    normal `cma
  endif 
  exe "normal `ba" . a:s2 . "\<Esc>`ai" . a:s1 . "\<Esc>lxh"
endfun

fun! Quote(s1, s2) range
  exe "normal vgvmboma\<Esc>"
  normal `a
  let lineA = line(".")
  let columnA = col(".")
  normal `b
  let lineB = line(".")
  let columnB = col(".")
  " exchange marks
  if lineA > lineB || lineA <= lineB && columnA > columnB
    " save b in c
    normal mc
    " store a in b
    normal `amb
    " set a to old b
    normal `cma
  endif
  exe "normal `ba" . a:s2 . "\<Esc>`ai" . a:s1 . "\<Esc>"
endfun

function! FormatJSON()
  :%!python -m json.tool
endfunction

let s:spinner_index = 0
let s:active_spinners = 0
let s:spinner_states = ['|', '/', '--', '\', '|', '/', '--', '\']

function! StartSpinner()
    let b:show_spinner = 1
    let s:active_spinners += 1
    if s:active_spinners == 1
        let s:spinner_timer = timer_start(1000 / len(s:spinner_states), 'SpinSpinner', {'repeat': -1})
    endif
endfunction

function! StopSpinner()
    let b:show_spinner = 0
    let s:active_spinners -= 1
    if s:active_spinners == 0
        :call timer_stop(s:spinner_timer)
    endif
endfunction

function! SpinSpinner(timer)
    let s:spinner_index = float2nr(fmod(s:spinner_index + 1, len(s:spinner_states)))
    redraw
endfunction

function! SpinnerText()
    if get(b:, 'show_spinner', 0) == 0
        return " "
    endif

    return s:spinner_states[s:spinner_index]
endfunction

augroup neomake_hooks
    au!
    autocmd User NeomakeJobInit :call StartSpinner()
    autocmd User NeomakeJobInit :echom "Build started"
    autocmd User NeomakeFinished :call StopSpinner()
    " autocmd User NeomakeFinished :echom "Build complete"
  augroup END
