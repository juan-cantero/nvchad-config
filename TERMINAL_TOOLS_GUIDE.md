# Terminal Tools Configuration Guide
## Zoxide, FZF, Bat & Ripgrep Setup

This guide documents the installation and configuration of modern terminal tools that enhance productivity and file navigation.

---

## 🧭 Zoxide - Smart Directory Navigation

### What is Zoxide?
**Zoxide** is a smarter `cd` command that remembers the directories you visit most frequently and allows you to jump to them using fuzzy matching.

### Installation
```bash
# Already installed at: ~/.local/bin/zoxide
# Auto-installed with NvChad setup
```

### Configuration in .bashrc
```bash
# Zoxide initialization (smart cd)
eval "$(zoxide init bash)"
```

### Usage Commands
| Command | Description | Example |
|---------|-------------|---------|
| `z <directory>` | Jump to directory | `z nvim` → jumps to ~/.config/nvim |
| `zi` | Interactive directory picker with fzf | `zi` → shows fuzzy finder |
| `z foo bar` | Jump to dir containing both words | `z my project` → jumps to ~/my-project |
| `z -` | Jump to previous directory | `z -` |

### Why Use Zoxide?
- ✅ **Intelligent**: Learns your most visited directories
- ✅ **Fast**: No need to type full paths
- ✅ **Fuzzy**: Partial matches work (`z nv` finds nvim config)
- ✅ **Cross-shell**: Works in bash, zsh, fish, etc.

---

## 🔍 FZF - Fuzzy Finder

### What is FZF?
**FZF** is a command-line fuzzy finder that allows you to interactively search through lists of files, command history, processes, and more.

### Installation
```bash
sudo apt install fzf
```

### Complete Configuration in .bashrc
```bash
# FZF Default Options - Modern dark theme with borders
export FZF_DEFAULT_OPTS="
--height 50% 
--layout=reverse 
--border=rounded
--margin=1 
--padding=1
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
--color=border:#6272a4,preview-bg:#282a36
--bind='?:toggle-preview'
--preview-window=right:50%:hidden
"

# Use ripgrep for file searching (faster, respects .gitignore)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!.dart_tool/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# File finder with bat preview (Ctrl+T)
export FZF_CTRL_T_OPTS="
--preview 'bat --color=always --style=header,grid --line-range :300 {} 2>/dev/null || tree -C {} 2>/dev/null || ls -la {}'
--preview-window=right:50%:wrap
--bind='ctrl-/:toggle-preview'
"

# History search with command preview (Ctrl+R)
export FZF_CTRL_R_OPTS="
--preview 'echo {}'
--preview-window up:3:hidden:wrap
--bind '?:toggle-preview'
--color header:italic
"

# Directory finder with tree preview (Alt+C)
export FZF_ALT_C_OPTS="
--preview 'tree -C {} | head -200'
--preview-window=right:50%:wrap
"
```

### Built-in Keybindings
| Keybinding | Function | Description |
|------------|----------|-------------|
| `Ctrl+T` | File finder | Find files in current directory with preview |
| `Ctrl+R` | History search | Search command history interactively |
| `Alt+C` | Directory changer | Find and cd to directory |
| `?` | Toggle preview | Show/hide preview window |
| `Ctrl+/` | Toggle preview | Alternative preview toggle |

### Custom Functions Added
```bash
# Enhanced file finder and editor
fzf_file_edit() {
  local file
  file=$(fzf --preview 'bat --color=always --style=header,grid --line-range :50 {}' --preview-window=right:60%:wrap) && [ -f "$file" ] && nvim "$file"
}
alias fe='fzf_file_edit'

# Search in files and edit (interactive grep)
fzf_grep_edit() {
  local line
  line=$(rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf --ansi \
        --delimiter : \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3') &&
  [ -n "$line" ] && nvim $(cut -d: -f1 <<< "$line") +$(cut -d: -f2 <<< "$line")
}
alias fs='fzf_grep_edit'

# Git branch selector
fzf_git_branch() {
  git branch -a | grep -v HEAD | sed 's/^..//' | sed 's/remotes\///' | sort -u | 
  fzf --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES
}
alias gb='fzf_git_branch'

# Process killer
fzf_kill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}
alias fkill='fzf_kill'
```

### Custom Command Usage
| Command | Purpose | Example Usage |
|---------|---------|---------------|
| `fe` | Find and edit file | `fe` → interactive file picker → opens in nvim |
| `fs <term>` | Search in files and edit | `fs "TODO"` → finds TODO in files → jump to line |
| `gb` | Git branch selector | `gb` → interactive branch picker with log preview |
| `fkill` | Interactive process killer | `fkill` → pick process to kill |

### Why Use FZF?
- ✅ **Interactive**: Visual search interface
- ✅ **Fast**: Handles thousands of files instantly
- ✅ **Extensible**: Custom functions for any workflow
- ✅ **Preview**: See file contents before opening
- ✅ **Integrations**: Works with git, history, processes

---

## 🎨 Bat - Better Cat with Syntax Highlighting

### What is Bat?
**Bat** is a `cat` replacement with syntax highlighting, line numbers, git integration, and automatic paging.

### Installation
```bash
# Download and install .deb package
curl -fsSL https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb -o /tmp/bat.deb
sudo dpkg -i /tmp/bat.deb
```

### Usage Commands
| Command | Description | Example |
|---------|-------------|---------|
| `bat file.js` | View file with syntax highlighting | `bat package.json` |
| `bat --style=numbers file.py` | Show with line numbers only | `bat --style=numbers app.py` |
| `bat -A file.txt` | Show all characters (whitespace) | `bat -A config.yml` |
| `bat file1.js file2.ts` | View multiple files | `bat *.dart` |
| `cat file.log \| bat -l log` | Pipe with language hint | `git log --oneline \| bat -l gitlog` |

### Integration with FZF
Bat is used in FZF previews to show:
- **File contents** with syntax highlighting
- **Line numbers** and git blame info
- **Specific lines** highlighted (in search results)

### Configuration Options
```bash
# Bat configuration (optional - can be set in ~/.config/bat/config)
export BAT_THEME="Dracula"  # Theme options: GitHub, Monokai Extended, etc.
export BAT_STYLE="numbers,changes,header,grid"  # Default style components
```

### Why Use Bat?
- ✅ **Syntax highlighting**: Automatic language detection
- ✅ **Git integration**: Shows file changes
- ✅ **Line numbers**: Easy reference
- ✅ **Paging**: Automatic for large files
- ✅ **Themes**: Multiple color schemes

---

## 🔥 Ripgrep - Ultra-Fast Text Search

### What is Ripgrep?
**Ripgrep (rg)** is a line-oriented search tool that recursively searches directories for a regex pattern. It's 10-100x faster than grep.

### Installation
```bash
# Download and install .deb package
curl -fsSL https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb -o /tmp/ripgrep.deb
sudo dpkg -i /tmp/ripgrep.deb
```

### Common Usage Commands
| Command | Description | Example |
|---------|-------------|---------|
| `rg "pattern"` | Basic search | `rg "function"` |
| `rg "pattern" --type js` | Search in specific file types | `rg "useState" --type ts` |
| `rg "pattern" -A 3 -B 1` | Show context lines | `rg "TODO" -A 2 -B 1` |
| `rg "pattern" --glob "*.dart"` | Search with glob pattern | `rg "class" --glob "*.dart"` |
| `rg "pattern" --no-ignore` | Include ignored files | `rg "secret" --no-ignore` |
| `rg -i "pattern"` | Case insensitive | `rg -i "error"` |
| `rg -C 5 "pattern"` | Show 5 lines context | `rg -C 3 "import"` |

### Integration with FZF
Ripgrep powers FZF file finding:
```bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
```

### Advanced Examples
```bash
# Find all TODO comments with context
rg "TODO|FIXME|BUG" -A 2 -B 1 --type-add 'dart:*.dart' --type dart

# Search for function definitions in TypeScript
rg "^function\s+\w+|^const\s+\w+\s*=" --type ts

# Find all imports in Dart files
rg "import\s+['\"].*['\"]" --glob "*.dart" -o

# Search in specific directories only
rg "class.*Component" lib/ src/

# Find files containing multiple terms
rg "database.*connection" --type js --files-with-matches
```

### Why Use Ripgrep?
- ✅ **Speed**: 10-100x faster than grep/ag
- ✅ **Smart**: Respects .gitignore automatically
- ✅ **Regex**: Full regex support with Rust regex engine
- ✅ **Types**: Built-in file type detection
- ✅ **Output**: Beautiful colored output

---

## 🔄 Tool Integration Workflow

### Typical Development Workflow
1. **Navigate to project**: `z myproject`
2. **Find files quickly**: `fe` or `Ctrl+T`
3. **Search in codebase**: `fs "searchterm"` or `rg "pattern"`
4. **View file contents**: `bat filename`
5. **Switch git branches**: `gb`
6. **Go back**: `z -` or `cd -`

### Power User Combinations
```bash
# Find and edit all files containing "TODO"
fs TODO

# Find large files and preview them
find . -size +1M | fzf --preview 'bat {}'

# Search for function definitions and edit
rg "^function|^const.*=" --type js | fzf --delimiter : --preview 'bat {1}' 

# Interactive git log with file changes
git log --oneline | fzf --preview 'git show --color=always {1}'
```

---

## 📋 Summary

| Tool | Purpose | Key Benefit |
|------|---------|-------------|
| **Zoxide** | Smart directory navigation | Never type full paths again |
| **FZF** | Interactive fuzzy finder | Visual search for everything |
| **Bat** | Enhanced file viewing | Syntax highlighting + git integration |
| **Ripgrep** | Ultra-fast text search | 100x faster than traditional grep |

### Combined Power
These tools work together to create a modern, efficient terminal workflow:
- **Zoxide** gets you to the right directory instantly
- **FZF** finds the right file visually
- **Bat** shows you what's in the file beautifully  
- **Ripgrep** searches through your entire codebase in milliseconds

### Installation Status
- ✅ Zoxide: Pre-installed and configured
- ✅ FZF: Installed via `apt`, fully configured
- ✅ Bat: Installed via .deb package
- ✅ Ripgrep: Installed via .deb package

All tools are integrated and ready to use with custom themes, aliases, and functions!