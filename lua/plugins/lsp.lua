return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Hover com borda customizada
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = "rounded",
          width = 60,
          height = 30,
        }
      )

      -- Atalho para hover (normal e insert)
      vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

      -- Setup do Dart LSP com FVM
      require('lspconfig').dartls.setup({
	cmd = { "fvm", "dart", "language-server", "--protocol=lsp" },
      })

      -- Gatilhos para autocompletion do Flutter/Dart
      vim.cmd([[
        augroup flutter_autocomplete
          autocmd!
          autocmd FileType dart inoremap <buffer> . .<C-x><C-o>
          autocmd FileType dart inoremap <buffer> <space> <space><C-x><C-o>
          autocmd FileType dart inoremap <buffer> ( (<C-x><C-o>
        augroup END
      ]])

      -- Comando para sugerir imports Flutter
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dart",
        callback = function()
          vim.api.nvim_set_keymap('n', '<leader>fi', ':lua vim.lsp.buf.execute_command({command = "_flutter.suggestImport", arguments = {vim.fn.expand("%:p")}})<CR>', {noremap = true, silent = true})
        end
      })
    end,
  },
{
  "glepnir/lspsaga.nvim",
  branch = "main",
  dependencies = {
    {"nvim-tree/nvim-web-devicons"},  -- ícones opcionais, mas recomendados
    {"nvim-treesitter/nvim-treesitter"}, -- para realce, opcional mas recomendado
  },
  config = function()
    require('lspsaga').setup({})
vim.keymap.set("n", "<leader>gr", "<cmd>Lspsaga finder<CR>", { desc = "Find references with Lspsaga" })
  end,
},
{
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
}

