# nvim-advent

My debloated [NeoVim](https://neovim.io/) configs, guided by KISS (Keep It Simple and Stupid) principle.

## Requirements

- [Neovim](https://neovim.io/) 0.12 or newer
- a [Nerd Font](https://www.nerdfonts.com/) (Optional)
- Node.js and [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md): Install via package manager, **not npm**. 
  > You can also install it automatically by setting `vim.g.treesitter_autoinstall` to `true` in [lua/core/options.lua](./lua/core/options.lua). But it may fail occasionally.
- a C/C++ compiler (e.g. gcc)

If you are using NixOS, to enable dynamic linker. please make sure [nix-ld](https://github.com/nix-community/nix-ld) is globally enabled.

## How to use

- Make a backup of your current Neovim files:

  - linux/MacOS

    ```sh
    # required
    mv ~/.config/nvim{,.bak}

    # optional but recommended
    mv ~/.local/share/nvim{,.bak}
    mv ~/.local/state/nvim{,.bak}
    mv ~/.cache/nvim{,.bak}
    ```

  - Windows (with powershell)

    ```ps1
    # required
    Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

    # optional but recommended
    Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
    ```

- Clone my config:

  - Linux/MacOS

    ```sh
    git clone https://github.com/jalaxy33/nvim-advent ~/.config/nvim
    ```

    <details><summary>Easier clone for CN user</summary>

    ```sh
    git clone https://gh-proxy.org/https://github.com/jalaxy33/nvim-advent ~/.config/nvim
    ```

    </details>

  - Windows (with powershell)

    ```sh
    git clone https://github.com/jalaxy33/nvim-advent $env:LOCALAPPDATA\nvim
    ```

    <details><summary>Easier clone for CN user</summary>

    ```sh
    git clone https://gh-proxy.org/https://github.com/jalaxy33/nvim-advent $env:LOCALAPPDATA\nvim
    ```

    </details>

- (Optional) Remove the `.git` folder, so you can add it to your own repo later

  - Linux/MacOS

    ```sh
    rm -rf ~/.config/nvim/.git
    ```

  - Windows (with powershell)

    ```sh
    Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
    ```

- Start Neovim!

  ```sh
  nvim
  ```

## Documentations

- [Plugin Management](docs/guides/plugin_management.md)
- [Configure LSP & formatters](docs/guides/lsp_and_formatter.md)

## Inspirations

- TJ DeVries - [Advent of Neovim](https://youtube.com/playlist?list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&si=mRYcshdbfi_J0FKo) series
- [LazyVim](https://www.lazyvim.org/) & its [keymaps](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)
- The Rad Lectures - [Minimal & Powerful: The Perfect NeoVim Setup for 2026](https://youtu.be/lljs_7xB7Ps?si=MeIEpPWaoQ9-5v-_)
- Seth Phaeno [How To Setup Minimal Neovim 0.12 Config Guide From Scratch](https://youtu.be/XQuNoprFW38?si=raqtvRT-bwlyLqz2)
