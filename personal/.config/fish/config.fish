source /usr/share/cachyos-fish-config/cachyos-config.fish

set -gx EDITOR nvim
set -gx NVIM_APPNAME "kickstart.nvim"

eval $(keychain --eval --quiet id_ed25519)

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
