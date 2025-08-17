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
