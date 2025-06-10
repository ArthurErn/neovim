return {
         {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 3000,
        },
        formatters_by_ft = {
          dart = { "custom_dart_format" },
          markdown = { "markdownlint" },
        },
        formatters = {
          custom_dart_format = {
            command = "C:\\tools\\dart-sdk\\bin\\dart.bat", -- ajuste se necessário
            args = { "format", "--line-length=160", "--fix", "$FILENAME" },
            stdin = false,
            cwd = require("conform.util").root_file({ "pubspec.yaml" }),
          },
        },
      })

      -- Mapeamento para formatar com Alt+f ou como alternativa, <leader>f
      vim.keymap.set({ "n", "v", "i" }, "<M-f>", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 3000,
        })
      end, { desc = "Formatar arquivo com conform.nvim" })

      vim.keymap.set("n", "<leader>f", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 3000,
        })
      end, { desc = "Formatar arquivo com conform.nvim" })
    end,
  },
  {
  'wa11breaker/flutter-bloc.nvim',
  dependencies = {
    "nvimtools/none-ls.nvim",
  },
  ft = "dart",
  config = function()
    require('flutter-bloc').setup({
      bloc_type = 'default',
      use_sealed_classes = false,
      enable_code_actions = true,
    })
  end,
}
}