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


# if status is-login
#     contains ~/.local/bin $PATH
#     or set PATH ~/.local/bin $PATH
# end
# set -g BOOTISO_SYSLINUX_LIB_ROOT /usr/share/syslinux/
