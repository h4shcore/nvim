return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      -- size = function(term)
      --   if term.direction == "horizontal" then
      --     return 10
      --   elseif term.direction == "vertical" then
      --     return vim.o.columns * 0.3
      --   end
      -- end,

      -- dynamic size
      size = function(term)
        if term.direction == "horizontal" then
          return math.floor(vim.o.lines * 0.25) -- 25% of screen
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.25)
        end
      end,

      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
      close_on_exit = true,
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- Horizontal terminal
    local hterm = Terminal:new({ direction = "horizontal" })
    vim.keymap.set("n", "<leader>h", function()
      hterm:toggle()
    end, { desc = "Horizontal Terminal" })

    -- Vertical terminal
    local vterm = Terminal:new({ direction = "vertical" })
    vim.keymap.set("n", "<leader>v", function()
      vterm:toggle()
    end, { desc = "Vertical Terminal" })

    -- Terminal mode escape
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
  end,
}
