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
    require('github-theme').compile()
    vim.cmd('colorscheme github_dark')
  end,
},

-- Mostra cores inline
{
  'brenoprata10/nvim-highlight-colors',
  config = function()
    require('nvim-highlight-colors').setup({
      render = 'background', -- ou 'foreground' ou 'first_column'
      enable_named_colors = true,
      enable_tailwind = false,
    })
  end
},

-- 🟥 DASHBOARD COM ASCII (Alpha)
{
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
  "11tL1;fiifi;;;;;;;;;;;;;;;;;;i;;;iiiiiiiiiiii;iiii;iiiiiiiiiiiiiiiiiiiiiiii;;iiii1tfGCGCGGGGGGLCCCCC",
  "LCGt;Lttfii;;;;;;;;;;;;;;;;;;;;;iii;iiiiiiiii;;;i;ii;iiiiiiiiiiiiiiiiiiiii;::;iiiiiittfGLCGCGGGLCCCC",
  "00GLGt1L1fi:;;;;;;;;;;;;;;;;;;;;;iii;iiiiiiiiiiiiii;iii;;;iiiiiii;ii;;;ii;:tt::iiiiii1iff1CCCGCCLLCC",
  "0GG0t1CtCt:;;:;;;;;;;;;;;;;;;;;;;;;;;;;;;iiiiiiii;;;;;:;;iiiii;;;;;::;ii;:1LLt::ii;iiiiititCLLGGCLLL",
  "CCGfiCLCL::;:;;;;;;;;;;;;;;;;;;;;;;;;;;iii;i;ii;:;;:,:;iiii;;:,,::i1ii;::1L0GLf::i;:iiiiiiitLttCGfLL",
  "tt1;LCfL;,;::;:;;;:;;;;;;;;;;;;:;;;;;;;;;;;ii;:,::,,:iii;;:,,,:;1Lfi;::;tL088GLt:;i:;iiiiiii1LftLCfL",
  "i1;tL;;1,::,;::;:,;;;;;;;;;;;;::;;;;;i;:;;i;:,,,,,,:ii;:,,:;itLG0Li::;tfL08888GLi:i::ii;;ii;itLCtftL",
  "11;1;:i:.,,,:,:,,:;:;:;;;;;:;,,;;;;:;;,;;;:,,,,,;t;;;:,:;1tLG080t::;1ffC8888888Ct:::,;ii:ii:;ifCCf;f",
  "ti:i1:i.,,,,,,,,,:,::,;;:;::,,:;;;:;;,:i;:,,,:itLi::,:1fLG0088L;:itffC0888888880L;,,,:i;:;i::i1LCCtt",
  "t1tt1::,,,,,,,,,,,,,,::,,,,,,,::,:,,::;;,ifG08t:itLCCt;;itftGGLLC088888888888888Gi,,,:i;,;;,:;iLLCCf",
  "ttttt,,,,,,,,,,,,,,,,,:;::,,,,,::,:,,::;;,ifG08t:itLCCt;;itftGGLLC088888888888888Gi,,,:i;,;;,:;iLLCCf",
  "11ttt,,,,.,,,,,,,,,,iCG000Li,,,:,,,.,,tCitC888C;LCC0888G1:::1fL088808888888888808f,,,,;,,:,,,:ifLLLL",
  "11111:,,..,,,,,,,,,f0Lt1iC88t,,,,,;1:f8fLG8GCLitt1ffftfff1;:,:ifG8880G88888888888C,,,,:,,,,,,:1ffffL",
  "ft111;.,,:.,,,,,,,L0fttf1t088i,,,18Lf80G0881if1;:;;:ift111ti;:::;ifGCC8088888800Gf,,,,,,,,,:,:fLLLCC",
  "LLft1i,,i;,,,,,,,t8fffG0GtL80i:,t@@L8800800fL0ifi:i1;t0GCtitf1;;;ifLL0080fLft1iii:,,,,,,,,:t,iLfLLLL",
  "LLLLff;:ti,,,,,,,LGffG80f1t00;:1@@808088008GtttC1;fGf1@880t1ffftf08088801:::;1LC0;,,,,,,,,1t:1ffffff",
  "LLLLCCf1Lf:,,,,,,;0fC80ftfL80i;0@@8888800088C1ifLC88CG@@@@CtftfLG88808L1;iitLCG8G:,,,,,,,ift;fffffff",
  "GLLCCCCCLC1,,,,,,,t008Gtf1C08tf@@@880880008080LLCG08@@@@@80CCG0088088L,;;;;tfLGC11,,,,;:;ftttfffffff",
  "8G0888GCLLL;,,,,,,,f@80CfttC@GG@@88808000000088000000088888888880008Git;iti80iL1t;;;.it;tttttttfffff",
  "88@8888GLLCL:,,.,,,,C@080Lf0@@@@@88888080080000888000000088000000080GtfC8GG@Gf1tt1t:if1tttttttttffff",
  "88800000LLLCt,,,,,,,:880800@@@@@@88088000000000000000880000000000080GCfG088GCftttf11ftttttfffttfffff",
  "088GCLfffffff;,,...,,18@888@@@@@@88888880000000000000000000008000008G000GGG00tftttttttttttffffffffff",
  "8800GGCLLfffft,,....,,:tCG8@@@@@@88880008880000000000000000008000008GG888888Ltttttttffffffffffffffff",
  "000G00GGCLLLLL:.,....,,;t1t@@@@@@880000000000000000000000000088888888f000080ffffffffffffffffffffffff",
  "CCCGGGGGGCLfff;,....,,;LCfiC@@@@@8000000800008800000080000080CLLLCGGCC80008CfffffffffffLLLLLLfffffff",
  "CCCCCCCCCLffftt:...,,;C88Lt1@@@@@88800000000800888888800000080CfffLG0800080LLfffffffffLLLCCCCCCLLLLL",
  "CCCCCCCCCCLCLCf,,.,,:C808Lf1f@@@@808080000008G1LCG000888888808800088800088C0CCLLLLffffffLLLLCCCCCCCG",
  "CCCLLLLC0GCLffi;:,.;L8008Ctf1f@@@@888000000808CtLGGCGGGGG0008888880000088LCGCCCCCCCLLLLLLLLLLLCCCCCC",
  "CCCCLC08@@8GCLf1i;iG00008Gttfi10@@8888000000008800000008000GGGGG08080880fLCLLLCCCCCCGCCCCCCCCGGGGGGG",
  "CCCCG888@@@@@@8Gf008000080fttti;L8@@8008800000008880880000888Gft080088LtfLfLLLLLLCCCCCCLLCCLLLLCCCCC",
  "CCCG08@8GCCCG00L8@80000000Ltttt1:iC8@800000000000080GG00880000G88080CfLG00GGGLLLLLLLLLLLLLLLLLLLLLLL",
  "CGGGG0Litft;;;i0@000000008Cttttt1;:iL8@80000000000080CLfLCG8808880GCC088@@@@@0GLLLLLLLLLLLLLLLLLLLLL",
  "GGCLCt;G0Cfft1f808800000000f1ttttt;::;tG8880000000008800GG000880CCG8@@80088888GCLLLLLLLLLLLLLLLLLCG0",
  "80GCC;L8LtffffffLCG00880008C1tttttti;:::1C08880000800008888880CLG8888800G08880CCLLLLLLLLLLLLLLLLCG88",
  "000G118CffffffffffffLCG00880f1ttttttti;;::;tC088800000000880LLG888000GGGG0000GCCCCCCCCCCCCCLLLLLLCCC",
  "CCGfi0GfffffffffffffffffLCG0Gttttttttt1i;;;::;tC088888888GLfLG880000GGGG00000G008888800GCCCLLLCCG000",
  "LC1i0GffffffffffffffffffffffLt1ttttttttt1i;;;;:,;fLCGGCLffLGG0000000000000880000000000880GGGGGG8@@@8",
  "C110Gfffffffffffffffffffffffffffttttttttttt1i;:iG00GLfLCG8888808880000880GGGGGGG000888888888@@@8800G",
  "it8Gftftttffffffffffffffffffffffffftt11tttttti:tLC08888808888888800008800GGGGGGG008888800888880GGCCC",
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
