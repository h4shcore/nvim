vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "X",
      [vim.diagnostic.severity.WARN]  = "!",
      [vim.diagnostic.severity.INFO]  = "i",
      [vim.diagnostic.severity.HINT]  = "*",
    },
  },

  underline = true,
  virtual_text = false,
  virtual_lines = false,
  update_in_insert = false,
  severity_sort = true,
})

-- Remove the gray background color from diagnostics
local diagnostic_groups = { "Error", "Warn", "Info", "Hint" }
for _, type in ipairs(diagnostic_groups) do
  vim.api.nvim_set_hl(0, "DiagnosticSign" .. type, { bg = "NONE" })
  vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. type, { bg = "NONE" })
end
