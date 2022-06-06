
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
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/echodoc.vim'

" navigate tmux panes like vim panes
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" General
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive' " git commands
Plug 'airblade/vim-gitgutter'
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'
Plug 'tpope/vim-rhubarb' " browse on github
Plug 'scrooloose/nerdtree' " file browser
" Plug 'ryanoasis/vim-devicons' " file icons
" Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " install fzf command line
Plug 'junegunn/fzf.vim' " fzf fuzzy finder
Plug 'mileszs/ack.vim' " Ack for file serach
Plug 'adelarsq/vim-matchit'
Plug 'sheerun/vim-polyglot' " multiple languages
Plug 'terryma/vim-expand-region' " use + to expand visual selection
Plug 'PeterRincker/vim-argumentative' " motions for function args using ,
Plug 'neomake/neomake'
Plug 'janko/vim-test' 
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
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

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

" Html
Plug 'alvan/vim-closetag'

call plug#end()

g:coc_global_extensions = [
  \'coc-eslint',
  \'coc-tsserver',
  \'coc-solargraph'
\]

call coc#config('coc.preferences', {
  \ 'suggest.echodocSupport': true,
  \ 'solargraph.enable': true,
  \ "solargraph.filetypes": ['ruby', 'eruby'],
  \ 'tsserver.implicitProjectConfig.experimentalDecorators': true,
  \ 'eslint.autoFixOnSave': true,
  \ 'diagnostic.errorSign': '',
  \ 'diagnostic.warningSign': '',
  \ 'diagnostic.hintSign': '',
  \ 'diagnostic.infoSign': '',
  \ 'eslint.filetypes': ['javascript', 'javascriptreact', 'typescript']
  \ })

let mapleader = " "

syntax on
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
let g:terminal_ansi_colors=['#181818', '#ab4642', '#a1b56c', '#f7ca88', '#7cafc2', '#ba8baf', '#86c1b9', '#d8d8d8', '#585858', '#ab4642', '#a1b56c', '#f7ca88', '#7cafc2', '#ba8baf', '#86c1b9', '#86c1b9']
colorscheme jack-material-darker
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

set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾ " Hides ~ on blank lines.

" Do not litter the source directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

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
nnoremap <Leader>ff :Ack! -F ""<left><C-r><C-w><CR>
nnoremap <Leader>fa :Ack! -F ""<left><C-r><C-w><right> app

" Quick access to git commands
nnoremap <Leader>gs :Git<CR>
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

"gitgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '│'
set updatetime=250
nmap <Leader>gn <Plug>(GitGutterNextHunk)  
nmap <Leader>gp <Plug>(GitGutterPrevHunk)

" Ruby
let test#strategy = "vimux"
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
"let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0

autocmd FileType go set updatetime=300
autocmd FileType go set shortmess+=c
autocmd FileType go set cmdheight=2

autocmd FileType go nmap <Leader>ta :GoTest -short<cr>
autocmd FileType go nmap <Leader>tt :GoTest -short<cr>
autocmd Filetype go nmap <Leader>a <Plug>(go-alternate-edit)

" Ember 
nmap <Leader>a :A<CR>
nmap <Leader>v :R<CR>

command GenerateTest !echo "%" | sed -E 's/^app\/components\/(.*).js$/\1/' | xargs ember g component-test 

map <C-n> :NERDTreeToggle<CR>
map <Leader>l :NERDTreeFind<CR>

set diffopt+=vertical

" silver searcher / ripgrep
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

" Completion
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

command! -nargs=0 Format :call CocAction('format')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rr  <Plug>(coc-codeaction)
vmap <leader>rr <Plug>(coc-codeaction-selected)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-quickfix)

" Ruby
autocmd BufNewFile,BufRead *.markdown setfiletype octopress
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let test#ruby#rspec#executable = 'pilot exec intercom bundle exec rspec -- --no-profile'

"au BufReadPost *.hbs set syntax=mustache
" Testing
let test#python#pytest#executable = 'script/test'

" Linting
highlight link ALEWarningSign Number
highlight link ALEErrorSign Identifier

" First letter of runner's name must be uppercase
let test#custom_runners = {'javascript': ['Ember'], 'typescript': ['Ember']}
autocmd FileType javascript,typescript nmap <Leader>tf <Esc> :TestFile<CR>
autocmd FileType javascript,typescript nmap <Leader>tl <Esc> :TestNearest<CR>
autocmd FileType javascript,typescript nmap <Leader>tt <Esc> :TestLast<CR>

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.js"
let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.erb'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'

" LightLine
set laststatus=2 

let g:lightline = {
\ 'colorscheme': 'base16',
\ 'active': {
\   'left': [['mode', 'paste'], ['cocstatus', 'filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'inactive': {
\   'left': [['filename', 'modified']],
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status'
\ },
\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

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
