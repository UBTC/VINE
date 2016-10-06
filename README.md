# VINE --- Vim Imitating Neo Emacs

This is my Vim configuration for processing tex/pdf, and coding in Golang & Python.
Debuger, autocompletion, snippets and tags supports are supported.

## Vim
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

5. Launch you `vim`, and type `:PlugInstall` to install the needed `vim` plugins.


## NeoVim
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

5. Launch you `nvim`, and type `:PlugInstall` to install the needed `nvim` plugins.
6. That's all.

### Have fun!
