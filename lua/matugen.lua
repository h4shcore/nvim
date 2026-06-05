 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1d100d',
    base01 = '#2a1c18',
    base02 = '#362622',
    base03 = '#a98a81',
    base04 = '#e2bfb6',
    base05 = '#f7ddd6',
    base06 = '#f7ddd6',
    base07 = '#f7ddd6',
    base08 = '#ffb4ab',
    base09 = '#ebc24d',
    base0A = '#ffb5a0',
    base0B = '#ffb5a0',
    base0C = '#eac24d',
    base0D = '#ffb5a0',
    base0E = '#ffb5a0',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f7ddd6',          bg = '#1d100d' })
  hi('TelescopeBorder',         { fg = '#a98a81',             bg = '#1d100d' })
  hi('TelescopePromptNormal',   { fg = '#f7ddd6',          bg = '#1d100d' })
  hi('TelescopePromptBorder',   { fg = '#a98a81',             bg = '#1d100d' })
  hi('TelescopePromptPrefix',   { fg = '#ffb5a0',             bg = '#1d100d' })
  hi('TelescopePromptCounter',  { fg = '#e2bfb6',  bg = '#1d100d' })
  hi('TelescopePromptTitle',    { fg = '#1d100d',             bg = '#ffb5a0' })
  hi('TelescopePreviewTitle',   { fg = '#1d100d',             bg = '#ffb5a0' })
  hi('TelescopeResultsTitle',   { fg = '#1d100d',             bg = '#ebc24d' })
  hi('TelescopeSelection',      { fg = '#f7ddd6',          bg = '#362622' })
  hi('TelescopeSelectionCaret', { fg = '#ffb5a0',             bg = '#362622' })
  hi('TelescopeMatching',       { fg = '#ffb5a0',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
