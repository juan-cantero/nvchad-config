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

-- NvChad Dashboard configuration
M.nvdash = {
  load_on_startup = true,
  
  header = {
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣤⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⢀⣠⣶⣿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣷⣦⣄⣀⣤⣶⣶",
    "⠀⠀⠀⠀⠀⣰⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⠟⠋",
    "⠀⠀⠀⠀⣼⣿⡿⠃⠀⢀⣤⣾⣿⣿⣿⣿⣷⣦⣄⠀⠀⠈⠉⠀⠀⠀",
    "⠀⠀⠀⣸⣿⡿⠁⠀⢠⣿⣿⠟⠉⠀⠈⠉⠛⢿⣿⣷⡄⠀⠀⠀⠀⠀",
    "⠀⠀⢀⣿⣿⡇⠀⠀⣾⣿⡟⠀⠀⢀⣤⣄⠀⠀⠹⣿⣿⡄⠀⠀⠀⠀",
    "⠀⠀⣾⣿⣿⡇⠀⠀⢻⣿⣷⡀⠀⠘⣿⣿⡇⠀⠀⣿⣿⡇⠀⠀⠀⠀",
    "⠀⣼⣿⡿⣿⣿⡄⠀⠈⠻⣿⣿⣷⣿⣿⡿⠃⠀⢀⣿⣿⡇⠀⠀⠀⠀",
    "⣰⣿⣿⠁⠹⣿⣿⣦⡀⠀⠈⠉⠛⠋⠉⠀⠀⣠⣾⣿⡟⠀⠀⠀⠀⠀",
    "⣿⣿⣧⣤⣤⣬⣿⣿⣿⣶⣦⣤⣤⣤⣴⣶⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀",
    "⠙⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀",
    "",
    "  🤖 Welcome to Juanqui's Development Environment 🤖",
    "     ⚡ Powered by NvChad • Ready to Code ⚡",
    "",
  },

  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "  Restore Last Session", keys = "ls", cmd = "lua require('persistence').load({ last = true })" },
    { txt = "  Session for Current Directory", keys = "cs", cmd = "lua require('persistence').load()" },
    { txt = "  Themes", keys = "th", cmd = "Telescope themes" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
    { txt = "  Exit", keys = "q", cmd = "qa" },
    { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashLazy",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
  },
}

-- Custom icon configuration for nvim-tree (disable file icons, keep git icons)
M.plugins = "plugins.configs.nvim-tree-simple"

return M
