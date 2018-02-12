# VINE --- Vim Imitating Neo Emacs

This is my Vim configuration for editing TeX, Go and Python scripts.

## Plugins
- github.com/tpope/vim-surround
- github.com/tommcdo/vim-exchange
- github.com/terryma/vim-multiple-cursors
- github.com/junegunn/vim-easy-align
- github.com/lokaltog/vim-easymotion
- github.com/tpope/vim-repeat
- github.com/chriskempson/tomorrow-theme
- github.com/junegunn/goyo.vim
- github.com/shougo/unite.vim
- github.com/codepiano/ctrlp.vim
- github.com/mhinz/vim-startify
- github.com/xolox/vim-misc
- github.com/xolox/vim-session
- github.com/valloric/YouCompleteMe
- github.com/ervandew/supertab
- github.com/sirver/ultisnips
- github.com/honza/vim-snippets
- github.com/scrooloose/syntastic
- github.com/scrooloose/nerdtree
- github.com/scrooloose/nerdcommenter
- github.com/Shougo/vimproc.vim
- github.com/idanarye/vim-vebugger
- github.com/majutsushi/tagbar
- github.com/fatih/vim-go
- github.com/nsf/gocode
- github.com/klen/python-mode
- github.com/gerw/vim-latex-suite
- github.com/vim-pandoc/vim-pandoc
- github.com/vim-pandoc/vim-pandoc-syntax
- github.com/jceb/vim-orgmode

## Installation
### Vim
1. Backup your old configurations:

    `mv ~/.vim ~/.vim.backup`

2. Clone this configuration:

    `git clone 'https://github.com/ubtc/vine' ~/.vim`

3. Grab the plugin manager `vim-plug`:

    ```sh
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

4. make the backup dirs:

    ```sh
    mkdir -p ~/.vim/backup
    mkdir -p ~/.vim/tmp
    ```

5. Launch `vim`, and type `:PlugInstall` to install `vim` plugins.


### NeoVim
1. Backup your old configurations:

    `mv ~/.config/nvim ~/.config/nvim.backup`

2. Clone this configuration:

    `git clone 'https://github.com/ubtc/vine' ~/.config/nvim`

3. Grab the plugin manager `vim-plug`:

    ```sh
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

4. make the backup dirs:

    ```sh
    mkdir -p ~/.config/nvim/backup
    mkdir -p ~/.config/nvim/tmp
    ```

5. Launch `nvim`, and type `:PlugInstall` to install `nvim` plugins.
6. That's all.

### Have fun!
