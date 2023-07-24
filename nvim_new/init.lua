local load = function(mod)
    package.loaded[mod] = nil
    require(mod)
end

load('jamibu.settings')
load('jamibu.commands')
load('jamibu.keymaps')
load('jamibu.plugins')

pcall(vim.cmd.colorscheme, 'catppuccin')
