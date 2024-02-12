return {
  -- Masonを使ってツールをインストール
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "solargraph",
      },
    },
  },

  -- LuaSnipの設定（<tab>のデフォルト動作を無効化）
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  -- nvim-cmpの設定（<tab>で補完とスニペット）
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji", -- 依存関係にcmp-emojiを追加
      "L3MON4D3/LuaSnip", -- LuaSnipを依存関係に追加
    },
    opts = function(_, opts)
      require("cmp").setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<Tab>"] = function(fallback)
            if require("cmp").visible() then
              require("cmp").select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if require("cmp").visible() then
              require("cmp").select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              require("luasnip").jump(-1)
            else
              fallback()
            end
          end,
        },
        sources = require("cmp").config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }),
      })
    end,
  },

  -- LSP設定（solargraphとtsserver）
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim", -- masonを依存関係に追加
      "jose-elias-alvarez/typescript.nvim", -- typescript.nvimを依存関係に追加
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = false,
      })
      -- LSPのon_attach関数
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        -- 診断メッセージをフローティングウィンドウで表示するキーマッピング
        vim.api.nvim_buf_set_keymap(
          bufnr,
          "n",
          "<Space>fd",
          '<cmd>lua vim.diagnostic.open_float(nil, { focusable = false, border = "rounded", source = "always", header = "", prefix = "" })<CR>',
          opts
        )

        -- その他のLSP関連のキーマッピングや設定...
      end

      require("lspconfig")["solargraph"].setup({
        on_attach = on_attach,
        settings = {
          solargraph = {
            diagnostics = true,
          },
        },
      })

      require("typescript").setup({
        server = {
          on_attach = on_attach,
        },
      })
    end,
  },
}
