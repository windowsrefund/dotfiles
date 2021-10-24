-- Neovim
lvim.format_on_save = false
lvim.leader = "space"
lvim.colorscheme = "onedarker"
lvim.debug = false
lvim.log.level = "warn"
require("user.neovim").config()

-- Builtins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = false
lvim.builtin.dap.active = true
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.indent.disable = { "python" }
lvim.builtin.notify.active = true

-- Additional Plugins
require("user.plugins").config()

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- require("user.autocommads").config()

-- Additional keybindings
-- require(user.keybindings").config()
