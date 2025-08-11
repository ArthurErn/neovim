-- core/options.lua

-- Indentação estilo VSCode
vim.opt.tabstop = 2
vim.opt.colorcolumn = "160"  -- Já configurado para 160
vim.o.shiftwidth      = 2
vim.o.expandtab       = true
vim.o.number          = true
vim.o.relativenumber  = true
vim.o.splitright      = true
vim.o.smartindent     = true
vim.opt.termguicolors = true
vim.opt.textwidth = 160
vim.opt.wrap = false
vim.opt.linebreak = true

vim.g.copilot_node_command = "C:/Program Files/nodejs/node.exe"
vim.opt.encoding = "UTF-8"
vim.opt.fileencoding = "UTF-8"

-- Customização de ícones de diagnóstico
vim.fn.sign_define("DiagnosticSignError", {text = "✘", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "⚠", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "ℹ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "➤", texthl = "DiagnosticSignHint"})

-- Cursor vertical para todos os modos do nvim
vim.o.guicursor = "n-v-c-i-ve-r-cr-o-sm:ver25"
