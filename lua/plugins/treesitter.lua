return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false, -- force load at startup (debug mode)
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "lua",
          "python",
          "javascript",
          "html",
          "css",
          "rust",
          "c",
          "cpp"
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
