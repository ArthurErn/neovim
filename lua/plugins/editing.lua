-- caminho do arquivo: nvim\lua\plugins\editing.lua

return {
  -- Autopairs - fecha parênteses, chaves automaticamente
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- usa treesitter
        ts_config = {
          lua = {'string', 'source'},
          javascript = {'string', 'template_string'},
          java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
          map = '<M-e>',
          chars = { '{', '[', '(', '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
          offset = 0,
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          highlight = 'PmenuSel',
          highlight_grey = 'LineNr'
        },
      })
      
      -- Integração com nvim-cmp
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
  },
{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true, -- mostra ícones na coluna
    keywords = {
      TODO = { icon = " ", color = "info" },
      FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },
  },
  event = "BufReadPost",
},
{
  "ThePrimeagen/harpoon",
  branch = "harpoon2", -- ou remova se estiver usando a v1
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = "Adicionar arquivo ao Harpoon" })

    vim.keymap.set('n', '<leader>hh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Abrir menu rápido do Harpoon" })
  end,
},


  -- Multi-cursor como VSCode
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    event = "VeryLazy",
    init = function()
      -- Configurações do vim-visual-multi
      vim.g.VM_theme = 'iceblue'
      vim.g.VM_highlight_matches = 'underline'
      
      -- Keymaps personalizados
      vim.g.VM_maps = {
        ['Find Under'] = '<C-d>',           -- Ctrl+D para adicionar cursor na próxima ocorrência
        ['Find Subword Under'] = '<C-d>',   -- Mesmo para subpalavras
        ['Find Next'] = '<C-d>',
        ['Find Prev'] = '<C-S-d>',
        ['Skip Region'] = '<C-x>',          -- Pular região atual
        ['Remove Region'] = '<C-x>',
        ["Undo"] = 'u',
        ["Redo"] = '<C-r>',
        ["Add Cursor Down"] = '<C-S-j>',    -- Adicionar cursor para baixo
        ["Add Cursor Up"] = '<C-S-k>',      -- Adicionar cursor para cima
        ["Select All"] = '<C-S-l>',         -- Selecionar todas as ocorrências
        ["Start Regex Search"] = '\\/',
        ["Add Cursor At Pos"] = '\\\\',
        ["Visual Regex"] = '\\/',
        ["Visual All"] = '\\A', 
        ["Visual Add"] = '\\a',
        ["Visual Find"] = '\\f',
        ["Visual Cursors"] = '\\c',
      }
      
      -- Configurações adicionais
      vim.g.VM_quit_after_leaving_insert_mode = 0
      vim.g.VM_live_editing = 1
      vim.g.VM_set_statusline = 2
      vim.g.VM_silent_exit = 1
    end,
    config = function()
      -- Comandos personalizados para facilitar o uso
      vim.keymap.set('n', '<leader>ma', '<Plug>(VM-Select-All)<Tab>', { desc = 'VM Select All' })
      vim.keymap.set('n', '<leader>mr', '<Plug>(VM-Start-Regex-Search)', { desc = 'VM Regex Search' })
      vim.keymap.set('n', '<leader>mp', '<Plug>(VM-Add-Cursor-At-Pos)', { desc = 'VM Add Cursor' })
    end,
  },

  -- Comentários inteligentes
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    opts = {
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        line = 'gcc',
        block = 'gbc',
      },
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
      },
      mappings = {
        basic = true,
        extra = true,
      },
      pre_hook = nil,
      post_hook = nil,
    },
  },

  -- Surround - manipular aspas, parênteses
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          insert = "<C-g>s",
          insert_line = "<C-g>S",
          normal = "ys",
          normal_cur = "yss",
          normal_line = "yS",
          normal_cur_line = "ySS",
          visual = "S",
          visual_line = "gS",
          delete = "ds",
          change = "cs",
          change_line = "cS",
        },
      })
    end
  },
}