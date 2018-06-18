
"install vim-plug if it isnt installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'w0ng/vim-hybrid'
Plug 'kristijanhusak/vim-hybrid-material'

Plug 'romainl/Apprentice'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
 
" Generaal
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' 
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'adelarsq/vim-matchit'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-expand-region'
Plug 'PeterRincker/vim-argumentative'
Plug 'janko-m/vim-test'
Plug 'AndrewRadev/splitjoin.vim'

" Markdown
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Go
Plug 'fatih/vim-go'
" Ember
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'mustache/vim-mustache-handlebars'
Plug 'camthompson/vim-ember'
Plug 'JarrodCTaylor/vim-ember-cli-test-runner'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'dsawardekar/portkey'
Plug 'dsawardekar/ember.vim'
Plug 'poetic/vim-textobj-javascript'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'vim-utils/vim-ruby-fold'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'itmammoth/run-rspec.vim'
Plug 'ngmy/vim-rubocop'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'junkblocker/patchreview-vim'
Plug 'codegram/vim-codereview'

call plug#end()

let mapleader = " "

syntax on
set background=dark
colorscheme onedark

" Macvim
if has("gui_macvim")
  set hlsearch
"  highlight Normal guibg=grey10
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
endif

set number relativenumber
set linebreak

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set tabstop=2
set shiftwidth=0
set expandtab

filetype on
filetype indent on
filetype plugin on

set nofoldenable 
set incsearch

set wildmenu
set wildcharm=<C-Z>

" Do not litter the source directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Completion
set omnifunc=syntaxcomplete#Complete
set completeopt+=longest
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1

" NERDTree
let g:NERDTreeWinSize=30

let g:fzf_action = {
  \ 'ctrl-o': 'e',
  \ 'ctrl-t': 'tabedit',
  \ 'ctrl-h':  'botright split',
  \ 'ctrl-v':  'vertical botright split' }

" fzf
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-p> :Files<CR>

map <C-Tab> :b <C-Z>

" Move up and down in quickfix windows
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cp<CR>

" Go to alternate file
nnoremap <Leader>a :A<CR>

" Find word under cursor in project
nnoremap <Leader>f :Ack! <C-r><C-w><CR>

" Quick access to git commands
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Ruby
nmap <Leader>tf :RunSpec<CR>
nmap <Leader>tl :RunSpecLine<CR>
nmap <Leader>tt :RunSpecLastRun<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-l> :NERDTreeFind<CR>



set diffopt+=vertical

" silver searcher / ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Ruby
autocmd BufNewFile,BufRead *.markdown setfiletype octopress

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Linting
let g:ale_sign_warning = '◊'
let g:ale_sign_error = 'X'
highlight link ALEWarningSign Number
highlight link ALEErrorSign Identifier
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop']
\}
" let g:ale_fix_on_save = 1

" LightLine
set laststatus=2 

let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
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
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
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
vmap " :'<,'>call Quote('"', '"')<CR> 
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
