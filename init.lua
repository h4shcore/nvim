require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.diagnostics")

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
