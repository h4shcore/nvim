return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "stevearc/conform.nvim",
    },

    config = function()
      -- Mason
      require("mason").setup()

      -- LSP
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "clangd",
        },
      })

      -- Capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Rust
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = true,
            check = { command = "clippy" },
          },
        },
      })
      vim.lsp.enable("rust_analyzer")

      -- C/C++
      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = { "clangd", "--background-index" },
      })
      vim.lsp.enable("clangd")

      -- Nix
      vim.lsp.config("nil_ls", {
        capabilities = capabilities,
        settings = {
          ["nil_ls"] = {
            formatting = {
              command = { "alejandra" },
            },
          },
        },
      })
      vim.lsp.enable("nil_ls")

      -- Haskell
      vim.lsp.config("hls", {
        capabilities = capabilities,
      })
      vim.lsp.enable("hls")

      -- Completion
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })

      -- Formatting
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          nix = { "alejandra" },
          rust = { "rustfmt" },
          c = { "clang-format" },
          cpp = { "clang-format" },
          haskell = { "ormolu" },
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.lua", "*.nix", "*.rs", "*.c", "*.cpp", "*.hs" },
        callback = function()
          require("conform").format({ lsp_fallback = true })
        end,
      })

      -- Keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buf = args.buf
          local map = vim.keymap.set

          map("n", "gd", vim.lsp.buf.definition, { buffer = buf })
          map("n", "gk", vim.lsp.buf.hover, { buffer = buf })
          map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf })
          map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf })
        end,
      })
    end,
  },
}
