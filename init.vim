" VINE """""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Vim Imitating Neo Emacs --- my NeoVim configuration
"     for processing tex/pdf, and coding in Golang & Python
"
" Based on Amir Salihefendic's basic.vimrc
"     https://github.com/amix/vimrc
" Bram Moolenaar's mswin.vim
"     http://vim.cybermirror.org/runtime/mswin.vim
" and many internet resources...
"
" COPYRIGHT, Mogei Wang, 2010-2015.
" https://github.com/mogeiwang/vine
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin()
    " surround
        Plug 'tpope/vim-surround'
    " exchange
        Plug 'tommcdo/vim-exchange'
    " multiple-cursors
        Plug 'terryma/vim-multiple-cursors'
    " auto-align
        Plug 'junegunn/vim-easy-align'
    " easy motion
        Plug 'lokaltog/vim-easymotion'
    " better repeater
        Plug 'tpope/vim-repeat'
    " line numbers
        Plug 'myusuf3/numbers.vim'
    " colorscheme
        Plug 'tomasr/molokai'
    " resources
        Plug 'shougo/unite.vim'
    " session and more
        Plug 'mhinz/vim-startify'
    " YCM
        Plug 'valloric/YouCompleteMe', { 'do': 'git submodule update --init --recursive;./install.py --gocode-completer' }
    " snippet
        Plug 'sirver/ultisnips'
        Plug 'honza/vim-snippets', { 'do': 'cp ~/.config/nvim/plugged/vim-snippets/UltiSnips/ ~/.config/nvim/' }
    " syatastic
       Plug 'scrooloose/syntastic'
    " nerds
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'scrooloose/nerdcommenter'
    " debugger (, { 'on':  'VBGattachGDB' })
        Plug 'Shougo/vimproc.vim', { 'do': 'make; cp -r ~/.config/nvim/plugged/vimproc.vim/autoload ~/.config/nvim/; cp -r ~/.config/nvim/plugged/vimproc.vim/lib ~/.config/nvim/' }
        Plug 'idanarye/vim-vebugger', { 'do': 'cp -r ~/.config/nvim/plugged/vim-vebugger/autoload ~/.config/nvim/' }
    " tagbar --- use with exuberant-ctags ( 'on':  'TagbarToggle', ) 
        Plug 'majutsushi/tagbar', { 'do': 'go get -u github.com/jstemmer/gotags' }
    " golang
        Plug 'fatih/vim-go'
        Plug 'nsf/gocode', { 'do': 'go get -u github.com/nsf/gocode; cp ~/.config/nvim/plugged/gocode/vim/autoload/gocomplete.vim ~/.config/nvim/autoload/' }
    " python
        Plug 'klen/python-mode'
    " latex
        Plug 'gerw/vim-latex-suite'
    " pandoc and markdown
        Plug 'vim-pandoc/vim-pandoc'
        Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

" UltiSnips
let g:UltiSnipsExpandTrigger = '<M-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" EasyAlign (e.g. vipga, gaip)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"Tagbar configuration for gotags
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
" => Mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" replace system's fish shell. run sh cmd with :! or :r!
set shell=/bin/bash

" use Space as the leader
let mapleader = ","
let g:mapleader = ","

" Enable syntax highlighting
syntax enable

"set fold
set foldenable
set foldmethod=indent " marker " or manual

" set line break
set linebreak
set textwidth=0
set wrapmargin=0

" command-line completion
set wildmode=longest:full,full

" to recognize a list header
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s*
set formatoptions+=n

"show the tabes
set list
set listchars=tab:\|\ ,trail:·,extends:#,nbsp:.

"do not break words joined by the following characters
set iskeyword+=_,@

" make >> and << work better
set shiftround

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab
set stal=2

" wrap or not
set wrap
set whichwrap+=<,>,[,],h,l,b,s,~

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

"use dialog when file was not saved
set confirm

"inline replace
set gdefault

"set auto-complete
set completeopt=longest,menu

"share clipboard
set clipboard+=unnamedplus

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Show matching brackets, and how many tenths of a second to show
set showmatch
set mat=10

" set delay
set timeoutlen=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Screen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

"show the command typing
set showcmd

" Try to keep the cursor line in the vertically center (27 lines)
set scrolloff=3

"Always show current position
set ruler

"show line number
set number

" hightlight current line/col
set cursorline
set cursorcolumn

" Height of the command bar
set cmdheight=2

" colorscheme and background
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme molokai
set t_co=256
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T,e
    set guitablabel=%M\ %t
endif

" colors
set colorcolumn=+1
hi ColorColumn NONE ctermbg=Cyan

"set font
set guifont=Ubuntu\ Mono\ 12

" Format the status line
set statusline=\ \%3cC\ \%4lL\ \%<\%p%%\%L\ \%8bA\ \%{HasPaste()}\ %3{HasLinewidth()}W\ NM\%=%n%m\%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}[%{&ff}][%r%h%w]\%F
au InsertEnter * set statusline=\ \%3cC\ \%4lL\ \%<\%p%%\%L\ \%8bA\ \%{HasPaste()}\ %3{HasLinewidth()}W\ MI\%=%n%m\%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}[%{&ff}][%r%h%w]\%F
au InsertLeave * set statusline=\ \%3cC\ \%4lL\ \%<\%p%%\%L\ \%8bA\ \%{HasPaste()}\ %3{HasLinewidth()}W\ NM\%=%n%m\%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}[%{&ff}][%r%h%w]\%F

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set dir to the current file's directory.
set autochdir

" Open dialog defaults to the current file's directory.
set browsedir=buffer

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Turn backup on. Need to build these folders manually.
set backup
set backupdir=/home/mw/.config/nvim/backup
set directory=/home/mw/.config/nvim/tmp

" encodeing just opened file.
set fileencodings=utf8,gbk,ucs-bom,cp936,gb2312,gb18030,big5,euc-jp,euc-kr

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

" commenting blocks of code.
                                       let b:comment_leader = '// '
autocmd FileType c,d,cpp,java,scala,go let b:comment_leader = '// '
autocmd FileType sh,ruby,python,text   let b:comment_leader = '#  '
autocmd FileType conf,fstab,perl       let b:comment_leader = '#  '
autocmd FileType tex,octave            let b:comment_leader = '%  '
autocmd FileType mail                  let b:comment_leader = '>  '
autocmd FileType vim                   let b:comment_leader = '"  '
autocmd FileType lisp                  let b:comment_leader = ';; '
autocmd FileType haskell,vhdl,ada      let b:comment_leader = '-- '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Map \ to replace
noremap \ :1,$s/%/ic

" Disable highlight when <leader>/ is pressed.
noremap <silent> <leader>/ :noh<CR>

" Del the tailing ^M (to work with MSDOS files)
noremap <Leader>; mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

" Opens a new tab with the current buffer's path
noremap <leader><CR> :tabedit <c-r>=expand("%:p:h")<CR>/

" :W sudo saves the file
command! W w !sudo tee % > /dev/null

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> mz:m+<CR>`z
nnoremap <M-k> mz:m-2<CR>`z
vnoremap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

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
noremap <F9> :vsplit<CR><C-W>l:terminal 'fish'<CR>

" F10: start the debugger
noremap <F10> :TagbarToggle<CR>

"  F11: tags
noremap <F11> :VBGstartGDB

"  F12 attach copyright things
noremap <F12> :call CopyrightAdd()<CR>:call EnvProcess()<CR>

" backspace in Visual mode deletes selection
vnoremap <BS> d
inoremap <C-BS> <C-W>
inoremap <C-Del> <C-O>dw

" Use CTRL-S for saving, also in Insert mode
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

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

"Change Y to yank to end of line
map Y y$

" paste over without overwriting register
xnoremap p pgvy
xnoremap P Pgvy

" To avoid the extra 'shift' keypress when typing the colon to go to cmdline mode
noremap ; :
noremap : ;

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

" brackets
inoremap <expr> <silent> ( MayCloseParentheses('(')
inoremap <expr> <silent> [ MayCloseParentheses('[')
inoremap <expr> <silent> { MayCloseParentheses('{')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
