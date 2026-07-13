# nvim-advent

My debloated [NeoVim](https://neovim.io/) configs, guided by KISS (Keep It Simple and Stupid) principle.

## Requirements

- [Neovim](https://neovim.io/) 0.12 or newer
- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) (0.26.1 or later, installed via your package manager, **not npm**)
- a [Nerd Font](https://www.nerdfonts.com/) (Optional)

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

  - Windows (with powershell)

    ```sh
    git clone https://github.com/jalaxy33/nvim-advent $env:LOCALAPPDATA\nvim
    ```

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

- [Configure LSP & formatters](tutors/docs/lsp_and_formatter.md)

## Inspirations

- TJ DeVries - [Advent of Neovim](https://youtube.com/playlist?list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&si=mRYcshdbfi_J0FKo) series
- [LazyVim](https://www.lazyvim.org/) & its [keymaps](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)
- The Rad Lectures - [Minimal & Powerful: The Perfect NeoVim Setup for 2026](https://youtu.be/lljs_7xB7Ps?si=MeIEpPWaoQ9-5v-_)
- Seth Phaeno [How To Setup Minimal Neovim 0.12 Config Guide From Scratch](https://youtu.be/XQuNoprFW38?si=raqtvRT-bwlyLqz2)
