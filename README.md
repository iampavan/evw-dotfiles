# dotfiles

Eric N. Vander Weele's dotfiles.

Feel free to look around and take what inspires you!

## Installation

1. Clone repository.

    ```shell
    git clone https://github.com/ericvw/dotfiles.git ~/.dotfiles
    ```

2. Symlink dotfiles to home directory.

    ```shell
    stow fish
    stow neovim
    # ...
    ```

3. Spawn new terminal session and enjoy!

## License

Apache License, Version 2.0.  See license text in [LICENSE](LICENSE).

---

Q : What dotfile manager have people had success with? Ideally looking for something that supports macOS, managed Linux and VS Code (for DevX Spaces).

A :  I use GNU Stow (https://www.gnu.org/software/stow/), and I have a dotfiles repository that I clone to ~/.dotfiles. I then cd ~/.dotfiles and stow <package>.

I manage my dotfiles at https://github.com/ericvw/dotfiles 10, and my initialization files source <file>.local for machine-specific configuration that pertains to that environment. The README.md has more detailed installation and usage instructions. Feel free to check out my UNIX ~evander home directory and how I use .*.local files.

Ref : https://discourse.dev.bloomberg.com/t/what-dotfile-manager-do-people-use/14864

---

<!--
vim: tw=79:spell
-->
