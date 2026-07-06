return {
  "echasnovski/mini.base16",
  lazy = false,
  priority = 1000,

  config = function()
    local palette = require("wallust")

    require("mini.base16").setup({
      palette = palette,
    })

    -- Make sure our overrides happen after mini.base16
    vim.schedule(function()
      local hl = vim.api.nvim_set_hl

      -- Main background
      hl(0, "Normal", { fg = palette.base05, bg = palette.base00 })
      hl(0, "NormalNC", { fg = palette.base05, bg = palette.base00 })

      -- Gutter
      hl(0, "CursorLineSign", { bg = "NONE" })
      hl(0, "CursorLineFold", { bg = "NONE" })
      hl(0, "LineNrAbove", { fg = palette.base03, bg = "NONE" })
      hl(0, "LineNrBelow", { fg = palette.base03, bg = "NONE" })

      -- End of buffer
      hl(0, "EndOfBuffer", { fg = palette.base00 })

      -- Floating windows
      hl(0, "NormalFloat", { bg = palette.base00 })
      hl(0, "FloatBorder", { fg = palette.base03, bg = palette.base00 })

      -- GitSign column
      hl(0, "CursorLineSign", { bg = "NONE" })
      hl(0, "SignColumn", { bg = "NONE" })

      hl(0, "GitSignsAdd", {
        fg = palette.base0B,
        bg = "NONE",
      })

      hl(0, "GitSignsChange", {
        fg = palette.base0C,
        bg = "NONE",
      })

      hl(0, "GitSignsDelete", {
        fg = palette.base08,
        bg = "NONE",
      })

      hl(0, "GitSignsUntracked", {
        fg = palette.base0A,
        bg = "NONE",
      })
    end)

    vim.g.colors_name = "wallust"
  end,
}
