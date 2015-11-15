" VINE """""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Vim Imitating Neo Emacs --- my NeoVim configuration
"     for processing tex/pdf, and coding in Golang & Python
"
" Based on Amir Salihefendic's basic.vimrc *mainly*
" https://github.com/amix/vimrc
" Last change: 2012.05.29
"
" Based on Bram Moolenaar's mswin.vim
" http://vim.cybermirror.org/runtime/mswin.vim
" Last change: 2006.04.02
"
" Based on many internet resources...
"
" Revised by Mogei Wang, in 2014.
" Revised by Mogei Wang, in 2015.
" https://github.com/mogeiwang/
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin()
    " debugger
        Plug 'Shougo/vimproc.vim', { 'do': 'make' }
        Plug 'idanarye/vim-vebugger', { 'on':  'VBGattachGDB' }
    " colorscheme
        Plug 'tomasr/molokai'
    " session and more
        Plug 'shougo/unite.vim'
    " YCM
        Plug 'Valloric/YouCompleteMe', { 'do': 'git submodule update --init --recursive;./install.py --gocode-completer' }
    " snippet
        Plug 'sirver/ultisnips'
        Plug 'honza/vim-snippets'
    " tagbar --- use with exuberant-ctags
        Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
    " golang
        Plug 'fatih/vim-go'
    " python
        Plug 'klen/python-mode'
    " latex
        Plug 'gerw/vim-latex-suite'
    " pandoc and markdown
        Plug 'vim-pandoc/vim-pandoc'
        Plug 'vim-pandoc/vim-pandoc-syntax'
    " surround
        Plug 'tpope/vim-surround'
    " nerds
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'scrooloose/nerdcommenter'
    " go code complete -(it seems not stable)- I add this thing very manually
        " 1. install it as described
        " 2. cp ~/.vim/autoload/gocomplete.vim ~/.nvim/autoload/
        "Plug 'nsf/gocode'
call plug#end()

"UltiSnips
"cp ~/.config/nvim/plugged/vim-snippets/UltiSnips/ ~/.config/nvim/ (or use a link)
let g:UltiSnipsExpandTrigger = '<M-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

"Tagbar configuration for gotags
"   --- go get -u github.com/jstemmer/gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : '~/goWork/bin/gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" replace system's fish shell. run sh cmd with :! or :r!
set shell=/bin/sh

" use Space as the leader
let mapleader = " "
let g:mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Try to keep the cursor line in the vertically center (27 lines)
set scrolloff=100

" command-line completion
set wildmode=longest:full,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" colorscheme and background
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme molokai
set t_co=256
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and  backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set dir to the current file's directory.
set autochdir

" Open dialog defaults to the current file's directory.
set browsedir=buffer

" Turn backup on. Need to build these folders manually.
set backup
set backupdir=/home/mw/.config/nvim/backup
set directory=/home/mw/.config/nvim/tmp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Avoids updating the screen before commands are completed
set lazyredraw

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Map \ to replace
noremap \ :1,$s/%/ic

" When you press <leader>/ you can search and replace the selected text
vnoremap <silent> <leader>/ :call VisualSelection('replace', '')<CR>

" Disable highlight when <leader>/ is pressed.
noremap <silent> <leader>/ :noh<CR>

" Del the tailing ^M (to work with MSDOS files)
noremap <Leader>; mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader><CR> :tabedit <c-r>=expand("%:p:h")<CR>/

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab
set stal=2

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ exec ":call CopyrightUpdate()" |
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ exe "normal! zz" |
    \ endif

" Automatically update copyright notice with current year
autocmd BufWritePre *
    \ exec ":call CopyrightUpdate()" |
    \ exec ":call DeleteTrailingWS()" |
    \ let &backupext = '.v-' . strftime("%Y%m%d-%H%M%S")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format the status line
set statusline=\ \%3cC\ \%4lL\ \%<\%p%%\%L\ \%8bA\ \%{HasPaste()}\ %3{HasLinewidth()}W\ NM\%=%n%m\%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}[%{&ff}][%r%h%w]\%F
au InsertEnter * set statusline=\ \%3cC\ \%4lL\ \%<\%p%%\%L\ \%8bA\ \%{HasPaste()}\ %3{HasLinewidth()}W\ MI\%=%n%m\%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}[%{&ff}][%r%h%w]\%F
au InsertLeave * set statusline=\ \%3cC\ \%4lL\ \%<\%p%%\%L\ \%8bA\ \%{HasPaste()}\ %3{HasLinewidth()}W\ NM\%=%n%m\%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}[%{&ff}][%r%h%w]\%F

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :W sudo saves the file
command! W w !sudo tee % > /dev/null

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> mz:m+<CR>`z
nnoremap <M-k> mz:m-2<CR>`z
vnoremap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

" command line keybindings
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> d$

if has("mac") || has("macunix")
    vmap <D-j> <M-j>
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-k> <M-k>
endif

" Delete trailing white spaces
noremap <leader><BS> :%s/\s\+$//ge<CR>

" F1-F4 resources
noremap <F1> :Unite file_rec<CR>
noremap <F2> :Unite file<CR>
noremap <F3> :Unite buffer<CR>
noremap <F4> :Unite tab<CR>

" F5: run according to filetypes
au FileType go nmap <F5> :terminal<CR><Plug>(go-run)
au FileType python let g:pymode_run_bind = "<F5>"

" F6: toggle and untoggle spell checking
noremap <F6> :setlocal spell!<CR>

" F7: build something
au FileType go nmap <F7> <Plug>(go-build)
au FileType tex nmap <F7> :xelatex %<CR>
au FileType markdown nmap <F7> :pandoc -f markdown+lhs % -o markdown.html -t dzslides -i -s -S --toc<CR>

" F8: open vim file explorer
noremap <F8> :NERDTreeToggle<CR>

" F9: open terminal
noremap <F9> :vsplit<CR><C-W>l:terminal<CR>

" F10: start the debugger
noremap <F10> :TagbarToggle<CR>

"  F11: tags
noremap <F11> :VBGattachGDB<CR>

"  F12 attach copyright things
noremap <F12> :call CopyrightAdd()<CR>:call EnvProcess()<CR>

" Quickly insert parenthesis/brackets/etc.:
inoremap <leader>( ()<esc>i
inoremap <leader>[ []<esc>i
inoremap <leader>{ {}<esc>i
inoremap <leader>' ''<esc>i
inoremap <leader>" ""<esc>i
inoremap <leader>` `'<esc>i
inoremap <leader>~ ``"<esc>i
inoremap <leader>$ $$<esc>i
inoremap <leader>\| \|\|<esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MSOffice keybings. Based on Bram Moolenaar's mswin.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" wrap or not
set wrap
set whichwrap+=<,>,[,],h,l,b,s,~

" set line break
set linebreak
set textwidth=0
set wrapmargin=0

" colors
set colorcolumn=+1
hi ColorColumn NONE ctermbg=Cyan

" to recognize a list header
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* "and bullets, too
set formatoptions+=n

" backspace in Visual mode deletes selection
vnoremap <BS> d
inoremap <C-BS> <C-W>
inoremap <C-Del> <C-O>dw

" Use CTRL-S for saving, also in Insert mode
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" CTRL-A is Select all
noremap  <C-S-A> gggH<C-O>G
inoremap <C-S-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-S-A> <C-C>gggH<C-O>G
onoremap <C-S-A> <C-C>gggH<C-O>G
snoremap <C-S-A> <C-C>gggH<C-O>G
xnoremap <C-S-A> <C-C>ggVG

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => M.W. appends
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set font :set guifont=Monospace\ 12
set guifont=Ubuntu\ mono\ 13

" set delay
set timeoutlen=1000

"show line number
set number

" emacsish keybindings
noremap  <C-G> <Esc>
vnoremap <C-G> <Esc>
snoremap <C-G> <Esc>
inoremap <C-G> <Esc>
cnoremap <C-G> <Esc>

" run a command
noremap  <C-Z> :
vnoremap <C-Z> :
snoremap <C-Z> :
inoremap <C-Z> <C-O>:

"show the command typing
set showcmd

"use dialog when file was not saved
set confirm

"inline replace
set gdefault

"set auto-complete
set completeopt=longest,menu

"share clipboard
set clipboard+=unnamedplus

"Change Y to yank to end of line
map Y y$

"set fold
set foldenable
set foldmethod=indent " marker " or manual

"show the tabes
set list
set listchars=tab:\|\ ,trail:·,extends:#,nbsp:.

"do not break words joined by the following characters
set iskeyword+=_,@

" paste over without overwriting register
xnoremap p pgvy
xnoremap P Pgvy

" To avoid the extra 'shift' keypress when typing the colon to go to cmdline mode
noremap ; :
noremap : ;

" make >> and << work better
set shiftround

" hightlight current line/col
set cursorline
set cursorcolumn

" enable omni-completion
set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType perl set omnifunc=perlcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType node set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType cpp set omnifunc=cppcomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType d set omnifunc=ccomplete#Complete
autocmd Filetype octave set omnifunc=syntaxcomplete#Complete
autocmd FileType go set omnifunc=gocomplete#Complete

" brackets
inoremap <expr> <silent> ( MayCloseParentheses('(')
inoremap <expr> <silent> [ MayCloseParentheses('[')
inoremap <expr> <silent> { MayCloseParentheses('{')

" encodeing just opened file.
set fileencodings=utf8,gbk,ucs-bom,cp936,gb2312,gb18030,big5,euc-jp,euc-kr

" commenting blocks of code.
                                     let b:comment_leader = '// '
autocmd FileType c,d,cpp,java,scala  let b:comment_leader = '// '
autocmd FileType sh,ruby,python,text let b:comment_leader = '#  '
autocmd FileType conf,fstab,perl     let b:comment_leader = '#  '
autocmd FileType tex,octave          let b:comment_leader = '%  '
autocmd FileType mail                let b:comment_leader = '>  '
autocmd FileType vim                 let b:comment_leader = '"  '
autocmd FileType lisp                let b:comment_leader = ';; '
autocmd FileType haskell,vhdl,ada    let b:comment_leader = '-- '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    elseif a:direction == 'sl'
        exe "/" . l:pattern
        g//
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! HasPaste()
    if &paste
        return 'MP'
    else
        return 'NP'
    endif
endfunction

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")
   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif
   if bufnr("%") == l:currentBufNum
     new
   endif
   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction

function! MayCloseParentheses(cmd)
    if col('.') == col('$')
        if a:cmd == '('
            return "()\<Left>"
        elseif a:cmd == '{'
            return "{}\<Left>"
        elseif a:cmd == '['
            return "[]\<Left>"
        endif
    else
        if a:cmd == '('
            return "("
        elseif a:cmd == '['
            return "["
        elseif a:cmd == '{'
            return "{"
        endif
    endif
endfunction

function! HasLinewidth()
    if &tw<1000
        return &tw
    else
        return 'K+'
    endif
endfunction

function! CopyrightAdd()
    call append(0, b:comment_leader . "==============================================")
    call append(1, b:comment_leader . "·")
    call append(2, b:comment_leader . "· Author: Mogei Wang")
    call append(3, b:comment_leader . "·")
    call append(4, b:comment_leader . "· MogeiWang@GMail.com")
    call append(5, b:comment_leader . "·")
    call append(6, b:comment_leader . "· Filename: ".expand("%:t"))
    call append(7, b:comment_leader . "·")
    call append(8, b:comment_leader . "· COPYRIGHT ".strftime("%Y"))
    call append(9, b:comment_leader . "·")
    call append(10, b:comment_leader . "· Description:")
    call append(11, b:comment_leader . "·")
    call append(12, b:comment_leader . "==============================================")
    call append(13, "")
    echohl WarningMsg | echo "copyright information added." | echohl None
endfunction

function! CopyrightUpdate()
    let n=1
    while n < 20
        let line = getline(n)
        if line =~ '\s*\S*COPYRIGHT\S*.*$'
            if line !~ strftime("%Y")
                exe "g#\\cCOPYRIGHT \\(".strftime("%Y")."\\)\\@![0-9]\\{4\\}\\(-".strftime("%Y")."\\)\\@!#s#\\([0-9]\\{4\\}\\)\\(-[0-9]\\{4\\}\\)\\?#\\1-".strftime("%Y")
            endif
            echohl WarningMsg | echo "copyright information updated." | echohl None
            return
        endif
        let n = n + 1
    endwhile
    echohl WarningMsg | echo "no copyright information found." | echohl None
endfunction

function! EnvProcess()
    let n=1
    while n < 3
        let line = getline(n)
        if line =~ '\s*\S*env\S*.*$'
            echohl WarningMsg | echo "env information exists." | echohl None
            return
        endif
        let n = n + 1
    endwhile
    if &filetype == 'tex'
        call append(0, b:comment_leader . "!/usr/bin/env pdflatex")
    elseif &filetype == 'sh'
        call append(0, b:comment_leader . "!/usr/bin/env bash")
    elseif &filetype == 'python' || &filetype == 'py'
        call append(0, b:comment_leader . "!/usr/bin/env python")
    elseif &filetype == 'octave' || &filetype == 'm'
        call append(0, "#!/usr/bin/env octave")
    else
        call append(0, b:comment_leader . "!/usr/bin/env " . &filetype)
    endif
    call append(1, b:comment_leader . "-*- coding:utf-8 -*-")
    call append(2, "")
    echohl WarningMsg | echo "env information added(gg check it)!" | echohl None
endfunction

function! MultiLineSearch(bang, ...)
  if a:0 > 0
    let sep = (a:bang) ? '\_W\+' : '\_s\+'
    let @/ = join(a:000, sep)
  endif
endfunction
