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
    },
    config = function()
      -- =====================
      -- 1️⃣ Mason setup
      -- =====================
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { 
          "lua_ls",
          "rust_analyzer",
          "clangd"
        },
      })

      -- =====================
      -- 2️⃣ LSP capabilities for cmp
      -- =====================
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local lspconfig = vim.lsp.config

      -- =====================
      -- 3️⃣ Rust LSP
      -- =====================
      lspconfig("rust_analyzer", {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = true,
            check = {
              command = "clippy"
            },
          },
        },
      })
      vim.lsp.enable("rust_analyzer")

      -- =====================
      -- 4️⃣ C/C++ LSP
      -- =====================
      lspconfig("clangd", {
        capabilities = capabilities,
        cmd = { "clangd", "--background-index" },
      })
      vim.lsp.enable("clangd")

      -- =====================
      -- 5️⃣ Autocomplete (nvim-cmp)
      -- =====================
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
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }),
      })

      -- =====================
      -- 6️⃣ Autoformat on save
      -- =====================
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = {"*.rs","*.c","*.cpp"},
        callback = function()
          vim.lsp.buf.format()
        end
      })

      -- =====================
      -- 7️⃣ LSP keymaps
      -- =====================
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buf = args.buf
          local map = vim.keymap.set
          map("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "Go to definition" })
          map("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover info" })
          map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, desc = "Rename symbol" })
          map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Code action" })
        end,
      })
    end,
  },
}
