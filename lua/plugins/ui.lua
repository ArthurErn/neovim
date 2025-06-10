-- caminho do arquivo: nvim\lua\plugins\ui.lua

return {
-- NVIMTREE
  {
   "nvim-tree/nvim-tree.lua",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
     require("nvim-tree").setup {
				filters = {
    dotfiles = false,         -- mostra arquivos que começam com `.`, como `.env`
    git_ignored = false,      -- mostra arquivos que estão no .gitignore
  },
  update_focused_file = {
    enable = true,
    update_root = false,
  },
				diagnostics = {
    enable = true,
    show_on_dirs = true,       
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
  },}
   end,
  }, 

-- 🟦 BARRA DE TABS (Bufferline)
{
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "tabs",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = true,
        always_show_bufferline = true,
      },
    })
  end,
},

-- 🟩 STATUSLINE BONITA (Lualine)
{
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        section_separators = '',
        component_separators = '',
      }
    })
  end,
},

    {
        "lewis6991/satellite.nvim",
        config = function()
        require('satellite').setup {
            current_only = false,
            winblend = 50,
            zindex = 40,
            excluded_filetypes = {},
            width = 2,
            handlers = {
              cursor = {
                enable = true,
              },
              search = {
                enable = true,
              },
              diagnostic = {
                enable = true,
              },
              gitsigns = {
                enable = true,
              },
              marks = {
                enable = true,
                show_builtins = false,
              },
            },
          }
      end
    },
    {
        'wfxr/minimap.vim',
        build = "cargo install --locked code-minimap",
        cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
        config = function()
        vim.cmd("let g:minimap_width = 10")
        vim.cmd("let g:minimap_auto_start = 1")
        vim.cmd("let g:minimap_auto_start_win_enter = 1")
      end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    {
   	"nvim-tree/nvim-web-devicons",
   	config = function()
   	 require("nvim-web-devicons").setup({
    	  default = true
   	 })
      end
    },

{
  "projekt0n/github-nvim-theme",
  name = 'github-theme',
  lazy = false,
  priority = 1000,
  config = function()
    require('github-theme').setup({})
    vim.cmd('colorscheme github_dark')
  end,
},


-- 🟥 DASHBOARD COM ASCII (Alpha)
{
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣟⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣶⡾⠾⢯⣭⣏⡛⠓⠲⢦⣿⡿⠟⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢤⣤⣀⣤⡤⠴⠞⠋⢁⣀⡤⠴⠶⠶⠂⠀⠀⠉⠻⠶⠤⠈⠻⣄⣌⢻⣐⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢦⣀⣀⣀⡴⠒⠋⢀⣀⡀⠀⠀⠀⠀⣀⠀⠀⠉⢳⣄⢀⠈⠿⣾⣿⣿⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡿⠿⢀⡤⠞⠉⠁⠀⠀⠀⠀⠀⠈⠙⠓⢦⣄⠹⣿⣿⣧⠘⣿⠋⠙⠿⢿⣗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⢀⠸⣶⣄⠀⠀⠀⠀⠀⢀⣴⠟⢋⣤⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢬⡷⣽⣿⡌⣷⣟⡀⠀⣨⣽⣯⡷⠦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠘⡆⢸⣿⡇⠀⠀⠈⠛⣻⣿⣧⠟⠁⠀⠀⠀⠀⠀⠀⣀⡤⠶⠋⠉⠀⠀⠀⠀⠀⠚⠽⠟⠋⠉⠈⠉⢳⣄⠈⠙⠶⣦⣄⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⢀⡀⠀⠀⢱⣼⣿⣇⣠⠤⢴⣾⡿⠟⠁⠀⠀⠀⠀⠀⣀⡴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀⠈⠙⢦⡁⠤⣙⠻⣿⡆⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⢀⣼⣷⢤⣄⢸⡿⠋⠁⠈⠛⣿⣵⣶⠀⠀⠀⠀⠀⢀⡼⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠏⠀⠀⠀⠀⡄⠀⠀⠀⠈⢮⢿⣦⣿⣿⠛⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⢀⣾⠏⠁⢀⣿⡟⠀⢀⣀⣠⣼⣻⣽⡁⠀⠀⠀⣠⡴⢋⣤⠞⣠⡀⠀⠀⠀⠀⠀⠀⠀⢀⣼⢯⠀⠀⠀⠀⠀⠢⣦⡄⠀⠳⡄⠀⠹⣎⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⢀⣼⣿⠁⣰⣾⣽⣯⣤⣤⣈⠿⠿⠿⣿⠃⢀⣤⣾⠿⢚⣿⠋⣠⡟⠀⠀⠀⠀⠀⠀⠀⣠⡞⡇⠘⠀⠀⠀⠀⠀⠀⠘⣟⣆⠀⠙⡄⠄⣿⠀⣠⣴⣿⠀⠀⠀⠀⠀⠀",
  "⠀⣸⠃⠹⣿⣿⣿⣿⣧⡀⠈⢻⡿⣇⣴⠏⣠⠿⠁⠀⢠⣿⣧⠞⡿⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⣿⡇⠀⠀⠘⡆⠀⠀⠀⢸⣟⡜⢆⠙⣸⡿⣹⠷⢿⣧⣀⠀⠀⠀⠀⠀",
  "⠀⢿⡀⠀⢹⡿⠛⠿⣍⠛⠂⠀⣷⣾⡿⣿⡯⢀⣠⣶⣿⣿⡏⢰⠇⠀⠀⠀⢀⣠⣾⣋⠀⠀⠀⣿⢿⡀⠰⣄⣿⠀⠀⠀⠠⣿⣦⣌⡀⣿⣷⡇⠀⠀⠈⠛⢧⡀⠀⠀⠀",
  "⠀⠈⢻⣸⡄⡇⣀⣠⠼⠷⡄⠀⣿⠐⠶⠿⣿⣿⣿⣿⣧⣌⠁⣿⢀⡞⠀⢰⣿⡟⠛⠛⢛⡿⠿⣶⣤⣷⡄⢿⢿⣄⠀⠀⢦⣽⡀⠀⣷⡿⠋⠀⠀⠠⢄⣤⣤⣽⣦⠀⠀",
  "⠀⣠⣴⣿⣷⡟⠋⣦⡀⠀⢻⣴⠃⠀⠀⠀⠛⢿⣿⡅⣿⣿⣷⣿⣾⠁⣰⠟⣾⣿⣿⣶⣦⣕⠀⠈⠙⣿⡟⠾⣿⣿⣳⣦⣿⡿⠽⠿⠟⠷⣥⠀⠀⠐⢶⣿⣧⣴⡝⠀⠀",
  "⢸⢟⣩⣿⡿⠀⠀⣇⢳⡀⠛⠁⠀⠀⠀⠀⠀⡾⢻⣧⠙⠻⢿⠛⣻⡷⠃⠀⠀⢸⣿⣯⡄⢹⡷⠆⠀⢹⡇⠀⣾⣿⣿⣿⡟⠋⠉⠀⣀⡴⠟⠀⠀⠀⢠⣿⠟⠉⠀⠀⠀",
  "⢀⣿⡿⠟⠁⠀⠀⠙⠮⠷⠀⠀⠀⠀⠀⠀⣼⠇⠘⡇⠀⠀⠃⠐⠋⠀⠀⠀⠠⣌⠻⠿⠦⠈⠀⠀⠀⢸⡇⠀⢹⣿⣾⣋⣒⣭⣶⠚⠿⣄⣴⣤⣄⣴⡾⠟⠀⠀⠀⠀⠀",
  "⠸⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⡇⠀⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠘⣿⣿⡿⣅⣀⡙⢳⣤⠤⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠹⢯⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣇⠀⢸⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣨⡇⠀⠀⣿⣿⢀⣶⣿⡍⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⣨⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣧⢿⡄⠀⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⡞⠋⣇⢠⠀⣽⣽⣷⣽⡄⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⡀⢸⠙⠮⢷⡀⠀⠀⠀⠀⣀⣤⠴⠖⠋⢉⡴⠃⢠⣿⡟⢠⡿⣹⡿⡾⢷⣦⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣧⢸⣻⡿⣿⣯⣛⣶⣿⠉⠅⠀⠀⣀⡰⠋⠀⠀⡾⠋⣟⣼⠹⡟⣟⠗⣶⠈⠙⠉⠻⠿⢷⣶⣦⣄⣀⡀⠀⠀⠀⠀",
  "⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⡿⠋⠈⣿⣿⣿⣷⣽⣿⣿⠋⠙⡆⠀⠀⠀⠀⠀⠀⠀⢠⠇⣸⡿⡷⠀⠀⣿⠈⢻⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⣷⣤⡀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⢟⡿⠋⠀⠀⢰⣿⣿⣿⣿⣿⣿⠃⠀⠀⡇⠀⠀⠀⠀⠀⠀⢀⡞⠀⠉⠀⠀⠀⢀⡏⠀⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣷⣄",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠞⢡⡞⠁⢠⠀⠀⠈⣿⣿⡏⢸⣿⣿⣦⣤⣤⣅⢠⠀⠀⠀⠀⣠⡾⠁⠀⣀⠀⠀⠀⢸⡇⡄⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⣿",
  "⠀⠀⠀⠀⠀⠀⣠⣶⠞⠉⠀⠀⠘⠁⠀⢸⡀⠀⠀⠻⣿⡀⠀⣿⣿⠓⠦⣄⣉⠙⠲⠀⠀⡰⠿⠛⠉⠉⠁⠀⠀⠀⣸⠀⠇⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠋",
  "⠀⠀⠀⠀⠀⠀⠻⣿⠛⠦⠀⠀⠀⠀⠀⠸⠇⡆⠀⠀⢿⡇⠀⣿⣿⡄⡈⠙⠺⠍⠓⣒⣒⡒⠒⠒⠲⠶⠦⠤⠴⢶⡏⠀⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠁⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠈⢳⣄⠀⠀⠀⠀⠀⠀⢰⠇⠀⠀⢸⣷⠀⢹⡟⣿⡿⣿⣆⠀⠀⠀⠀⠀⠈⠉⠛⠂⠒⣒⣠⡾⠁⠀⡼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⣄⠀⠀⠀⠀⣿⠀⠀⠀⠀⣿⡤⠀⠀⠸⣧⠀⠉⢷⡀⠀⣤⠖⠚⠒⠒⠚⠉⠉⠁⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣤⡀⣸⡏⠀⠀⠀⠀⠸⣇⣤⣿⡄⠹⣷⣀⡈⢧⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠶⠋⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣇⡀⠀⠀⠀⠀⣿⡍⢘⣷⣽⡟⠙⣿⠀⣠⠖⠴⠦⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠓⠦⢄⣀⣸⣿⣼⠋⢸⣧⣰⣾⠀⠀⠀⢀⠀⠒⠲⡹⣆⢀⣀⠤⠤⠒⣋⡭⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠻⠆⠼⣿⣿⣿⡄⠠⡄⢀⣬⢽⣦⣻⢈⠷⠖⠒⠛⠉  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

    dashboard.section.buttons.val = {
      dashboard.button("f", "🔍  Buscar arquivos", ":tabnew<CR>:Telescope find_files<CR>"),
      dashboard.button("r", "🕘  Recentes", ":tabnew<CR>:Telescope oldfiles<CR>"),
      dashboard.button("q", "⏻  Sair", ":qa<CR>"),
    }
    alpha.setup(dashboard.opts)
  end
},

}
