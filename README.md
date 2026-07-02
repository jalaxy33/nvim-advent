# nvim-advent

My debloated [NeoVim](https://neovim.io/) configs, guided by KISS (Keep It Simple and Stupid) principle.

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

## Inspirations

- TJ DeVries - [Advent of Neovim](https://www.youtube.com/playlist?list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM)
- The Rad Lectures - [Minimal & Powerful: The Perfect NeoVim Setup for 2026](https://www.youtube.com/watch?v=lljs_7xB7Ps)
- LazyVim [keymaps.lua](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)


