-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    separator_style = "default", -- default/round/block/arrow
    order = {"mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor"},
    modules = {
      file = function()
        local filename = vim.fn.expand("%:p") -- Full path
        local home = vim.fn.expand("~")
        filename = filename:gsub("^" .. home, "~") -- Replace /home/user with ~
        
        if filename == "" then
          return "%#StText# [No Name] %#St_file_sep#"
        end
        
        local icon = "󰈚 "
        -- Get file extension for icon
        local ext = vim.fn.expand("%:e")
        if ext ~= "" then
          local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
          if devicons_ok then
            local file_icon = devicons.get_icon(filename, ext, { default = true })
            if file_icon then
              icon = file_icon .. " "
            end
          end
        end
        
        return "%#StText#" .. icon .. filename .. " %#St_file_sep#"
      end,
    },
  },
  icons = {
    ft = "",
    lsp = {
      document_symbol = "",
    },
  },
}

-- Alternative: Configure nvim-tree with simpler icons
M.nvdash = { load_on_startup = false }

-- Custom icon configuration for nvim-tree (disable file icons, keep git icons)
M.plugins = "plugins.configs.nvim-tree-simple"

return M
