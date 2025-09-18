-- Keymaps básicos
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<S-Tab>', ':bnext<CR>', { desc = "Próximo buffer" })
vim.keymap.set('n', '<Tab>', ':bprev<CR>', { desc = "Buffer anterior" })

vim.api.nvim_set_keymap('n', '<C-c>', '"+y', opts)
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', opts)
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', opts)
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', opts)
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>i', opts)
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', opts)
vim.api.nvim_set_keymap('n', '<C-z>', 'u', opts)
vim.api.nvim_set_keymap('i', '<C-z>', '<Esc>ui', opts)
vim.api.nvim_set_keymap('n', '<C-y>', '<C-r>', opts)
vim.api.nvim_set_keymap('i', '<C-y>', '<Esc><C-r>i', opts)
-- vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR> | NvimTreeFindFileToggle<CR> | NvimTreeFindFileToggle<CR>', opts)

vim.keymap.set('n', '<leader>fr', function()
  -- Abre um split na parte inferior com altura 15
  vim.cmd('botright split')
  vim.cmd('resize 15')

  -- Abre terminal e executa comando
  local term_buf = vim.api.nvim_create_buf(false, true)
  local term_win = vim.api.nvim_get_current_win()

  vim.api.nvim_win_set_buf(term_win, term_buf)
  vim.fn.termopen('fvm flutter run -d windows --dart-define-from-file=envs/.env')
  vim.cmd('startinsert')
end, { desc = "Abrir terminal Flutter", noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-d>', ':t.<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-D>', ':t-1<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-Left>', 'v<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Right>', 'v<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Up>', 'v<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Down>', 'v<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Left>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Right>', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Up>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Down>', '<Down>', { noremap = true, silent = true })
-- Live grep com Ctrl+G (mais confiável)
vim.keymap.set('n', '<C-g>', function()
  require('telescope.builtin').live_grep()
end, { noremap = true, silent = true, desc = "Live grep with Telescope" })
vim.keymap.set('n', '<C-t>', function()
  vim.cmd('tabnew')
  vim.bo.buftype = 'nofile'
  vim.bo.bufhidden = 'wipe'
  vim.bo.swapfile = false
end, { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-l>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-e>', ':bdelete!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 's', 'i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-t>', ':botright split | resize 15 | terminal<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<M-.>", vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set("v", "<M-.>", vim.lsp.buf.code_action, { noremap = true, silent = true })

-- Mover linha atual para baixo
vim.keymap.set('n', '<leader>j', ':m .+1<CR>==', { desc = 'Move line down' })

-- Mover linha atual para cima  
vim.keymap.set('n', '<leader>k', ':m .-2<CR>==', { desc = 'Move line up' })

-- Mover linhas selecionadas para baixo (modo visual)
vim.keymap.set('v', '<leader>j', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })

-- Mover linhas selecionadas para cima (modo visual)
vim.keymap.set('v', '<leader>k', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Duplicar linha atual para baixo
vim.keymap.set('n', '<leader>d', ':t.<CR>', { desc = 'Duplicate line down' })

-- Duplicar linhas selecionadas para baixo (modo visual)
vim.keymap.set('v', '<leader>d', ":t'><CR>gv", { desc = 'Duplicate selection down' })

-- Deletar linha e copiar para clipboard
vim.keymap.set('n', '<leader>c', '"+dd', { desc = 'Cut line to clipboard' })


vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Desindentar linha (visual)" })
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indentar linha (visual)" })

vim.keymap.set("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<CR>", { noremap = true, silent = true, desc = "Buscar no buffer atual" })

-- Duplica o file atual em uma nova aba
vim.keymap.set('n', '<leader>tt', function()
    vim.cmd("tab split")
end, { desc = "Duplicar aba atual" })


-- Nome da pasta (texto) em vermelho quando tiver erro
vim.api.nvim_set_hl(0, "NvimTreeDiagnosticError", { fg = "#ff5555", bold = true })

-- (opcional) outros tipos, se quiser personalizar
vim.api.nvim_set_hl(0, "NvimTreeDiagnosticWarn",  { fg = "#f1fa8c", italic = true })
vim.api.nvim_set_hl(0, "NvimTreeDiagnosticInfo",  { fg = "#8be9fd" })
vim.api.nvim_set_hl(0, "NvimTreeDiagnosticHint",  { fg = "#50fa7b" })

vim.api.nvim_create_autocmd("FileType", {
	  pattern = "dart",
	  callback = function()
	    vim.bo.shiftwidth = 2
	    vim.bo.tabstop = 2
	    vim.bo.softtabstop = 2
	    vim.bo.expandtab = true
	    vim.bo.autoindent = true
	    vim.bo.smartindent = false -- desligue se estiver causando problema
	    vim.bo.cindent = false     -- idem
      vim.bo.textwidth = 160     -- Define largura de texto para arquivos Dart
      vim.opt_local.colorcolumn = "160"  -- Específico para buffers Dart
	  end
})

-- Abre uma aba nova e vai para a definição da classe
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dart",
    callback = function()
      vim.keymap.set("n", "<A-d>", function()
        vim.cmd("tabnew")
        vim.lsp.buf.definition()
      end, { buffer = true, desc = "Flutter: Go to Definition in New Tab" })
    end,
})

-- vim.keymap.set("n", "<M-.>", require("telescope.builtin").lsp_code_actions, { noremap=true, silent=true })


-- Configurações para melhorar as sugestões
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.updatetime = 100  -- Tempo de atualização mais rápido para que o autocompletion seja mais responsivo
vim.opt.signcolumn = "yes"

-- LSP keymaps específicos (importante para sugestões)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    
    -- Habilita sugestões com Ctrl+Space
    vim.keymap.set('i', '<C-Space>', vim.lsp.buf.completion, { buffer = bufnr })
    
    -- Exibir informações ao passar o mouse
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
    
    -- Ir para definição
    vim.keymap.set('n', '<M-d>', function()
        local params = vim.lsp.util.make_position_params()
        vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result, ctx, _)
        if err or not result or vim.tbl_isempty(result) then
          vim.notify("Definition not found", vim.log.levels.WARN)
          return
          end

        local location = result[1] or result

        vim.cmd("tabnew")
        vim.lsp.util.jump_to_location(location, "utf-8", true)
      end)
    end, { buffer = bufnr, desc = "Go to Definition in New Tab" })

    -- Exibir sugestões de código
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
    
    -- Renomear símbolos
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
  end,
})

-- <C-p> com Telescope + NvimTree sincronizado (require lazy)
vim.keymap.set("n", "<C-p>", function()
  local telescope_builtin = require("telescope.builtin")
  local telescope_actions = require("telescope.actions")
  local telescope_state = require("telescope.actions.state")

  telescope_builtin.find_files({
    attach_mappings = function(prompt_bufnr, map)
      local function open_and_sync_tree()
        local entry = telescope_state.get_selected_entry()
        telescope_actions.close(prompt_bufnr)

        vim.cmd("edit " .. vim.fn.fnameescape(entry.path or entry.filename))
        vim.cmd("NvimTreeOpen")
        vim.cmd("NvimTreeFindFile")
      end

      map("i", "<CR>", open_and_sync_tree)
      map("n", "<CR>", open_and_sync_tree)
      return true
    end
  })
end, { noremap = true, silent = true })

-- Key mapping para rodar arquivo Flutter atual como main

-- Função para executar arquivo Flutter atual
local function run_current_flutter_file()
  local current_file = vim.fn.expand('%:p')
  local cmd = 'fvm flutter run ' .. current_file
  print("Executando: " .. cmd)
  
  -- Abre terminal na parte inferior com 15 linhas de altura
  vim.cmd('botright split | resize 15 | terminal ' .. cmd)
end

-- Key mapping
vim.keymap.set('n', '<leader>rt', run_current_flutter_file, {
  desc = 'Run current Flutter file as main',
  silent = true
})

-- Claude Code floating window keymap
local claude_window_id = nil

vim.keymap.set('n', '<leader>cc', function()
  local width = math.floor(vim.o.columns * 0.4)
  local height = math.floor(vim.o.lines * 0.6)
  local row = 1
  local col = vim.o.columns - width - 1
  
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
    title = 'Claude Code',
    title_pos = 'center'
  })
  
  claude_window_id = win
  
  vim.fn.termopen('claude code', {
    on_exit = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
      claude_window_id = nil
    end
  })
  vim.cmd('startinsert')
end, {
  desc = 'Open Claude Code in floating window',
  silent = true
})

-- Close Claude Code floating window
vim.keymap.set('n', '<leader>cq', function()
  if claude_window_id and vim.api.nvim_win_is_valid(claude_window_id) then
    vim.api.nvim_win_close(claude_window_id, true)
    claude_window_id = nil
  end
end, {
  desc = 'Close Claude Code floating window',
  silent = true
})