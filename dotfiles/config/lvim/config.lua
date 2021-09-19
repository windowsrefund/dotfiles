-- https://github.com/ChristianChiarulli/lvim/blob/master/config.lua

-- Settings
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.completeopt = {'menuone','noinsert','noselect'}

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- General
lvim.colorscheme = "onedarker"
lvim.format_on_save = true
lvim.lint_on_save = true

-- Key mappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys. insert_mode = {
  ["<C-\\>"] = "<C-o>o",
}
lvim.keys.normal_mode = {
  ["<"] = "<<",
  [">"] = ">>",
  -- Make Y work like C or D
  ["Y"] = "y$",
  -- QuickFix
  ["]q"] = ":cnext<CR>",
  ["[q"] = ":cprev<CR>",
  ["-q"] = ":cclose<CR>",
  -- buffers
  ["]b"] = ":bn<CR>",
  ["[b"] = ":bp<CR>",
  ["-b"] = ":bd<CR>",
}
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Telescope
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Whichkey
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

-- Builtins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.nvimtree.quit_on_open = 1
-- lvim.builtin.cmp.confirm_opts.select = false

-- Nvimtree
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.nvimtree.indent_markers = 1

-- Treesitter
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.context_commentstring.enable = true
lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } } -- https://github.com/LunarVim/LunarVim/issues/1513

-- LSP
lvim.lsp.diagnostics.virtual_text = false

-- Lang
lvim.lang.python.formatters = {{ exe = "black" }}
lvim.lang.python.linters = {{ exe = 'flake8' }}
lvim.lang.go.formatters = {{ exe = "goimports" }}

-- Additional Plugins
lvim.plugins = {
  { "lunarvim/colorschemes"},
  { "folke/tokyonight.nvim"},
  { "vimjas/vim-python-pep8-indent"},
  {
    -- Pretty list for diagnostics, references, telescope results, quickfix and location lists
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      require "user.matchup"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "user.blankline"
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("user.neoscroll").config()
    end,
  },
  {
    -- highlight unique characters on a line with f and F
    "unblevable/quick-scope",
    config = function()
      require "user.quickscope"
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "BufRead",
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "Filetype", "python", "nnoremap <buffer> <leader>r :w<CR>:!python3 %<CR>" },
  { "Filetype", "sh", "nnoremap <buffer> <leader>r :w<CR>:!sh %<CR>" },
}

-- Cursor line wrap
lvim.line_wrap_cursor_movement = true

