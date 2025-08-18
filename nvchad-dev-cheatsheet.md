# NvChad Development Environment Cheat Sheet

## 🔧 NvChad Core Commands

### Leader Key: `Space`

### File Navigation
| Shortcut | Action |
|----------|--------|
| `Space + e` | File explorer (nvim-tree) |
| `Space + ff` | Find files (telescope) |
| `Space + fw` | Find word in files |
| `Space + fb` | Find buffers |
| `Space + fh` | Find help tags |
| `Space + fo` | Find old files |
| `Space + fz` | Current buffer lines |
| `Ctrl + n` | Toggle file tree |

### File Tree Navigation
| Key | Action |
|-----|--------|
| `Enter` or `l` | Open file and focus editor |
| `Tab` | Open file, stay in tree |
| `h` | Close folder or go to parent |
| `j/k` | Move up/down |
| `a` | Create new file/folder |
| `r` | Rename |
| `d` | Delete |
| `c` | Copy |
| `x` | Cut |
| `p` | Paste |

### Buffer Management
| Shortcut | Action |
|----------|--------|
| `Tab` | Next buffer |
| `Shift + Tab` | Previous buffer |
| `Space + x` | Close buffer |

### Window/Split Navigation
| Shortcut | Action |
|----------|--------|
| `Ctrl + h` | Move to left split |
| `Ctrl + j` | Move to bottom split |
| `Ctrl + k` | Move to top split |
| `Ctrl + l` | Move to right split |

### Theme & UI
| Shortcut | Action |
|----------|--------|
| `Space + th` | Theme selector |
| `Space + ch` | NvChad cheatsheet |

### Insert Mode
| Shortcut | Action |
|----------|--------|
| `jk` | Escape to normal mode |
| `Ctrl + s` | Save file |

### Command Mode
| Shortcut | Action |
|----------|--------|
| `;` | Enter command mode (instead of `:`) |

### Custom VSCode-like Tricks
| Shortcut | Action |
|----------|--------|
| `Space + i` | Insert space and enter insert mode |
| `Space + a` | Append space and enter insert mode with space |
| `Space + q` | Surround word with quotes |
| `Space + ;` | Add semicolon at end of line (preserves cursor) |

### Universal Block Formatting
| Shortcut | Action |
|----------|--------|
| `Space + f` | Format parentheses `()` - position cursor on `(` |
| `Space + F` | Format braces `{}` - position cursor on `{` |
| `Space + b` | Format brackets `[]` - position cursor on `[` |

#### Custom Tricks Explained

**Smart Insert (`Space + i`)**
- Inserts a space before cursor, then enters insert mode
- **Use case**: Quick spacing before typing new content

**Smart Append (`Space + a`)**  
- Appends space after cursor, enters insert mode with another space
- **Use case**: Adding spacing after current position

**Quote Word (`Space + q`)**
- Surrounds current word with double quotes using nvim-surround
- **Use case**: Quickly quote variables, strings, function names

**End Line Semicolon (`Space + ;`)**
- Marks position → goes to end of line → adds semicolon → returns to original position
- **Use case**: Add semicolon without losing cursor position (great for JavaScript/Dart)

#### Universal Block Formatting Explained

**Format Parentheses (`Space + f`)**
- **Position**: Cursor exactly on opening `(`
- **Action**: Transforms single-line parameter lists into multi-line format
- **Works with**: Function calls, constructors, method parameters
- **Pattern**: Handles commas with or without spaces (`,` or `, `)

**Format Braces (`Space + F`)**
- **Position**: Cursor exactly on opening `{`
- **Action**: Transforms single-line objects/maps into multi-line format
- **Works with**: Object literals, maps, hash tables, JSON-like structures

**Format Brackets (`Space + b`)**
- **Position**: Cursor exactly on opening `[`
- **Action**: Transforms single-line arrays/lists into multi-line format
- **Works with**: Arrays, lists, collections

#### Universal Formatting Examples

**Parentheses Example (`Space + f`):**
```dart
// Before (cursor on '('):
Actor(id: 1, name: 'John', profilePath: '', character: 'Hero');

// After Space + f:
Actor(
  id: 1,
  name: 'John',
  profilePath: '',
  character: 'Hero'
);
```

**Braces Example (`Space + F`):**
```dart
// Before (cursor on '{'):
Map user = {id: 1, name: 'John', age: 30, city: 'Madrid'};

// After Space + F:
Map user = {
  id: 1,
  name: 'John',
  age: 30,
  city: 'Madrid'
};
```

**Brackets Example (`Space + b`):**
```dart
// Before (cursor on '['):
List items = [item1, item2, item3, item4];

// After Space + b:
List items = [
  item1,
  item2,
  item3,
  item4
];
```

#### How Universal Formatting Works

**Technical Implementation:**
1. **Add newline after opening bracket**: `a<CR><Esc>`
2. **Find closing bracket**: `f)` / `f}` / `f]`
3. **Add newline before closing bracket**: `i<CR><Esc>`
4. **Select content inside brackets**: `vi(` / `vi{` / `vi[`
5. **Replace commas with newlines**: `:s/,\s*/,\r/g`
6. **Auto-indent entire block**: `va(=` / `va{=` / `va[=`

**Regex Pattern Explanation:**
- `,\s*` - Finds comma followed by zero or more whitespace characters
- `,\r` - Replaces with comma followed by newline
- Works with: `item,item`, `item, item`, `item,  item`

#### Configuration Location

**File**: `~/.config/nvim/lua/mappings.lua`

**Code Added:**
```lua
-- Format blocks - Position cursor on opening bracket
map("n", "<leader>f", "a<CR><Esc>f)i<CR><Esc>kvi(:s/,\\s*/,\\r/g<CR>va(=", { desc = "Format parentheses" })
map("n", "<leader>F", "a<CR><Esc>f}i<CR><Esc>kvi{:s/,\\s*/,\\r/g<CR>va{=", { desc = "Format braces" })
map("n", "<leader>b", "a<CR><Esc>f]i<CR><Esc>kvi[:s/,\\s*/,\\r/g<CR>va[=", { desc = "Format brackets" })
```

#### Language Support

**Works with any programming language:**
- **Dart/Flutter**: Constructors, widgets, maps, lists
- **JavaScript/TypeScript**: Functions, objects, arrays
- **Python**: Function calls, dictionaries, lists
- **Java/C#**: Method calls, objects, arrays
- **JSON**: Objects and arrays
- **And any language using `()`, `{}`, `[]`**

#### Usage Tips

1. **Precise positioning**: Cursor must be exactly on opening bracket
2. **Error message**: If not positioned correctly, command may not work
3. **Undo**: Use `u` to undo if formatting doesn't look right
4. **Consistent spacing**: Auto-indentation follows your language's indent settings
5. **Nested structures**: Works with nested brackets (formats current level only)

### Surround Plugin (nvim-surround)
| Shortcut | Action |
|----------|--------|
| `ysiw"` | Surround word with quotes |
| `ysiw)` | Surround word with parentheses |
| `ysiw}` | Surround word with braces |
| `ysiw]` | Surround word with brackets |
| `ds"` | Delete surrounding quotes |
| `ds)` | Delete surrounding parentheses |
| `cs"'` | Change quotes to single quotes |
| `cs")` | Change quotes to parentheses |

#### Surround Examples
```dart
// Before: hello
// After ysiw": "hello"

// Before: "hello"  
// After ds": hello

// Before: "hello"
// After cs"): (hello)
```

### Adding Custom Tricks
To add more VSCode-like tricks, edit `lua/mappings.lua`:

```lua
-- Custom keybinding format
map("n", "<leader>KEY", "VIM_COMMANDS", { desc = "Description" })

-- Examples:
map("n", "<leader>d", "yyp", { desc = "Duplicate line" })
map("n", "<leader>D", "yyP", { desc = "Duplicate line above" })  
map("n", "<leader>x", "dd", { desc = "Delete line" })
```

## 🖥️ Terminal Management

### Built-in NvChad Terminals
| Shortcut | Action |
|----------|--------|
| `Alt + i` | Toggle floating terminal |
| `Alt + h` | Toggle horizontal terminal |
| `Alt + v` | Toggle vertical terminal |

### Enhanced ToggleTerm (VS Code-like)
| Shortcut | Action |
|----------|--------|
| `Ctrl + \` | Toggle main terminal |
| `Space + 1` | Terminal 1 |
| `Space + 2` | Terminal 2 |
| `Space + 3` | Terminal 3 |
| `Space + 4` | Terminal 4 |
| `Space + tf` | Float terminal |
| `Space + th` | Horizontal terminal |
| `Space + tv` | Vertical terminal |

### Basic Terminal Commands
| Shortcut | Action |
|----------|--------|
| `Space + t1` | Basic terminal |
| `Space + t2` | Split terminal |
| `Space + t3` | Vertical split terminal |
| `Space + tt` | Terminal in new tab |

### Terminal Usage
| Key | Action |
|-----|--------|
| `Ctrl + x` | Close terminal |
| `exit` | Close terminal (type) |
| `jk` | Exit terminal insert mode |
| `ESC` | Alternative exit terminal insert mode |

### Terminal Mode Navigation (Enhanced)
| Shortcut | Action |
|----------|--------|
| `jk` or `ESC` | Exit terminal insert mode |
| `Ctrl + w + h` | Move to left window (from terminal) |
| `Ctrl + w + j` | Move to window below (from terminal) |
| `Ctrl + w + k` | Move to window above (from terminal) |
| `Ctrl + w + l` | Move to right window (from terminal) |
| `i` or `Enter` | Enter insert mode in terminal |

### Workspace/Tab Management
| Shortcut | Action |
|----------|--------|
| `Space + 1` | Go to Tab 1 (Code workspace) |
| `Space + 2` | Go to Tab 2 (Terminal workspace) |
| `Space + 3` | Go to Tab 3 (Additional workspace) |
| `Space + 4` | Go to Tab 4 (Extra workspace) |
| `Tab` | Next tab |
| `Shift + Tab` | Previous tab |
| `gt` | Next tab (vim command) |
| `gT` | Previous tab (vim command) |
| `1gt` | Go to tab 1 |
| `2gt` | Go to tab 2 |

### Terminal Workspace Setup
| Shortcut | Action |
|----------|--------|
| `Space + tw` | Create 2-terminal workspace tab |

#### Terminal Workspace Layout (Space + tw)
- **Top terminal**: Flutter development (`flutter run`)
- **Bottom terminal**: General commands (`git`, `claude`, etc.)

#### Navigation in Terminal Workspace
1. **Exit insert mode**: `jk` or `ESC`
2. **Move between terminals**: `Ctrl + w + k` (up) / `Ctrl + w + j` (down)
3. **Switch to code workspace**: `Space + 1`
4. **Return to terminal workspace**: `Space + 2`

### ToggleTerm (Floating Terminals)
| Shortcut | Action |
|----------|--------|
| `Ctrl + \` | Toggle main terminal |
| `Space + tf` | Float terminal |
| `Space + th` | Horizontal terminal |
| `Space + tv` | Vertical terminal |
| `Space + T1` | ToggleTerm 1 (floating) |
| `Space + T2` | ToggleTerm 2 (floating) |
| `Space + T3` | ToggleTerm 3 (floating) |
| `Space + T4` | ToggleTerm 4 (floating) |

### Quick Terminal Panels
| Shortcut | Action |
|----------|--------|
| `Space + t1` | Flutter terminal (bottom panel) |
| `Space + t2` | Claude terminal (bottom panel) |
| `Space + t3` | General terminal (bottom panel) |
| `Space + ts` | Quick terminal panel bottom |
| `Space + tv` | Terminal panel right |
| `Space + tt` | Full terminal tab |

### Complete Terminal → Editor Workflow
1. **In terminal**: Type commands normally
2. **Exit terminal insert**: `jk` or `ESC`
3. **Navigate to editor**: `Ctrl + w + k` (move up) or `Space + 1` (code tab)
4. **Back to terminal**: `Ctrl + w + j` (move down) or `Space + 2` (terminal tab)
5. **Enter terminal insert**: `i` or `Enter`

### Optimal Multi-Terminal Workflow
1. **Setup workspace**: `Space + tw` (creates 2-terminal tab)
2. **Code in Tab 1**: `Space + 1`
3. **Terminals in Tab 2**: `Space + 2`
4. **Quick switching**: `Space + 1` ↔ `Space + 2`
5. **Within terminal tab**: `Ctrl + w + j/k` between terminals

**Pro Tips**: 
- Use `Space + tw` for dedicated terminal workspace
- Use `Alt + i` for quick floating terminal
- Use `Space + 1/2` for instant workspace switching
- Terminal mode `jk` works just like insert mode

## 🤖 GitHub Copilot Chat

### Copilot Chat Commands
| Shortcut | Action |
|----------|--------|
| `Space + ca` | Copilot Authentication |
| `Space + cc` | Open Copilot Chat window |
| `Space + ce` | Explain current code/selection |
| `Space + cr` | Review current code |
| `Space + cf` | Fix issues in code |
| `Space + co` | Optimize current code |
| `Space + cd` | Generate documentation |
| `Space + ct` | Generate tests |

### Visual Mode (Select Code First)
| Shortcut | Action |
|----------|--------|
| `Space + cc` | Chat about selection |
| `Space + ce` | Explain selection |

### How to Use Copilot Chat

#### Setup & Authentication
1. **First time setup**: `Space + ca` (authenticate with GitHub)
2. **Check status**: `:Copilot status`

#### Basic Workflow
1. **Open chat**: `Space + cc`
2. **Ask questions** in the chat window
3. **Navigate between chat and code**: `Ctrl + w + h/j/k/l`
4. **Copy suggestions** manually and paste into your code

#### Effective Usage Methods

**Method 1: Quick Actions (Recommended)**
1. **Position cursor** on code you want to modify
2. **Use specific commands**:
   - `Space + cf` - Fix code issues
   - `Space + co` - Optimize performance
   - `Space + cd` - Generate documentation
   - `Space + ct` - Generate tests

**Method 2: Visual Selection**
1. **Select code** in visual mode (`v` or `V`)
2. **Press `Space + ce`** - Explain selection
3. **Or `Space + cc`** - General chat about selection

**Method 3: Open Chat for Complex Questions**
1. **`Space + cc`** - Opens chat window
2. **Ask detailed questions** like:
   - "How to implement custom animations in Flutter?"
   - "Best practices for state management in this widget?"
   - "How to optimize this code for performance?"

#### Example Flutter Workflows

**Widget Optimization:**
1. **Position cursor** on a Flutter widget
2. **`Space + ce`** - Get explanation of the widget
3. **`Space + co`** - Get optimization suggestions
4. **Copy and apply** suggestions manually

**Bug Fixing:**
1. **Select problematic code** in visual mode
2. **`Space + cf`** - Get fix suggestions
3. **Review suggestions** in chat window
4. **Apply fixes** manually

**Learning & Documentation:**
1. **`Space + cc`** - Open chat
2. **Ask**: "Explain Flutter widget lifecycle"
3. **Or**: "How to handle async operations in Flutter?"

### Chat Window Navigation
| Action | Method |
|--------|--------|
| **Exit chat window** | `jk` or `:q` |
| **Navigate to code** | `Ctrl + w + h/j/k/l` |
| **Navigate back to chat** | `Ctrl + w + h/j/k/l` |
| **Scroll in chat** | `j/k` or arrow keys |

### Important Notes
- **CopilotChat provides suggestions** - you must copy/paste manually
- **Auto-completion is disabled** - only chat interface available
- **Chat history is saved** - previous conversations persist
- **Context aware** - understands your current buffer/selection

### Pro Tips for Copilot Chat
1. **Be specific** in your questions:
   - ❌ "fix this code"
   - ✅ "fix null pointer exception in this function"

2. **Use visual selection** for targeted help:
   - Select the exact code you want help with

3. **Ask for alternatives**:
   - "Show me 3 different ways to implement this"
   - "What's a more efficient approach?"

4. **Learn Flutter patterns**:
   - "Best practices for this Flutter widget"
   - "How to make this widget more reusable"

5. **Copy useful snippets** from chat responses and save them

### Enabling Auto-Completion (Optional)
If you want automatic code suggestions while typing:
1. **Edit**: `lua/plugins/init.lua`
2. **Change**: `vim.g.copilot_enabled = true`
3. **Restart nvim**
4. **Use**: `Ctrl + l` to accept suggestions

## 🚀 Flutter Development

### Flutter Project Commands
| Shortcut | Action |
|----------|--------|
| `Space + fr` | Flutter Run |
| `Space + fd` | Flutter Devices |
| `Space + fe` | Flutter Emulators |
| `Space + fR` | Flutter Hot Reload |
| `Space + fS` | Flutter Hot Restart |
| `Space + fq` | Flutter Quit |
| `Space + ft` | Flutter DevTools |
| `Space + fo` | Flutter Outline Toggle |
| `Space + fl` | Flutter LSP Restart |

### Dart Language Features
| Shortcut | Action |
|----------|--------|
| `Space + da` | Dart Analyzer |
| `Space + df` | Dart Format |

### LSP Features (Dart/Flutter Files)
| Shortcut | Action |
|----------|--------|
| `Space + lf` | Format code |
| `Space + ca` | Code Actions (Widget Wrapping!) |
| `Space + rn` | Rename Symbol |
| `gd` | Go to Definition |
| `gr` | Go to References |
| `K` | Hover Documentation |

### Widget Wrapping Workflow
1. **Position cursor** on widget name (e.g., `Text`)
2. **Press `Space + ca`**
3. **Select wrap option**:
   - Wrap with Container
   - Wrap with Padding
   - Wrap with Center
   - Wrap with Column/Row
   - Wrap with Expanded
   - Wrap with SizedBox

### Alternative Widget Wrapping
1. **Select widget in Visual mode**
2. **Press `Space + ca`**
3. **Choose wrap option**

## 📁 Project Workflow

### Flutter Development Workflow
1. **Open project**: `nvim .`
2. **Browse files**: `Space + e`
3. **Quick file search**: `Space + ff`
4. **Search in files**: `Space + fw`
5. **Run Flutter**: `Space + fr`
6. **Hot reload**: `Space + fR`
7. **Format code**: `Space + lf` (auto-formats on save)

### Terminal Workflow for Flutter
1. **Main terminal** (`Space + 1`): `flutter run`
2. **Secondary terminal** (`Space + 2`): Git operations
3. **Third terminal** (`Space + 3`): Package management
4. **Fourth terminal** (`Space + 4`): Testing/debugging

### Quick Actions
- **Save & format**: `Ctrl + s` (auto-formats Dart files)
- **Escape insert**: `jk`
- **Command mode**: `;`
- **File tree toggle**: `Ctrl + n`

## 🔍 Search & Navigation

### Telescope (Fuzzy Finder)
| Shortcut | Action |
|----------|--------|
| `Space + ff` | Find files by name |
| `Space + fw` | Find text in files |
| `Space + fb` | Find open buffers |
| `Space + fh` | Find help documentation |
| `Space + fo` | Find recently opened files |
| `Space + fz` | Find lines in current buffer |

### LSP Navigation (in Dart files)
| Shortcut | Action |
|----------|--------|
| `gd` | Go to definition |
| `gr` | Find all references |
| `K` | Show hover info/documentation |
| `Space + ca` | Show code actions |
| `Space + rn` | Rename symbol |

## 🎨 Customization

### Theme Management
- `Space + th` - Open theme selector
- Preview themes in real-time
- Themes persist across sessions

### File Tree Customization
- Icons require Nerd Font (JetBrainsMono Nerd Font configured)
- Tree opens automatically when needed
- File type icons and folder structure

## 🔧 Configuration Files Quick Reference

### Key Configuration Files
| File | Purpose |
|------|---------|
| `lua/chadrc.lua` | Main NvChad configuration |
| `lua/mappings.lua` | Custom key mappings |
| `lua/options.lua` | Neovim editor options |
| `lua/configs/lspconfig.lua` | Language server setup |
| `lua/configs/conform.lua` | Code formatting |
| `lua/plugins/init.lua` | Plugin definitions |

### Important Features Configured
- ✅ Dart LSP with Flutter support
- ✅ Auto-formatting on save for Dart
- ✅ Flutter-tools plugin integration
- ✅ Multiple terminal support
- ✅ Widget wrapping via code actions
- ✅ Hot reload/restart functionality
- ✅ Nerd Font icons
- ✅ Syntax highlighting for Dart/Flutter

## 🚨 Troubleshooting

### Common Issues
| Issue | Solution |
|-------|----------|
| Icons not showing | Configure terminal to use Nerd Font |
| LSP not working | `:checkhealth lsp` |
| Slow startup | `:Lazy profile` |
| Formatter not working | Restart LSP: `Space + fl` |

### Health Checks
- `:checkhealth` - Overall health
- `:checkhealth lsp` - LSP status
- `:Lazy` - Plugin status

## 💡 Pro Tips

1. **Theme switching**: Use `Space + th` to quickly switch themes
2. **Multiple terminals**: Use numbered terminals (`Space + 1-4`) for different tasks
3. **Widget wrapping**: Position cursor on widget name, then `Space + ca`
4. **Quick save**: `Ctrl + s` saves and auto-formats Dart files
5. **File navigation**: `Space + ff` is faster than file tree for known files
6. **Hot reload**: `Space + fR` during development for instant updates
7. **Terminal management**: Use `Alt + i` for quick commands, numbered terminals for persistent tasks
8. **LSP features**: `K` for documentation, `gd` for definition, `Space + ca` for actions

## ⚡ Project Opening Optimization

### Terminal Aliases & Commands
| Command | Action |
|---------|--------|
| `anvim` | Open Alacritty + Neovim in current directory |
| `z project-name` | Jump to any visited project (zoxide) |
| `nv` | Interactive project selector with fuzzy search |

### Combined Workflow Examples
```bash
# Method 1: Jump + Open
z my-flutter-app    # Jump to project
anvim              # Open Neovim in Alacritty

# Method 2: Direct selector
nv                 # Choose from project list

# Method 3: Current directory
cd ~/projects/my-app
anvim              # Open immediately
```

### File Explorer Integration (Nemo)
- **Right-click on folder** → "Open with Neovim"
- **Right-click on file** → "Edit with Neovim"
- Opens directly in Alacritty + Neovim

### Quick Setup Guide
```bash
# Reload bash configuration
source ~/.bashrc

# Test the new commands
anvim              # Should open Neovim in current dir
z projects         # Should jump to projects folder (after visiting it once)
nv                 # Should show project selector
```

### Zoxide Usage (Smart Directory Jumping)
```bash
# Visit directories normally first
cd ~/projects/my-app
cd ~/projects/another-app

# Then jump instantly later
z my-app           # Jumps to ~/projects/my-app
z another          # Jumps to ~/projects/another-app
z app              # Smart matching to recently visited
```

### Project Launcher Script Features
- **Fuzzy search** (if fzf installed): Interactive search through projects
- **Simple menu** (fallback): Numbered list selection
- **Git project detection**: Only shows directories with `.git` folders
- **Custom directory**: `nv ~/custom/projects/path`

## 🔗 Zellij Multi-Project Workflow (Advanced)

### Zellij Commands & Aliases
| Alias | Full Command | Action |
|-------|--------------|--------|
| `zl` | `zellij list-sessions` | List all active sessions |
| `za project` | `zwork attach project` | Attach to session or create new |
| `zs project` | `zwork start project` | Start new session with default layout |
| `zf project` | `zwork flutter project` | Start with Flutter-optimized layout |
| `zd project` | `zwork dev project` | Start with development layout |

### Multi-Project Workflow Examples

#### Daily Workflow Setup
```bash
# Morning setup - start multiple projects
zf mobile-app           # Flutter project with hot reload layout
zd api-backend          # Backend with server/logs/git terminals  
zs web-frontend         # Frontend with dev server layout

# Check all active sessions
zl                      # Lists: mobile-app, api-backend, web-frontend

# Switch between projects instantly
za mobile-app           # Jump to Flutter project
za api-backend          # Jump to backend
za web-frontend         # Jump to frontend
```

#### Session Management
```bash
# List projects and sessions
zwork list              # Shows available projects and active sessions

# Stop specific session  
zwork stop mobile-app   # Kill mobile-app session

# Clean all sessions
zwork clean             # Kill all zellij sessions
```

### Zellij Layouts

#### Flutter Project Layout (`zf project`)
```
┌─────────────────────────────────────────────────────┐
│ [Flutter Dev] [Testing] [DevTools]                  │
├─────────────────────────────────┬───────────────────┤
│                                 │ flutter run       │
│            nvim .               │ Hot reload logs   │
│         (65% width)             │    (35% width)    │
│                                 ├───────────────────┤
│                                 │ git status        │
│                                 │ git commands      │
└─────────────────────────────────┴───────────────────┘
```

#### Development Layout (`zd project`)  
```
┌─────────────────────────────────────────────────────┐
│ [Code] [Monitoring]                                 │
├─────────────────────────────────┬───────────────────┤
│                                 │ dev-server        │
│            nvim .               │ (npm run dev)     │
│         (70% width)             │    (60% height)   │
│                                 ├───────────────────┤
│                                 │ commands          │
│                                 │ (git, tests)      │
└─────────────────────────────────┴───────────────────┘
```

### Zellij Keybindings (Inside Sessions)

#### Pane Navigation
| Key | Action |
|-----|--------|
| `Alt + h/j/k/l` | Move between panes (vim-style) |
| `Alt + \` | Split pane vertically |
| `Alt + -` | Split pane horizontally |

#### Tab Management  
| Key | Action |
|-----|--------|
| `Alt + t` | New tab |
| `Alt + 1/2/3/4/5` | Switch to tab 1-5 |

#### Session Control
| Key | Action |
|-----|--------|
| `Alt + d` | Detach from session (keeps running) |
| `Alt + q` | Quit session |
| `Alt + r` | Enter resize mode |

#### Resize Mode (After `Alt + r`)
| Key | Action |
|-----|--------|
| `h/j/k/l` | Resize panes |
| `Esc/Enter/Space` | Exit resize mode |

### Advanced Multi-Project Scenarios

#### Scenario 1: Full-Stack Development
```bash
# Start all related projects
zf mobile-app           # Flutter frontend
zd api-server           # Node.js/Python backend  
zs database-admin       # Database management
zs devops-scripts       # Deployment scripts

# Work flow:
za mobile-app           # Code mobile features
za api-server           # Update API endpoints
za mobile-app           # Test integration
za devops-scripts       # Deploy updates
```

#### Scenario 2: Multiple Client Projects
```bash
# Client A
zf client-a-mobile
zd client-a-web

# Client B  
zf client-b-mobile
zd client-b-backend

# Switch context per client
za client-a-mobile      # Work on client A
za client-b-mobile      # Switch to client B
```

### Zellij vs NvChad Terminals Comparison

| Feature | NvChad Terminals | Zellij Sessions |
|---------|------------------|------------------|
| **Project isolation** | Single project focus | Multiple projects simultaneously |
| **Session persistence** | Lost on nvim close | Survives computer restart |
| **Layout complexity** | Simple splits | Complex predefined layouts |
| **Context switching** | Manual navigation | Instant project switching |
| **Resource usage** | Lower (within nvim) | Higher (separate sessions) |
| **Integration** | Tight nvim integration | Terminal-based, editor agnostic |

### Recommended Usage Strategy

**Use Zellij when:**
- Working on 2+ projects simultaneously
- Need persistent sessions across restarts
- Complex terminal layouts required
- Collaborating (easy session sharing)

**Use NvChad terminals when:**
- Single project focus
- Quick terminal tasks
- Tight editor integration needed
- Minimal resource usage preferred

### Combined Workflow (Best of Both)
```bash
# Use Zellij for project management
za mobile-app           # Enter project session

# Inside the session, use nvim with built-in terminals
# nvim opens automatically with the layout
# Use Space + 1/2/3/4 for nvim terminal tabs
# Use Alt + h/j/k/l for zellij pane navigation
```

### Quick Setup Test
```bash
# Reload configuration
source ~/.bashrc

# Test zellij installation
zellij --version

# Test workflow manager
zwork help

# List available projects (create ~/projects if needed)
zwork list

# Try starting a test session
zs test-project
```

---

**Remember**: Leader key is `Space` - most commands start with it!

**Optimized Workflow**: `z project` → `anvim` → Code like a pro!

**Flutter Workflow**: Open project → `Space + e` (browse) → `Space + fr` (run) → `Space + fR` (reload) → `Space + lf` (format)