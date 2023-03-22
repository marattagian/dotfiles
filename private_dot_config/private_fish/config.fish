# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

starship init fish | source
/home/linuxbrew/.linuxbrew/bin/brew shellenv | source

set PATH /usr/local/go/bin $PATH
set PATH ~/.local/bin $PATH
set PATH $HOME/.emacs.d/bin $PATH

set -gx EDITOR nvim
set NIX_LINK $HOME/.nix-profile

set LIBRARY_PATH /usr/local/lib
set C_INCLUDE_PATH /usr/local/include
set LD_LIBRARY_PATH /usr/local/lib

# if status is-login
#     contains ~/.local/bin $PATH
#     or set PATH ~/.local/bin $PATH
# end
# set -g BOOTISO_SYSLINUX_LIB_ROOT /usr/share/syslinux/
