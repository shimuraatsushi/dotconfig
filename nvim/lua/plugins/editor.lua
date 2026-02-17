return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "solargraph" },
      })

      vim.lsp.enable("solargraph")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local map_opts = { noremap = true, silent = true, buffer = bufnr }

          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, map_opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, map_opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, map_opts)
          vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, map_opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, map_opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, map_opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, map_opts)
          vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, map_opts)
        end,
      })
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "ruby",
        "terraform",
        "tsv",
        "toml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "ruby",
      })
    end,
  },
}
