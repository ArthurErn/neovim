-- Arquivo: lua/dashboard.lua
local M = {}

-- Arte do dashboard
local dashboard_art = {
"⠀⠀   ⠀⠀⠀⠀⠀⠀⠀⠀⠀   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ⠀⠀ ",
  "⠀⠀   ⠀⠀⠀⠀⠀⠀⠀⠀⠀   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ⠀⠀ ",
  "⠀⠀⢦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⣼⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡴⠀⠀ ",
  "⠀⠘⣿⣿⣿⣷⣦⣄⣀⠀⢠⠔⠀⢀⡼⠿⠿⢆⠀⠀⠲⣄⠀⣀⣠⣴⣾⣿⣿⣿⠇⠀⠀",
  "⠀⠀⠈⠉⠉⠛⠛⠻⠿⢿⣿⠀⢀⣾⣷⡀⢀⣾⣷⡀⠀⣿⡿⠿⠿⠛⠛⠉⠉⠁⠀⠀⠀",
  "⠀⠀⠀⣤⣤⣶⣶⣶⣶⣶⣿⣆⠈⠉⠉⠉⠉⠉⠉⠉⢠⣿⣶⣶⣶⣶⣶⣤⣤⠀⠀⠀",
  "⠀⠀⠀⠘⣿⡿⠟⠛⠉⣡⣿⣿⣷⣤⠀⢠⣆⠀⣤⣶⣿⣿⣬⡉⠛⠻⠿⣿⠇⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⢋⣿⣿⠛⢠⣿⣿⡄⠛⢿⣿⡘⢿⣿⣦⣀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠉⠻⠏⠀⣸⣿⡇⢀⠻⣿⣿⠟⣀⠸⣿⣇⠀⠙⠟⠋⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠁⣿⣿⠀⠻⣆⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢟⠉⠙⠓⠀⠘⠏⠀⠘⠟⠉⡻⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}


-- Função para abrir o dashboard
function M.open_side_dashboard()
  local dashboard_bufnr = nil
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(buf):match("Dashboard$") then
      dashboard_bufnr = buf
      break
    end
  end

  if dashboard_bufnr then
    local dashboard_winnr = nil
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == dashboard_bufnr then
        dashboard_winnr = win
        break
      end
    end

    if dashboard_winnr then
      vim.api.nvim_set_current_win(dashboard_winnr)
      return
    end
  end

  vim.cmd('lefta vnew')
  
  if dashboard_bufnr then
    vim.api.nvim_win_set_buf(0, dashboard_bufnr)
  else
    dashboard_bufnr = vim.api.nvim_get_current_buf()
    
    vim.api.nvim_buf_set_lines(dashboard_bufnr, 0, -1, false, dashboard_art)
    
    vim.bo[dashboard_bufnr].modifiable = false
    vim.bo[dashboard_bufnr].buftype = 'nofile'
    vim.bo[dashboard_bufnr].bufhidden = 'hide'
    vim.bo[dashboard_bufnr].swapfile = false
    
    vim.api.nvim_buf_set_name(dashboard_bufnr, "Dashboard")
    
    vim.api.nvim_buf_set_keymap(dashboard_bufnr, 'n', 'q', ':close<CR>', 
                               { noremap = true, silent = true })
  end
  
  vim.cmd('vertical resize 40')
  
  vim.cmd([[
    highlight DashboardArt ctermfg=blue guifg=#61afef
    match DashboardArt /\%1l\|\%2l\|\%3l\|\%4l\|\%5l\|\%6l\|\%7l\|\%8l\|\%9l\|\%10l\|\%11l/
  ]])
end

-- Função para configuração
function M.setup()
  vim.api.nvim_create_user_command("SideDashboard", M.open_side_dashboard, {})
  vim.api.nvim_set_keymap('n', '<leader>d', ':SideDashboard<CR>', { noremap = true, silent = true })
end

return M