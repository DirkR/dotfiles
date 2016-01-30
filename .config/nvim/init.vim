" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
set tags=./tags;./.git/tags,tags
set number ts=2 sts=2 sw=2 et
if has('relativenumber')
  set relativenumber
endif
set cursorline wildmenu showmatch modeline
filetype plugin indent on
syntax enable

let mapleader = ','

" Load plugins {
call plug#begin('~/.config/nvim/plugged')

" General Plugins {
Plug 'airblade/vim-gitgutter'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'benekastah/neomake'
Plug 'vim-scripts/Reindent'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'ntpeters/vim-better-whitespace'
" }

" Python Plugins {
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'python.vim', { 'for': 'python' }
Plug 'python_match.vim', { 'for': 'python' }
Plug 'pythoncomplete', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
" }

" Markdown Plugins {
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
" }

" Javascript Plugins {
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
Plug 'elzr/vim-json', {'for': ['javascript', 'json']}
" }

" PHP Plugins {
Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
" Plug 'shawncplus/phpcomplete.vim'
Plug 'joonty/vdebug', { 'on': 'VdebugStart', 'for': 'php' }
" Needed by pdv
Plug 'tobyS/vmustache', { 'for': 'php' }
Plug 'tobyS/pdv', { 'for': 'php' }
" Drupal enhancements
" https://www.drupal.org/node/1389448#vundle - with modifications, so don't update
Plug 'git://drupalcode.org/project/vimrc.git', {'dir': 'drupal-vimrc', 'rtp': 'bundle/vim-plugin-for-drupal/', 'pinned': 1}
" Code sniffer fixer: <leader>pcf
" Pinned because of https://github.com/stephpy/vim-php-cs-fixer/issues/1
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'brookhong/DBGPavim'
" }

call plug#end()
" }

" Colors {
set t_Co=256
set background=dark
try
  colorscheme jellybeans
catch /^Vim\%((\a\+)\)\=:E185/
  color desert
endtry
" }

" tmp files and backups
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪

" see http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Emacs bindings in command line mode
cnoremap <c-a> <c-b>
"cnoremap <c-e> <end>
"cnoremap <c-f> <Right>
"cnoremap <c-b> <Left>

" Whitespaces {
"let g:better_whitespace_filetypes_blacklist+=['mail']
autocmd BufWritePre * StripWhitespace
" }

" Neomake {
let g:neomake_verbose = 0
let g:neomake_open_list = 0
let g:neomake_php_phpcs_args_standard="."
let g:neomake_error_sign = { 'texthl': 'ErrorMsg', }
let g:neomake_warning_sign = { 'texthl': 'ErrorMsg', }
autocmd! BufWritePost * Neomake
" }

" PHP {
" Slightly buggy, error about mark not being set
" nnoremap <unique> <Leader>rlv :call PhpRenameLocalVariable()<CR>
" nnoremap <unique> <Leader>rcv :call PhpRenameClassVariable()<CR>
" nnoremap <unique> <Leader>rm :call PhpRenameMethod()<CR>
" nnoremap <unique> <Leader>eu :call PhpExtractUse()<CR>
" vnoremap <unique> <Leader>ec :call PhpExtractConst()<CR>
" nnoremap <unique> <Leader>ep :call PhpExtractClassProperty()<CR>
" vnoremap <unique> <Leader>em :call PhpExtractMethod()<CR>
" nnoremap <unique> <Leader>np :call PhpCreateProperty()<CR>
" nnoremap <unique> <Leader>du :call PhpDetectUnusedUseStatements()<CR>
" vnoremap <unique> <Leader>== :call PhpAlignAssigns()<CR>
" nnoremap <unique> <Leader>sg :call PhpCreateSettersAndGetters()<CR>
"nnoremap <unique> <Leader>da :call PhpDocAll()<CR>

" Define filetype php for Drupal source code files
au BufNewFile,BufRead *.inc,*.module,*.test,*.install set filetype=php
au BufNewFile,BufRead *.info                          set filetype=dosini

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

  " PHP debugging {
  let g:dbgPavimKeyToggleBp = '<leader>b'
  let g:dbgPavimKeyRun = '<leader>r'
  " }
" }

" Javascript {
au BufNewFile,BufRead *.js set foldmarker={,} foldlevel=2 foldmethod=marker
" }

" Fugitive {
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>gac :Gcommit --amen -v<CR>
nmap <leader>g :Ggrep
" ,f for global git search for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
:vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>
" }

" Easier navigation through quicklist.
nnoremap <S-C-j> :cN<CR>
nnoremap <S-C-k> :cn<CR>

" Tabs {
nnoremap <leader>tn :tabnew<Enter>
nnoremap <leader>tt :tabNext<Enter>
nnoremap <leader>tc :tabclose<Enter>
" }

" Folding {

autocmd Filetype mail      setlocal nofoldenable spell spelllang=de_de,en_us
autocmd Filetype git       setlocal nofoldenable
autocmd Filetype gitcommit setlocal nofoldenable
" autocmd Filetype php       setlocal foldmethod=indent

"set foldenable foldlevelstart=10 foldnestmax=10 foldmethod=indent
let php_folding=2
" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" }

" White characters {
set autoindent
set tabstop=2
set softtabstop=2
set textwidth=80
set shiftwidth=2
set expandtab
set wrap
set formatoptions=qrn1
if exists('+colorcolumn')
  set colorcolumn=+1
endif
set cpo+=J
" }

" Distraction free writing {
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }
