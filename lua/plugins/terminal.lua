return {
  -- Terminal integration avançado
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15, -- altura do terminal horizontal
        open_mapping = [[<c-\>]], -- Ctrl+\ para abrir/fechar
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal", -- sempre horizontal
        close_on_exit = true,
        shell = vim.o.shell,
        winbar = {
          enabled = false,
          name_formatter = function(term)
            return term.name
          end
        },
      })

      -- Configurações de keymaps para dentro do terminal
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) -- ESC para sair do modo terminal
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts) -- Navegação entre janelas
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      -- Autocmd para aplicar keymaps quando terminal abrir
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

      -- Keymaps personalizados para diferentes tipos de terminal
      local Terminal = require('toggleterm.terminal').Terminal

      -- Terminal flutuante padrão
      local float_term = Terminal:new({
        direction = "float",
        float_opts = {
          border = "double",
        },
        count = 1,
      })

      -- Terminal horizontal na parte inferior
      local horizontal_term = Terminal:new({
        direction = "horizontal",
        size = 15,
        count = 2,
      })

      -- Terminal vertical à direita
      local vertical_term = Terminal:new({
        direction = "vertical",
        size = vim.o.columns * 0.4,
        count = 3,
      })

      -- Terminal para Flutter run (usando seu comando exato)
      local flutter_term = Terminal:new({
        cmd = "fvm flutter run -d windows --dart-define-from-file=envs/.env",
        dir = "git_dir",
        direction = "horizontal",
        size = 15,
        close_on_exit = false,
        count = 4,
        on_open = function(term)
          vim.cmd("startinsert!")
        end,
      })

      -- Terminal para Git
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double",
        },
        count = 5,
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })

      -- Funções para abrir cada tipo de terminal
      function _FLOAT_TERM_TOGGLE()
        float_term:toggle()
      end

      function _HORIZONTAL_TERM_TOGGLE()
        horizontal_term:toggle()
      end

      function _VERTICAL_TERM_TOGGLE()
        vertical_term:toggle()
      end

      function _FLUTTER_TOGGLE()
        flutter_term:toggle()
      end

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      -- Apenas keymaps para terminais horizontais (não invasivos)
      vim.keymap.set("n", "<leader>th", "<cmd>lua _HORIZONTAL_TERM_TOGGLE()<CR>", {desc = "Terminal horizontal"})
      vim.keymap.set("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {desc = "LazyGit"})
      
      -- Flutter run - mantém o mesmo keymap que você já usa
      vim.keymap.set("n", "<leader>fr", "<cmd>lua _FLUTTER_TOGGLE()<CR>", {desc = "Flutter Run"})
      
      -- Terminal rápido horizontal com Ctrl+\ (não invasivo)
      vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm direction=horizontal size=15<CR>", {desc = "Toggle Terminal"})
      vim.keymap.set("t", "<C-\\>", "<cmd>ToggleTerm<CR>", {desc = "Toggle Terminal"})
    end,
  },
}