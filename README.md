P5read.vim
==========

P5read.vim is a simple template insertion plugin.

Installation
------------

1. Setup the [neobundle](https://github.com/Shougo/neobundle.vim) package manager
2. Set the bundle for [p5read.vim](https://github.com/g-snowhawk/p5read.vim)
    ```vim
    NeoBundle "g-snowhawk/p5read.vim"
    ```

3. Open up Vim and start installation with `:NeoBundleInstall`

Configuration
-------------

This is an example `~/.vimrc` configuration for P5read.vim.

```vim
" Templates installation directory for P5read.vim
let g:p5read#base_directory = '/path/to/directory'
```

Usage
-----

1. Your templates into the `g:p5read#base_directory`
2. Open some file in Vim
3. Run `:PVread <your template name>`
