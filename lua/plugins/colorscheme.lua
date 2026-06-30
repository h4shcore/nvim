-- return {
--   {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme("gruvbox")
--
--       vim.schedule(function()
--         local groups = {
--           "SignColumn",
--           -- "LineNr",
--           -- "CursorLineNr",
--           "FoldColumn",
--
--           "DiagnosticSignWarn",
--           "DiagnosticSignError",
--           "DiagnosticSignInfo",
--           "DiagnosticSignHint",
--         }
--
--         for _, group in ipairs(groups) do
--           vim.api.nvim_set_hl(0, group, { bg = "none" })
--         end
--       end)
--     end,
--   },
-- }

return {
    "echasnovski/mini.base16",
    version = false,
    config = function()
        local c = require("palette")

        require("mini.base16").setup({
            palette = {
                base00 = c.background,
                base01 = c.black,
                base02 = c.brightBlack,
                base03 = c.brightGreen,
                base04 = c.foreground,
                base05 = c.foreground,
                base06 = c.brightWhite,
                base07 = c.white,

                base08 = c.red,
                base09 = c.accent,
                base0A = c.yellow,
                base0B = c.green,
                base0C = c.cyan,
                base0D = c.blue,
                base0E = c.magenta,
                base0F = c.brightRed,
            },
        })

        vim.g.colors_name = "ryu"
    end,
}
