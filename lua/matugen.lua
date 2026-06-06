 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#121315',
    base01 = '#1e2021',
    base02 = '#292a2c',
    base03 = '#8d9197',
    base04 = '#c3c7cd',
    base05 = '#e3e2e4',
    base06 = '#e3e2e4',
    base07 = '#e3e2e4',
    base08 = '#ffb4ab',
    base09 = '#debcdf',
    base0A = '#bec7d4',
    base0B = '#aec9e6',
    base0C = '#debcdf',
    base0D = '#aec9e6',
    base0E = '#bec7d4',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e3e2e4',          bg = '#121315' })
  hi('TelescopeBorder',         { fg = '#8d9197',             bg = '#121315' })
  hi('TelescopePromptNormal',   { fg = '#e3e2e4',          bg = '#121315' })
  hi('TelescopePromptBorder',   { fg = '#8d9197',             bg = '#121315' })
  hi('TelescopePromptPrefix',   { fg = '#aec9e6',             bg = '#121315' })
  hi('TelescopePromptCounter',  { fg = '#c3c7cd',  bg = '#121315' })
  hi('TelescopePromptTitle',    { fg = '#121315',             bg = '#aec9e6' })
  hi('TelescopePreviewTitle',   { fg = '#121315',             bg = '#bec7d4' })
  hi('TelescopeResultsTitle',   { fg = '#121315',             bg = '#debcdf' })
  hi('TelescopeSelection',      { fg = '#e3e2e4',          bg = '#292a2c' })
  hi('TelescopeSelectionCaret', { fg = '#aec9e6',             bg = '#292a2c' })
  hi('TelescopeMatching',       { fg = '#aec9e6',             bold = true })
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
