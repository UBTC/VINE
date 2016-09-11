" YAVC """""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{
"
" Yet Another Vim Configuration (without any plugins)
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
" https://github.com/mogeiwang/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" no compatible with vi
set nocompatible

" replace system's fish shell. run sh cmd with :! or :r!
set shell=/bin/sh

" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" <leader>` command in insert mode
" <leader>; history
" <leader>, jumps
" <leader>= registers
" <leader>. select, search & show
" <leader>- marks
" <leader>/ no finding highlight
" <leader>\ toggle linebreak
" <leader>o change some setting
" <leader>p plugins, reserved
" <leader>q quick edit some files
" <leader>r grep
" <leader>s spell check
" <leader>t tabs operation
" <leader>u buffer operation
" <leader>v join lines without extra space
" <leader>w fast write into
" <leader>x [un]comment lines
" <leader>y env processing
" <leader>z replace selected
" <leader>BS Delete trailing white spaces
" <leader>CR Run shell commands
" <leader>... Quickly insert parenthesis/brackets/etc.

" use Space as the leader, press C-Space to input ' ' quickly. M.W.
let mapleader = " "
let g:mapleader = " "

" run shell commands
noremap <leader><cr> :shell<cr>

" show history
nnoremap <leader>; :history<cr>

" run a command in insert mode
inoremap <leader>` <C-O>

" Fast saving
nnoremap <leader>ww :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Try to keep the cursor line in the vertically center (27 lines)
set scrolloff=9

" move curosr to the middle of the current line
nnoremap M :let pos = len(getline(".")) / 2\|execute "normal" . pos . "\|"<cr>

" Turn on the WiLd menu
set wildmenu

" popup menu when mouse is pressed
set mousemodel=popup

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

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

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
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

try
    colorscheme murphy
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set dir to the current file's directory.
set autochdir

" Open dialog defaults to the current file's directory.
set browsedir=buffer

" Turn backup on.
" Need to build these folders manually.
set backup
set backupdir=/home/mw/.vim/backup
set directory=/home/mw/.vim/tmp

" show registers
noremap <leader>= :registers<cr>

" open vim file explorer
noremap <leader><Esc> :Ex<CR>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;-)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"Auto indent & Smart indent
set ai
set si
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related"{{{
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" list the searched pattern
" noremap <leader>. :r! cat % \| grep -in o
vnoremap <leader>. :call VisualSelection('sl', '')<CR>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Avoids updating the screen before commands are completed
set lazyredraw

" Treat long lines as break lines (useful when moving around in them) &
" Remap navigation commands to center/top view on cursor using zz/zt
" In fact, it is auto-cenetered in most cases, since scrolloff is huge.
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
nnoremap <C-Home> 15gg<End>0
inoremap <C-Home> <Esc>15gg<End>I

" show jumps
noremap <leader>, :jumps<cr>

" show marks
noremap <leader>- :marks<cr>

"Edit mapping (make cursor keys work like in Windows: <C-Left><C-Right>
nnoremap <C-Left> B
vnoremap <C-S-Left> B
nnoremap <C-S-Left> gh<C-O>B
inoremap <C-S-Left> <C-\><C-O>gh<C-O>B
nnoremap <C-Right> W
vnoremap <C-S-Right> W
nnoremap <C-S-Right> gh<C-O>W
inoremap <C-S-Right> <C-\><C-O>gh<C-O>W

" Map \ to replace
noremap \ :1,$s/%/ic

" Multiline search
command! -bang -nargs=* -complete=tag S call SearchMultiLine(<bang>0, <f-args>)|normal! /<C-R>/<CR>
" noremap / :S o

" Disable highlight when <leader>/ is pressed.
noremap <silent> <leader>/ :noh<cr>

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Useful mappings for managing buffers
noremap <leader>uu :buffers<cr>
noremap <leader>ud :bd<cr>
noremap <leader>uc :1,1000 bd!<cr>
noremap <leader>un :bnext<cr>
noremap <leader>up :bprevious<cr>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

" Useful mappings for managing tabs
noremap <leader>tt :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>td :tabclose<cr>
noremap <leader>tm :tabmove
noremap <leader>tn :tabnext<cr>
noremap <leader>tp :tabprevious<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
noremap <leader>od :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" http://go-lang.cat-v.org/text-editors/vim/
au BufRead,BufNewFile *.go set filetype=go

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

" Remember info about open buffers on close
set viminfo^=%
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line"{{{
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ \%3cC\ \%4lL\ \%<\%p%%\%L\ \%8bA\ \%{HasPaste()}\ %3{HasLinewidth()}W\ NM\%=%n%m\%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}[%{&ff}][%r%h%w]\%F
au InsertEnter * set statusline=\ \%3cC\ \%4lL\ \%<\%p%%\%L\ \%8bA\ \%{HasPaste()}\ %3{HasLinewidth()}W\ MI\%=%n%m\%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}[%{&ff}][%r%h%w]\%F
au InsertLeave * set statusline=\ \%3cC\ \%4lL\ \%<\%p%%\%L\ \%8bA\ \%{HasPaste()}\ %3{HasLinewidth()}W\ NM\%=%n%m\%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}[%{&ff}][%r%h%w]\%F
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    vmap <D-j> <M-j>
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-k> <M-k>
endif

" Delete trailing white spaces
noremap <leader><BS> :%s/\s\+$//ge<CR>

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

" Surround the visual selection in parenthesis/brackets/etc.:
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>` <esc>`>a'<esc>`<i`<esc>
vnoremap <leader>~ <esc>`>a"<esc>`<i``<esc>
vnoremap <leader>$ <esc>`>a$<esc>`<i$<esc>
vnoremap <leader>\| <esc>`>a\|<esc>`<i\|<esc>
vnoremap <leader><space> <esc>`>a<space><esc>`<i<space><esc>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => grep searching"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open vimgrep and put the cursor in the right position
noremap <leader>rr :vimgrep/%

" When you press <leader>zz you can search and replace the selected text
vnoremap <silent> <leader>zz :call VisualSelection('replace', '')<CR>

" To go to the current, next, pervious search result:
noremap <leader>rc :cc<cr>
noremap <leader>rn :cn<cr>
noremap <leader>rp :cp<cr>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,sc will toggle and untoggle spell checking
noremap <leader>sc :setlocal spell!<cr>

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>ss z=
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete/add the Windows ^M
" noremap <leader>om :set fileformat=unix<cr>:write<cr>
" noremap <leader>oM :set fileformat=dos<cr>:write<cr>
"
" Amir's solution
" noremap <Leader>om mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
"
" let vim reload the file and the 'crlf' or 'lf' as endln.
" see :help 'fft'
noremap <leader>om :e! ++ff=dos<cr>
noremap <leader>omm :e! ++ff=mac<cr>
noremap <leader>oM :e! ++ff=unix<cr>

" plugins, reserved
noremap <leader>pp :h plugin<cr>

" Quickly open a text buffer for scribble
noremap <leader>qt :e ~/buffer.txt<cr>

" Quickly open a markdown buffer for scribble
noremap <leader>qm :e ~/buffer.md<cr>

" Quickly open a python buffer for scribble. M.W.
noremap <leader>qp :e buffer.py<cr>

" Quickly open a shell buffer for scribble. M.W.
noremap <leader>qs :e buffer.sh<cr>

" Toggle paste mode on and off
noremap <leader>op :setlocal paste!<cr>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MSOffice keybings. Based on Bram Moolenaar's mswin.vim"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
" behave mswin
" set cpo&vim

" wrap or not, M.W. ...
set wrap
" let &showbreak = '+++ '
set backspace=eol,start,indent
set whichwrap+=<,>,[,],h,l,b,s,~

" set line break; +=a is handy for my latex file editing
set linebreak
set textwidth=0
set wrapmargin=0
set colorcolumn=+1
hi ColorColumn NONE ctermbg=Cyan

set formatoptions+=wmjnM
set formatlistpat+=\\\|^\\*\\s*
noremap <expr> <silent> <leader>\ ToggleLinewidth()

" backspace in Visual mode deletes selection
vnoremap <BS> d
inoremap <C-BS> <C-W>
inoremap <C-Del> <C-O>dw

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V> "+gP
map <S-Insert> "+gP

cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and Visual mode
" without the +virtualedit feature. They are pasted as if they were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" For CTRL-V to work autoselect must be off,
" unless on unix which has two selections.
if !has("unix")
    set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => M.W. appends "{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set font :set guifont=Monospace\ 12
set guifont=Ubuntu\ mono\ 13

"show line number
set number

" a eaiser Esc
inoremap <C-L> <Esc>

"show the command typing
set showcmd

"use dialog when file was not saved
set confirm

"inline replace
set gdefault

"set auto-complete
set completeopt=preview,menu
""do not scan boost/eigen includes while completing
"set include=^\\s*#\\s*include\ \\(<boost/\\)\\@!
"set include=^\\s*#\\s*include\ \\(<Eigen/\\)\\@!
"to disable scanning of all included files
set complete-=i

"share clipboard
set clipboard+=unnamed

"set fold
set foldenable
set foldmethod=marker " or manual

"show the tabes
set list
set listchars=tab:\|\ ,trail:·

"do not break words joined by the following characters
"set iskeyword+=_,$,@,%,#,-
set iskeyword+=_,@

" paste over without overwriting register
xnoremap p pgvy
xnoremap P Pgvy

" To avoid the extra 'shift' keypress when typing the colon to go to cmdline mode
noremap ; :
noremap ;; ;

" join lines and remove extra space
nnoremap <leader>vv Jx

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

set rtp+=$GOROOT/misc/vim

" tab auto complete
inoremap <script> <Tab> <c-r>=MySuperTab('n')<cr>
inoremap <script> <S-Tab> <c-r>=MySuperTab('p')<cr>
inoremap <C-Tab> <C-X><C-O>

" brackets
inoremap <expr> <silent> ( MayCloseParentheses('(')
inoremap <expr> <silent> [ MayCloseParentheses('[')
inoremap <expr> <silent> { MayCloseParentheses('{')

" Set utf8 as standard encoding, and en_US as the standard language
set encoding=utf8
set termencoding=utf8

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
autocmd FileType haskell,vhdl,ada    let b:comment_leader = '-- '
noremap <silent> <leader>xx :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>xc :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

noremap <leader>yy <CR>:call CopyrightAdd()<CR>:call EnvProcess()<CR>
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions"{{{
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

function! MySuperTab(cmd)
    if strpart(getline("."), col(".") - 2, 1) == ' ' || col(".") == 1
        return "\<tab>"
    else
        return a:cmd == 'n' ? "\<c-n>" : "\<c-p>"
    endif
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

" Toggle textwidth.
function! ToggleLinewidth()
    if &tw==0
        set textwidth=50
        return
    elseif &tw<=80
        set textwidth=99
        return
    elseif &tw<=120
        set textwidth=999
        return
    else
        set textwidth=0
        return
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

function! SearchMultiLine(bang, ...)
  if a:0 > 0
    let sep = (a:bang) ? '\_W\+' : '\_s\+'
    let @/ = join(a:000, sep)
  endif
endfunction
"}}}
