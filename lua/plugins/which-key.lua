return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({
      preset = "modern",
    })

    -- Apenas registrar os grupos principais - removendo todos os conflitos
    wk.add({
      { "<leader>f", group = "🔍 Find/Flutter" },
      { "<leader>h", group = "🎯 Harpoon" },
      { "<leader>m", group = "🎯 Multi-cursor" },
      { "<leader>c", group = "🤖 Claude/Code" },
      { "<leader>g", group = "🌿 Git" },
      { "<leader>r", group = "🔄 Refactor" },
      { "<leader>t", group = "💻 Terminal" },
    })
  end,
}