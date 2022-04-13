require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.lsp"
require "user.treesitter"

vim.cmd "colorscheme dracula"

-- Fix netrw bugs
vim.cmd [[ autocmd FileType netrw setl bufhidden=delete ]]
