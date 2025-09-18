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
        vim.cmd("let g:minimap_auto_start = 0")
        vim.cmd("let g:minimap_auto_start_win_enter = 0")
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
"                                                                  ;;;;;;;;;;;                                                                           ",
"                                                           ;;;;;;+xXXXXXXXXx+;;;;;;                                                                     ",
"                                                        ;;;+X&&&&&&&&&&&&&&&&&&&&$+;;;                                                                  ",
"                                                     ;;;X&&&&&&$$$$$$$$$$$$$$$&&&&&&&x;;;                                                               ",
"                                                   ;;;$&&&&$$$$$$$$$$$$$$$$$$$$$$$$&&&&$;;;                                                             ",
"                                                  ;;$&&&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$&&&$;;                                                            ",
"                                                ;;x&&&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$&&&+;                                                           ",
"                                               ;;$&&&&&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$&&+;;                                                         ",
"                                              ;;$&&&&&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$&&;;                                                         ",
"                                             ;;;$&&&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$&$;;                                                        ",
"                                            ;;;+&&&$$$$$$$$$$$X;.   .;xX$$$$$$$$$$$$$$$$$$$$&&+;                                                        ",
"                                             ;;$&&&$$$$$$$$$+            :X$$$$$$$$$$$$$$$$$$&X;;                                                       ",
"                                            ;;x&&&$$$$$$$$$:               .+$$$$$$$$$$$$$$$$&$;;                                                       ",
"                                            ;;$&&$$$$$$$$$:   .;X&&$X;..      x$$$$$&$$$$&&X&&&;;                                                       ",
"                                            ;;&&&$$$$$$$$+       :x&$$&&+:.    :&$$&&$$&&&$.;&&;;                                                       ",
"                                           ;;x&&$$$$$$$$$:       :$$;+x$&&X::    X&&&&&&x;&;+&$;;                                                       ",
"                                           ;;$&&$$$$$$$$X        :X$:x&&&&X&&$x+x$&&&&&&++&:$&X;;                                                       ",
"                                           ;;&&&$$$$$$$$X         :$$:;;;::$&$xX&&X;;+$&&&&&&&&$;;;                                                     ",
"                                           ;;&&&$$$$$$$$$.         :;x&&&&$++x&&+;++;;;;;;;;;;+&&X;;                                                    ",
"                                           ;+&&&$$$$$$$$$+           .;;;+$&&&+;;;;;;;;;;;;;;;;;&&x;;                                                   ",
"                                           ;+&&&$$$$$$$$$X           ;&&$X;;;;;;;;;;;;;;;;;;;;;;X&X;;                                                   ",
"                                           ;+&&&$$$$$$$$$$;         ;&$;;;++Xx;;;+++X$&&&&&$x+;;$&+;                                                    ",
"                                           ;;&&&$$$$$$$$$$$:        ;&X;+&&&&&&&&&&$$Xx+++$&&&&$&X;;                ;;;;;;;;;;;;;;;;                    ",
"                                          ;;x&&&$$$$$$$$$$$$:        $&x++++++++++++++++$&&&&;X&+;;  ;;;;;;;;;;;;;;++xXX$$&&&&&&&&&+;                   ",
"                                        ;;+&&&&&&&$$$$$$$$$$$:       .X&&X+++++++++++X&&$+X&$;;;;;;;++xXX$$&&&&&&&&&&&&&&&$$$$$$$&&X;;                  ",
"                                      ;;;$&&&&&&&&&&&&$$$$$$$$+        :x&&&&$$$$&&&&$xxXX&&&&&&&&&&&&&&&&&$$$$$$$$$$$$$$$$$$$$$$&&;;                   ",
"                                     ;;X&&&&$$$$$$$$$$$$$$$$$$$X:       .::;+XXXXx+;;$&&&&&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$&&$;;                   ",
"                                    ;;$&&&$$$$$$$$$$$$$$$$$$$$$;           .::::::;;$&&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$&&X;;                   ",
"                                  ;;;&&&$$$$$$$$$$$$$$$$$$$$$:                     .&&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$&&;;                    ",
"                                  ;+&&&$$$$$$$$$$$$$$$$$$$$X.                      ;&&$$$$$$$$$$$$$$$$$$$$$$.X$$$$$$$$$$$$$$$$$&&X;;                    ",
"                                 ;+&&&$$$$$$$$$$$$$$$$&$$$$.                       $&$$$$$$$$$$$$$$$$X;$$$$:+$+.:X$$$$$$$$$$$$$&&+;                     ",
"                                ;;$&&$$$$$$$$$$$$$$$$&&$$X                        :&&$$$$$$$$$$$$$X.:X$$$$:;$$$$$+. ;$$$$$$$$$$&&;;                     ",
"                               ;;$&&$$$$$$$$$$$$$$$$$&$$$+.::;+++;:..             +&&$$$$$$$$$$$::X$$$$$$+:$$$$$$X:.X$$$$$$$$$&&X;;                     ",
"                               ;+&&&$$$$$$$$$$$$$$$&&&$&&&&&&&&&&&&&&&&x:         $&$$$$$$$$$$$;.:X$$$$$x.$$$$X::X$$$$$$$$$$$$&&+;                      ",
"                              ;;X&&$$$$$$$$$$$$$$$&&&&&&$$$$$$$$$$$$X$$&&&+:     :&&$$$$$$$$$$$$$$x:.X$$.$$$$;x$$$$$$$$$$$$$$&&$;;                      ",
"                              ;;&&&$$$$$$$$$$$$$&&&&&$$$$$$$$$$$$$$$$$$$$&&$+;::;X&&$$$$$$$$$$$$$$$$$$$.x$$$$$$$$$$$$$$$$$$$$&&X;;                      ",
"                              ;+&&&$$$$$$$$$$$&&&$$$$$$$$$$$$$$$$$$$$$$$$$$&&+++x&&$$$$$$$$$$$$$$$$$$$$X$$$$$$$$$$$&&$$$$$$$$&&;;                       ",
"                             ;;x&&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$&&&&&$$$$$$&&&&&&&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$&&&&&&&&&$$$&&$;;                       ",
"                    ;;;;;;;;;;;X&&$$$$$$$$$$$$$$$$$$$$$$$$$$&&&&&&&&&&&&&&&&&&$$&&&$$$$$$$$$$$$$$$$$$$$$$$$$$$&&&&$$$$&&&$&&&&x;                        ",
"                    ;+$$$$$XXXX$&&&$$$$$$$$$$$$$$$$$$$$$$$&&&&&&&&&&$$$$$$&&&&$$&&$$$$$$$$$$$$$$$$$$$$$$$$$$$$&&$$$$$&&&&&&&$;;;                        ",
"                   ;;X&&&&&&&&&&&&&&$$$$$$$$$$$$$$$$$$$$&&&&&&&&&&&&&&&&&&&$$$$$&&$$$$$$$$$$$$$$$$$$$&&&&&&&&&&$$$$&&&$;;;;;;;;;                        ",
"                   ;;$&$:;;;;;;;;.+&&&&$$$$$$$$$$$$$$$&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$$$$$$$&&&&&&&&&&&&&&&&&&&$$$&&&&&&&&&&&&&&+;                        ",
"                   ;+&&;;++++++++++:&&&&&&&&&$$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&x+++++;;;;;:;&&X;;                       ",
"                  ;;&&$.++++++++++;;...::::;;;;+x;;+:X&.+++:X.;;;;++++;;X:++++++++;:$:;;+++++++:&&&&&&&&;;:::.$x;++++++++++:+&&;;                       ",
"                  ;+&&X:+++.$$:+++:X.+++++++++;+:+++.$$.+++:X:++++++++;;X:+++++++++:$:+++++++++:&&&&&&&&+:+++;X$.+++++++++++.&&X;;                      ",
"                 ;;X&&;++++;&X;+++:X;++;;::+++:x.+++.&$:+++:X:::.+++:::+X:++;:+;;++:$;+++:;::++;x&&&&&&&$.++++;&:;+++:$+:+++:X&&;;                      ",
"                 ;;&&$:+++;X&:;++;+;+++:$$:+++.x:++;;&$:+++;&&&X:++;+&&&X:++;:&X:++;X;+++:$X:++;:&&&&&&&&.++++:X:;+++;$&:++++:&&+;                      ",
"                ;;+&&+;+++:$$.+++:x.+++ &X;+++;+;++;+&X;+++;&&&X:++;+&&&X:++;.&X:++;x;;++;:+.+++ &&$$$$&&+;+++:x.++++;:+XXXXXX&&&;;                     ",
"                ;;X&&:+++;:&+;+++.+:++;;&++++;x;+++;X&++++;+&&&X:++;x&&&X:++;.&X:++;++;+++++++;:+&&;;++;+$:+++;;+:+++++++;.X&&&&&x;                     ",
"                ;;$&&:+++:X&;+++;;;;++;$&;+++:$:+++:$&;+++;X&&&x;++;X&&&x:+++ &X:+++;+;+++;+++++:X&+;;;;+$:++++:&+;+++++++;+&&X;;;;;                    ",
"               ;;+&&;;+++:&$:+++:$:+++:&$:+++:X:+++:$&:+++:X&&&+;++;X&&&x:+++ &$:+++:x:++;:X::++++&&&&&&&&:;+++:$$:++++:x:::&&&;;                       ",
"               ;;$&$ +++;;&+;+++:X:+++:&x:++;:+;+++:&$.+++:$&&&+;++;$&&&x:+++ $$.+++.X:+++.&X:+++;&&&&&&&&x:+++;+&:++++:$&X$&&&X;;;                     ",
"               ;;&&X:+++:X&:+++;:;;++;;&;;++;;:;++;:&X:+++ $&&&;+++:$&&&x:+++ $$.+++.X.+++.$$:+++:&&&&&&&&&:++++.&+;+++;x&X::;$&&&X;;                   ",
"               ;+&&+++++.&$:+++:+.+++:+X:+++:X:+++;...:+++ $&&&;+++:$&&&x:++++++++++.X.+++:X$.+++:X&&&&&&&&:++++:$X.++++;&&:+++:x&&+;                   ",
"              ;;$&&:++++;++++++:$:++++++++++:$:++++++++++; &&&&:+++:$&&&x:++++++++++:X.+++:X&:;++;+&&&&&&&&+;+++;x& ;++++++;++++.&&$;;                  ",
"              ;;&&X:+++++++++;:$x;++++++++++:$:;::::.....:;&&&&XXXXX&&&&&&&&&&&&&$$$$$Xx++;X&X;;::+&&&&&&&&X:++++;&;;+++++++++++:X&&+;                  ",
"             ;;x&&;;+++;;::.+&&&++xX$$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$&$x+;:..::;;++;;&&x;                  ",
"             ;;X&&$$&&&&&&&&&&&&&&&&&&&&&&&&&$&&&&$$&X+$$;;;;;$&&&&;;;;;X$;;;;$+;X&$;$&;;;;+&X;x&Xx&$X$&$$&&&&&&&&&&&&&&&&&&&&&&&$&&$;;                 ",
"             ;;$&&&&$$$Xx++;;;;;;;;&&x;;;;;$;;$&&x;x&+;$X;;&X;X&&&&;;X$;+$;;&&&+;;+$;XX;+&X;X$;+&+;XX;;&+;x&X;$&&;;;;;;;++XX$$$&&&&&&+;                 ",
"             ;;;;;;;;;;;;;++xX$$$;+&&;;&X;+x;;&&&+;X&;;&x;;X;;$&&&&;;xx;+$;;;;$+;+;;;X$;+&$$$&;;&X;+$;;$x;;;X;X&&+;      ;;;;;;;;;;;;;;;                ",
"                              X$X;X&X;+&&&&+;x&&&;;&&;+&+;+x;;$&&&$;;xXX&$;;$$&x;&X;;x$;;$;;+&+;$$;;&+;$X;X;;;+&&X;;                                    ",
"                              XX;;$&;;x&$X&;;$&&&;;&X;+&+;X&+;$&&&$;;$&&&$;;$$&x;&&$;+$;;$&;;&+;X&;;$x;x$;x&x;;$&&;;                                    ",
"                                ;;&$;;XX;+$;;++x$;;;;;$&;;;;;X&&&&$++$&&&$++++XX+&&&;+&x;;;;;&X;;;;;XX;;&;;&&X;X&&+;                                    ",
"                                ;+&&;;;+X&$$$$$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$&$X&&&;+&&$;;                                   ",
"                                ;;$&&&&&&&&&&&$$XXx++++;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;+++++xxX$$&&&&&&&&&&&$;;                                   ",
"                                 ;;;;;;;;;;;;;;;;;                                                 ;;;;;;;;;;;;;;+X;;                                   ",
"                                                                                                                  ;;;;                                  "
}



    dashboard.section.buttons.val = {}
    
    -- Configuração para posicionar o cursor no início
    dashboard.config.opts.noautocmd = true
    
    alpha.setup(dashboard.opts)
    
    -- Múltiplos autocmds para garantir posicionamento correto
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        vim.cmd("normal! gg0")
        vim.cmd("normal! zt")
        vim.opt_local.scrolloff = 0
        vim.opt_local.wrap = false
      end,
    })
    
    -- Removido autocmd BufEnter excessivo
  end
},

}
