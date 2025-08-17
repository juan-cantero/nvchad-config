# NvChad Tutorial & Configuration Guide

## What is NvChad?

NvChad is a blazing fast Neovim configuration framework that provides:
- Beautiful UI with icons and themes
- Lazy loading for fast startup (0.02-0.07 seconds)
- Sensible defaults for coding
- Easy customization without breaking the config

## Configuration File Structure

```
~/.config/nvim/
├── init.lua              # Main entry point
├── lazy-lock.json        # Plugin version lock file
├── lua/
│   ├── autocmds.lua      # Auto commands (auto-save, etc.)
│   ├── chadrc.lua        # Main NvChad configuration
│   ├── mappings.lua      # Custom key mappings
│   ├── options.lua       # Neovim options (tabs, line numbers, etc.)
│   ├── configs/
│   │   ├── conform.lua   # Code formatting configuration
│   │   ├── lazy.lua      # Plugin manager setup
│   │   └── lspconfig.lua # Language Server Protocol setup
│   └── plugins/
│       └── init.lua      # Plugin definitions and configurations
```

### File Purposes

#### `chadrc.lua` - Core NvChad Settings
Controls themes, UI elements, and NvChad-specific features:
```lua
M.base46 = {
    theme = "onedark",          -- Color theme
}

M.ui = {
    icons = { enable = true },   -- Enable/disable icons
    tabufline = { 
        lazyload = false        -- Tab behavior
    }
}
```

#### `mappings.lua` - Custom Key Bindings
Define your custom shortcuts:
```lua
local map = vim.keymap.set

-- Insert mode mappings
map("i", "jk", "<ESC>")              -- jk to escape
map("i", "<C-s>", "<cmd>w<cr>")      -- Ctrl+s to save

-- Normal mode mappings
map("n", ";", ":", { desc = "Enter command mode" })
```

#### `options.lua` - Neovim Settings
Controls editor behavior:
```lua
vim.opt.relativenumber = true        -- Relative line numbers
vim.opt.tabstop = 2                 -- Tab width
vim.opt.shiftwidth = 2              -- Indent width
vim.opt.expandtab = true            -- Use spaces instead of tabs
```

#### `plugins/init.lua` - Plugin Management
Add new plugins or configure existing ones:
```lua
return {
  {
    "plugin-author/plugin-name",
    config = function()
      -- Plugin configuration
    end,
  },
}
```

## Essential Key Bindings

### Leader Key: `Space`

#### File Operations
- `Space + e` - File explorer (nvim-tree)
- `Space + ff` - Find files (telescope)
- `Space + fw` - Find word in files
- `Space + fb` - Find buffers
- `Space + fh` - Find help tags
- `Space + fo` - Find old files

#### Theme & UI
- `Space + th` - Theme selector
- `Space + ch` - NvChad cheatsheet

#### Navigation
- `Ctrl + n` - Toggle file tree
- `Ctrl + h/j/k/l` - Navigate between splits
- `Tab` / `Shift + Tab` - Navigate between buffers

#### Terminal
- `Alt + i` - Toggle floating terminal
- `Alt + h` - Toggle horizontal terminal
- `Alt + v` - Toggle vertical terminal

#### LSP (Language Server)
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show hover information
- `Space + lf` - Format code
- `Space + ca` - Code actions

### Insert Mode
- `jk` - Escape to normal mode
- `Ctrl + s` - Save file

## Useful Tricks & Tips

### 1. Quick Theme Switching
Press `Space + th` to open theme picker and preview themes in real-time.

### 2. Fuzzy Finding Everything
- `Space + ff` - Files by name
- `Space + fw` - Text inside files
- `Space + fb` - Open buffers
- `Space + fz` - Current buffer lines

### 3. Terminal Integration
NvChad has built-in terminal support:
- `Alt + i` - Floating terminal (great for quick commands)
- `Alt + h` - Horizontal split terminal
- `Alt + v` - Vertical split terminal

### 4. Buffer Management
- `Tab` - Next buffer
- `Shift + Tab` - Previous buffer
- `Space + x` - Close buffer

### 5. File Tree Tips
- `a` - Create new file/folder
- `r` - Rename
- `d` - Delete
- `c` - Copy
- `x` - Cut
- `p` - Paste

## Customization Examples

### Adding a New Plugin
Edit `lua/plugins/init.lua`:
```lua
return {
  -- Existing plugins...
  
  -- Add new plugin
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
}
```

### Custom Theme Colors
Edit `lua/chadrc.lua`:
```lua
M.base46 = {
  theme = "onedark",
  
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}
```

### Adding Custom Mappings
Edit `lua/mappings.lua`:
```lua
-- Save with Ctrl+s in any mode
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>")

-- Move lines up/down
map("n", "<A-j>", ":m .+1<cr>==")
map("n", "<A-k>", ":m .-2<cr>==")
```

### LSP Configuration
Edit `lua/configs/lspconfig.lua`:
```lua
local servers = { "html", "cssls", "tsserver", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
```

## Common Workflows

### 1. Project Development
1. `nvim .` - Open project root
2. `Space + e` - Browse files
3. `Space + ff` - Quick file search
4. `Space + fw` - Search in files
5. `Space + th` - Adjust theme for comfort

### 2. Code Editing
1. Navigate with `gd` (go to definition)
2. Use `K` for documentation
3. Format with `Space + lf`
4. Quick save with `Ctrl + s`

### 3. Terminal Workflow
1. `Alt + i` - Quick terminal for git/npm commands
2. `Alt + h` - Persistent terminal for logs
3. `Ctrl + n` - File tree for navigation

## Performance Tips

1. **Lazy Loading**: NvChad loads plugins only when needed
2. **Startup Time**: Check with `:Lazy profile`
3. **Memory Usage**: Monitor with `:checkhealth`
4. **Plugin Management**: Remove unused plugins from `plugins/init.lua`

## Troubleshooting

### Icons Not Showing
1. Install Nerd Font
2. Configure terminal to use Nerd Font
3. For Alacritty: Set font in `~/.config/alacritty/alacritty.toml`

### Slow Startup
1. Check `:Lazy profile`
2. Remove unnecessary plugins
3. Check for conflicting autocmds

### LSP Not Working
1. `:checkhealth lsp`
2. Install language servers: `:Mason`
3. Check `lua/configs/lspconfig.lua`

## Advanced Configuration

### Custom Commands
Add to `lua/autocmds.lua`:
```lua
vim.api.nvim_create_user_command("Config", function()
  vim.cmd("e ~/.config/nvim")
end, {})
```

### Auto Commands
```lua
-- Auto-save on focus lost
vim.api.nvim_create_autocmd("FocusLost", {
  pattern = "*",
  command = "wa",
})
```

### Status Line Customization
Modify in `lua/chadrc.lua`:
```lua
M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
}
```

## Configuration Sync & Migration

Unlike VS Code which only syncs user settings, NvChad requires syncing the entire configuration directory.

### Linux/macOS Location
```
~/.config/nvim/
```

### Windows 11 Location
```
C:\Users\YourUsername\AppData\Local\nvim\
```

### Sync Methods

#### 1. Git Repository (Recommended)

**Initial Setup (Linux):**
```bash
cd ~/.config/nvim
git init
git add .
git commit -m "Initial NvChad config"
git remote add origin https://github.com/yourusername/nvchad-config.git
git push -u origin main
```

**Clone on New Machine:**

**Linux/macOS:**
```bash
git clone https://github.com/yourusername/nvchad-config.git ~/.config/nvim
```

**Windows 11:**
```cmd
git clone https://github.com/yourusername/nvchad-config.git %LOCALAPPDATA%\nvim
```

#### 2. Cross-Platform Dotfiles

**Repository Structure:**
```
dotfiles/
├── nvim/           # Your NvChad config
├── install.sh      # Linux/macOS installer
└── install.bat     # Windows installer
```

**Linux/macOS Setup:**
```bash
ln -sf ~/dotfiles/nvim ~/.config/nvim
```

**Windows Setup (Run as Administrator):**
```cmd
mklink /D "%LOCALAPPDATA%\nvim" "C:\Users\%USERNAME%\dotfiles\nvim"
```

#### 3. Manual Sync
**Linux to Windows:**
```bash
scp -r ~/.config/nvim/ user@windows-machine:/c/Users/Username/AppData/Local/
```

**Windows to Linux:**
```cmd
scp -r "%LOCALAPPDATA%\nvim" user@linux-machine:~/.config/
```

### Windows 11 Prerequisites
1. Install Neovim: `winget install Neovim.Neovim`
2. Install Nerd Font in Windows Font Settings
3. Configure Windows Terminal to use Nerd Font:
   ```json
   {
     "profiles": {
       "defaults": {
         "font": {
           "face": "JetBrainsMono Nerd Font"
         }
       }
     }
   }
   ```

### What Gets Synced
- All Lua configuration files
- Plugin definitions and settings
- Custom key mappings
- Themes and UI preferences
- LSP configurations
- Plugin lock file (`lazy-lock.json`)

**Note**: The git repository method provides version control and works seamlessly across all platforms.

## Useful Resources

- [NvChad Official Docs](https://nvchad.com/docs/)
- [Lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [Tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter)

---

**Pro Tip**: Start with the defaults and gradually customize. NvChad is designed to work great out of the box!