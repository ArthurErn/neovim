return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-treesitter/nvim-treesitter",
      "sidlatau/neotest-dart",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-dart")({
            command = "C:/Users/arthur.ern/fvm/default/bin/flutter.bat",
            use_lsp = true,
          }),
        },
      })

      vim.keymap.set("n", "<leader>tf", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, { desc = "Run test file" })

      vim.keymap.set("n", "<leader>tn", function()
        require("neotest").run.run()
      end, { desc = "Run nearest test" })

      vim.keymap.set("n", "<leader>tl", function()
        require("neotest").run.run_last()
      end, { desc = "Run last test" })

      vim.keymap.set("n", "<leader>to", function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end, { desc = "Open test output" })

      vim.keymap.set("n", "<leader>ts", function()
        require("neotest").summary.toggle()
      end, { desc = "Toggle test summary" })
    end,
  },
}
