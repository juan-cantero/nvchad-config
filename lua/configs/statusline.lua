-- Custom statusline configuration to show full file path

-- Function to get full path with home replacement
local function get_full_path()
  local filename = vim.fn.expand("%:p")
  local home = vim.fn.expand("~")
  filename = filename:gsub("^" .. home, "~")
  return filename ~= "" and filename or "[No Name]"
end

-- Set up autocmd to update statusline
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "WinEnter"}, {
  callback = function()
    vim.opt_local.statusline = "%{%v:lua.require('configs.statusline').get_statusline()%}"
  end,
})

-- Export the function
local M = {}

M.get_statusline = function()
  local mode = vim.fn.mode()
  local file_path = get_full_path()
  local git_branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
  
  local statusline = ""
  
  -- Mode
  statusline = statusline .. "%#StatusLine# " .. mode .. " "
  
  -- File path
  statusline = statusline .. "%#StatusLineNC# " .. file_path .. " "
  
  -- Git branch
  if git_branch ~= "" then
    statusline = statusline .. "%#DiffAdd# " .. git_branch .. " "
  end
  
  -- Right align
  statusline = statusline .. "%="
  
  -- Line and column
  statusline = statusline .. "%#StatusLine# %l:%c %p%% "
  
  return statusline
end

M.get_full_path = get_full_path

return M