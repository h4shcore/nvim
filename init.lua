require("config.options")
require("config.keymaps")
require("config.lazy")

-- remove the sign column color
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
