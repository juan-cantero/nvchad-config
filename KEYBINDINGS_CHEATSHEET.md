# 🎹 NvChad Development Environment - Keybindings Cheat Sheet

This comprehensive cheat sheet covers all custom keybindings and shortcuts configured in your NvChad development environment.

---

## 📍 Leader Key Configuration
**Source:** `/home/juan/.config/nvim/init.lua:2`
```lua
vim.g.mapleader = " "  -- Space is the leader key
```

---

## 🚀 General Navigation & Editing

### Mode Switching
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:22-26`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `jk` | Insert | `<ESC>` | Exit insert mode |
| `jk` | Terminal | `<C-\><C-n>` | Exit terminal insert mode |
| `<ESC>` | Terminal | `<C-\><C-n>` | Exit terminal insert mode |
| `;` | Normal | `:` | Enter command mode |

### VSCode-like Editing Tricks
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:8-16`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `<leader>i` | Normal | `i <Esc>i` | Insert space and enter insert |
| `<leader>a` | Normal | `a <Esc>i ` | Append space and enter insert with space |
| `<leader>q` | Normal | `ysiw"` | Surround word with quotes |
| `<leader>;` | Normal | `mzA;<Esc>`z` | Add semicolon at end of line |

### Code Formatting (Bracket/Brace Formatting)
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:14-19`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `<leader>f` | Normal | Format parameters | Format parentheses () - position cursor on ( |
| `<leader>F` | Normal | Format braces | Format braces {} - position cursor on { |
| `<leader>b` | Normal | Format brackets | Format brackets [] - position cursor on [ |
| `<leader>f` | Visual | `:s/, /,\r/g<CR>gv=` | Format selected parameters |

---

## 📱 Flutter Development

### Flutter Core Commands
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:35-43`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `<leader>fr` | Normal | `:FlutterRun<CR>` | Flutter Run |
| `<leader>fd` | Normal | `:FlutterDevices<CR>` | Flutter Devices |
| `<leader>fe` | Normal | `:FlutterEmulators<CR>` | Flutter Emulators |
| `<leader>fR` | Normal | `:FlutterReload<CR>` | Flutter Hot Reload |
| `<leader>fS` | Normal | `:FlutterRestart<CR>` | Flutter Hot Restart |
| `<leader>fq` | Normal | `:FlutterQuit<CR>` | Flutter Quit |
| `<leader>ft` | Normal | `:FlutterDevTools<CR>` | Flutter Dev Tools |
| `<leader>fo` | Normal | `:FlutterOutlineToggle<CR>` | Flutter Outline |
| `<leader>fl` | Normal | `:FlutterLspRestart<CR>` | Flutter LSP Restart |

### Dart Specific Commands
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:85-86`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `<leader>da` | Normal | `:DartAnalyzer<CR>` | Dart Analyzer |
| `<leader>df` | Normal | `:DartFmt<CR>` | Dart Format |

### Dart LSP Commands (Auto-configured for .dart files)
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:105-114`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `<leader>lf` | Normal | `vim.lsp.buf.format()` | Format Dart file |
| `<leader>ca` | Normal/Visual | `vim.lsp.buf.code_action` | Code Actions |
| `<leader>rn` | Normal | `vim.lsp.buf.rename` | Rename Symbol |
| `gd` | Normal | `vim.lsp.buf.definition` | Go to Definition |
| `gr` | Normal | `vim.lsp.buf.references` | Go to References |
| `K` | Normal | `vim.lsp.buf.hover` | Hover Documentation |

---

## 💻 Terminal Management

### Traditional Terminal Commands
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:46-48`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `<leader>tt` | Normal | `:tab terminal<CR>` | Terminal Tab |
| `<leader>ts` | Normal | `:split \| terminal<CR> \| resize 15<CR>` | Terminal Panel Bottom |
| `<leader>tv` | Normal | `:vsplit \| terminal<CR>` | Terminal Panel Right |

### ToggleTerm Enhanced Terminals
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:73-82`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `<C-\>` | Normal | `:ToggleTerm<CR>` | Toggle Terminal |
| `<leader>tf` | Normal | `:ToggleTerm direction=float<CR>` | Float Terminal |
| `<leader>th` | Normal | `:ToggleTerm direction=horizontal<CR>` | Horizontal Terminal |
| `<leader>tv` | Normal | `:ToggleTerm direction=vertical<CR>` | Vertical Terminal |
| `<leader>T1` | Normal | `:1ToggleTerm<CR>` | ToggleTerm 1 |
| `<leader>T2` | Normal | `:2ToggleTerm<CR>` | ToggleTerm 2 |
| `<leader>T3` | Normal | `:3ToggleTerm<CR>` | ToggleTerm 3 |
| `<leader>T4` | Normal | `:4ToggleTerm<CR>` | ToggleTerm 4 |

**ToggleTerm Default Mapping:**
**Source:** `/home/juan/.config/nvim/lua/plugins/init.lua:177`
- `<C-\>` - Toggle terminal (configured in plugin)

### Quick Terminal Panels
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:68-70`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `<leader>t1` | Normal | Split + terminal | Flutter Terminal |
| `<leader>t2` | Normal | Split + terminal | Claude Code Terminal |
| `<leader>t3` | Normal | Split + terminal | General Commands Terminal |

### Terminal Navigation
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:27-30`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `<C-w>h` | Terminal | `<C-\><C-n><C-w>h` | Terminal: Move left |
| `<C-w>j` | Terminal | `<C-\><C-n><C-w>j` | Terminal: Move down |
| `<C-w>k` | Terminal | `<C-\><C-n><C-w>k` | Terminal: Move up |
| `<C-w>l` | Terminal | `<C-\><C-n><C-w>l` | Terminal: Move right |

### Terminal Workspace
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:57-65`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `<leader>tw` | Normal | Custom function | Terminal Workspace Tab (2 terminals) |

---

## 📑 Tab Navigation
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:51-54`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `<leader>1` | Normal | `1gt` | Go to Tab 1 |
| `<leader>2` | Normal | `2gt` | Go to Tab 2 |
| `<leader>3` | Normal | `3gt` | Go to Tab 3 |
| `<leader>4` | Normal | `4gt` | Go to Tab 4 |

---

## 🤖 GitHub Copilot Chat
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:89-98`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `<leader>ca` | Normal | `:Copilot auth<CR>` | Copilot Auth |
| `<leader>cc` | Normal | `:CopilotChat<CR>` | Copilot Chat |
| `<leader>ce` | Normal/Visual | `:CopilotChatExplain<CR>` | Copilot Explain Code |
| `<leader>cr` | Normal | `:CopilotChatReview<CR>` | Copilot Review Code |
| `<leader>cf` | Normal | `:CopilotChatFix<CR>` | Copilot Fix Code |
| `<leader>co` | Normal | `:CopilotChatOptimize<CR>` | Copilot Optimize Code |
| `<leader>cd` | Normal | `:CopilotChatDocs<CR>` | Copilot Generate Docs |
| `<leader>ct` | Normal | `:CopilotChatTests<CR>` | Copilot Generate Tests |
| `<leader>cc` | Visual | `:CopilotChatVisual<CR>` | Copilot Chat Visual |
| `<leader>ce` | Visual | `:CopilotChatExplain<CR>` | Copilot Explain Selection |

---

## 🔍 FZF & Search (Terminal/Bash)

### FZF Built-in Keybindings
**Source:** `/home/juan/.bashrc:177-195`

| Key | Mode | Action | Description |
|-----|------|---------|------------|
| `Ctrl+T` | Bash | FZF file finder | Find files with bat preview |
| `Ctrl+R` | Bash | FZF history search | Search command history |
| `Alt+C` | Bash | FZF directory finder | Find and cd to directory |
| `?` | FZF | Toggle preview | Show/hide preview in any FZF interface |
| `Ctrl+/` | FZF | Toggle preview | Alternative preview toggle |

### Custom FZF Functions
**Source:** `/home/juan/.bashrc:202-235`

| Command | Description | Source Line |
|---------|-------------|-------------|
| `fe` | Find and edit file with preview | 206 |
| `fs <term>` | Search in files and edit (interactive grep) | 219 |
| `gb` | Git branch selector with preview | 225 |
| `fkill` | Interactive process killer | 235 |

---

## 🐧 Zoxide Navigation (Terminal/Bash)

### Zoxide Commands
**Source:** `/home/juan/.bashrc:289-344`

| Command | Description | Source Line |
|---------|-------------|-------------|
| `z <directory>` | Smart directory jump | 293-303 |
| `zi` | Interactive directory picker with ASCII penguin | 307-344 |
| `z -` | Jump to previous directory | 295 |

---

## 🎨 NvChad Default Keybindings

### Core NvChad Mappings
**Source:** `nvchad.mappings` (loaded in `/home/juan/.config/nvim/lua/mappings.lua:1`)

**Note:** These are the default NvChad keybindings. Common ones include:
- `<leader>ff` - Find files (Telescope)
- `<leader>fa` - Find all files
- `<leader>fw` - Find word in files
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help
- `<leader>fo` - Find old files
- `<leader>fz` - Find in current buffer
- `<leader>cm` - Git commits
- `<leader>gt` - Git status
- `<leader>th` - Change theme
- `<leader>e` - Toggle nvim-tree
- `<leader>h` - New horizontal terminal
- `<leader>v` - New vertical terminal

---

## 🔧 Auto-configurations

### Auto-formatting
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:117-123`
- **Dart files**: Auto-format on save (BufWritePre)

### Context-sensitive Mappings
- **Dart LSP mappings**: Only active in `.dart` files
- **Terminal mappings**: Only active in terminal mode

---

## 📋 Summary by Category

### Text Editing & Navigation
- **Mode switching**: `jk`, `;`, `<ESC>`
- **Quick edits**: `<leader>i`, `<leader>a`, `<leader>q`, `<leader>;`
- **Formatting**: `<leader>f/F/b` for brackets

### Development Workflow
- **Flutter**: `<leader>f*` commands for run/reload/devices
- **Dart**: `<leader>d*` for analyzer/format + LSP mappings
- **Copilot**: `<leader>c*` for AI assistance

### Terminal & Navigation
- **Terminals**: `<leader>t*` and `<leader>T*` for various terminals
- **Tabs**: `<leader>1-4` for tab navigation
- **FZF**: `Ctrl+T/R`, `Alt+C`, custom `fe/fs/gb/fkill`
- **Zoxide**: `z`, `zi` for smart directory navigation

### File Management
- **Search**: FZF integration with preview
- **Navigation**: Smart directory jumping with zoxide
- **Editing**: Direct file opening with preview

---

**Total Custom Keybindings:** 50+ mappings across multiple files
**Configuration Files:** 3 main files (mappings.lua, .bashrc, plugins/init.lua)
**Special Features:** ASCII penguin in `zi`, dynamic terminal titles, enhanced FZF integration