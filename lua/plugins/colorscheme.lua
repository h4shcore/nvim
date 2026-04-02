return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox")

      -- 🔥 FINAL override (after everything)
      vim.schedule(function()
        local groups = {
          "SignColumn",
          -- "LineNr",
          -- "CursorLineNr",
          "FoldColumn",

          "DiagnosticSignWarn",
          "DiagnosticSignError",
          "DiagnosticSignInfo",
          "DiagnosticSignHint",
        }

        for _, group in ipairs(groups) do
          vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
      end)
    end,
  },
}
