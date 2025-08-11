return {
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- Importante: Deixe apenas a configuração de Flutter-tools e remova a configuração direta do dartls
-- pois o Flutter-tools já configura o servidor dartls internamente

-- Flutter Tools com configuração melhorada
require("flutter-tools").setup({
  ui = {
    -- estas opções decorativas ajudam a visualizar melhor o conteúdo
    border = "rounded",
    notification_style = 'native',
  },
  decorations = {
    statusline = {
      app_version = false,
      device = true,
    }
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  flutter_path = "flutter", -- pode ser personalizado para o caminho do seu Flutter SDK
  flutter_lookup_cmd = nil,
  fvm = false, -- caso use o Flutter Version Management
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "ErrorMsg",
    prefix = "//",
    enabled = true
  },
  lsp = {
    flutter_path = "C:\\src\\flutter\\bin\\flutter.bat",
    color = { -- mostrar cores nos arquivos
      enabled = false,
      background = true,
      foreground = false,
      virtual_text = true,
      virtual_text_str = "■",
    },
   on_attach = function(client, bufnr)
      -- Habilitar autocompletion (descomentado e corrigido)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      
      -- Configuração específica para completar automaticamente após "." em Dart
      vim.cmd([[
        augroup DartOmniFunc
          autocmd! * <buffer>
          autocmd TextChangedI <buffer> lua require('cmp').complete({ reason = require('cmp').ContextReason.Auto })
        augroup END
      ]])
      
      -- Keymaps específicos para Flutter/Dart
      vim.keymap.set('n', '<leader>fr', "<cmd>FlutterRun<CR>", { buffer = bufnr })
      vim.keymap.set('n', '<leader>fq', "<cmd>FlutterQuit<CR>", { buffer = bufnr })
      vim.keymap.set('n', '<leader>fR', "<cmd>FlutterRestart<CR>", { buffer = bufnr })
      vim.keymap.set('n', '<leader>fD', "<cmd>FlutterDevices<CR>", { buffer = bufnr })
      vim.keymap.set('n', '<leader>fo', "<cmd>FlutterOutlineToggle<CR>", { buffer = bufnr })

      vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, { buffer = bufnr })         -- Mostrar documentação (hover)
      vim.keymap.set('n', '<leader>fs', vim.lsp.buf.signature_help, { buffer = bufnr }) -- Mostrar assinatura da função
      vim.keymap.set('n', '<leader>fd', vim.lsp.buf.definition, { buffer = bufnr })     -- Ir para definição

    end, 
    capabilities = capabilities,
    settings = {
      showTodos = true,
      renameFilesWithClasses = "prompt",
      updateImportsOnRename = true,
      completeFunctionCalls = true,
      enableSnippets = true,
      enableSdkFormatter = true,
      suggestionImportCompletions = true, -- esta é a opção importante para importações automáticas
      dart = {
        completeFunctionCalls = true,
        showTodos = true,
        enableSnippets = true,
        updateImportsOnRename = true,
        suggestFromUnimportedLibraries = true, -- importante para classes do Flutter
        closingLabels = true,
        outline = true,
        flutterOutline = true,
      }
    },
  },
  dev_log = {
    enabled = true,
    open_cmd = "tabedit",
  },
  dev_tools = {
    autostart = false,
    auto_open_browser = false,
  },
  outline = {
    open_cmd = "30vnew",
    auto_open = false
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    }
  },
})
-- LSP para Dart
require('lspconfig').dartls.setup{}

-- Gatilhos de autocompletion no Flutter
vim.cmd([[
  augroup flutter_autocomplete
    autocmd!
    autocmd FileType dart inoremap <buffer> . .<C-x><C-o>
    autocmd FileType dart inoremap <buffer> <space> <space><C-x><C-o>
    autocmd FileType dart inoremap <buffer> ( (<C-x><C-o>
  augroup END
]])

-- Forçar sugestão de imports Flutter com <leader>fi
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function()
    vim.api.nvim_set_keymap('n', '<leader>fi', ':lua vim.lsp.buf.execute_command({command = "_flutter.suggestImport", arguments = {vim.fn.expand("%:p")}})<CR>', {noremap = true, silent = true})
  end
})

    end
  },
{
  "kosayoda/nvim-lightbulb",
  event = "LspAttach",
  config = function()
    -- Define o ícone da lâmpada no lado esquerdo da linha
    vim.fn.sign_define("LightBulbSign", { text = "💡", texthl = "DiagnosticSignHint" })

    require("nvim-lightbulb").setup({
      autocmd = { enabled = true },
      sign = {
        enabled = true,
        priority = 10,
      },
      virtual_text = {
        enabled = true, -- Você pode colocar true aqui se quiser o 💡 inline
      },
    })
  end,
},
}
