# 💾 Session Management & File Saves Guide

**Juanqui's NvChad Development Environment**

This guide covers everything you need to know about managing your work, sessions, and keeping your development environment clean and organized.

---

## 📋 **Table of Contents**

1. [Quick Reference](#-quick-reference)
2. [Saving Your Work](#-saving-your-work)
3. [Session Management](#-session-management)
4. [Buffer Management](#-buffer-management)
5. [Swap File Management](#-swap-file-management)
6. [Best Practices](#-best-practices)
7. [Troubleshooting](#-troubleshooting)

---

## ⚡ **Quick Reference**

### **Essential Commands:**
| Command | Key | What It Does |
|---------|-----|--------------|
| **Save File** | `Ctrl+S` or `:w` | Save current file |
| **Save Session** | `<leader>ss` | Save entire workspace session |
| **Open Dashboard** | `<leader>od` | Open dashboard anytime |
| **Restore Last Session** | `ls` (dashboard) | Load your last session |
| **Clean Buffers** | `<leader>bc` | Clean unused files from memory |
| **Exit Neovim** | `q` (dashboard) or `:qa` | Quit all windows |

### **Dashboard Commands:**
| Key | Action |
|-----|--------|
| `ls` | Restore Last Session |
| `cs` | Session for Current Directory |
| `q` | Exit Neovim |

---

## 💾 **Saving Your Work**

### **1. Save Individual Files**
```vim
:w              " Save current file
:wa             " Save all open files
<Ctrl+S>        " Save current file (if mapped)
```

### **2. Save with Auto-format (Dart files)**
- **Dart files auto-format on save** - just use `:w` or `<Ctrl+S>`
- **Manual format:** `<leader>lf` (leader + lf)

### **3. Check If File is Saved**
- **Modified files** show `[+]` in statusline
- **Saved files** show normal filename
- **Use `:w` frequently** - it's instant and safe

---

## 🏠 **Session Management**

Sessions save your entire workspace: open files, window layout, current directory, and more.

### **📁 What Gets Saved in Sessions:**
- ✅ **Current directory** (your project folder)
- ✅ **Window layout** (splits, tabs)
- ✅ **Window sizes** (your custom layouts)
- ❌ **Hidden buffers** (cleaned automatically)
- ❌ **NvimTree state** (cleaned before save)

### **💾 Saving Sessions**

#### **Method 1: Keyboard Shortcut (Recommended)**
```
<leader>ss    " (Space + ss)
```
**What happens:**
1. ✅ Saves current session with your layout
2. ✅ Keeps terminals and their positions
3. ✅ Keeps NvimTree if open
4. 🧹 Only removes problematic floating windows (notifications, etc.)
5. 💬 Shows notification: "💾 Session saved! (with terminals & layout)"

#### **Method 2: Manual Command**
```vim
:lua require("persistence").save()
```

### **🔄 Restoring Sessions**

#### **From Dashboard (Recommended):**
- Start Neovim → Dashboard appears with your beautiful robot
- Press `ls` → Restore Last Session
- Press `cs` → Session for Current Directory

#### **With Keyboard Shortcuts:**
```
<leader>ql    " Restore last session
<leader>qs    " Restore session for current directory
```

#### **Manual Commands:**
```vim
:lua require("persistence").load({ last = true })    " Last session
:lua require("persistence").load()                   " Current directory session
```

### **🛑 Stop Session Saving**
```
<leader>qd    " Don't save current session
```
Use this when you're in a temporary workspace you don't want to save.

---

## 📂 **Buffer Management**

**Buffers** = Files in memory. Too many buffers can make sessions messy.

### **🧹 Clean Unused Buffers**
```
<leader>bc    " Clean unused buffers
```
**What it does:**
- Removes files that aren't currently displayed
- Keeps only the files you're actively working on
- Shows notification: "🧹 Cleaned X unused buffers"

### **📁 Close Specific Buffers**
```
<leader>bd    " Close current buffer
<leader>ba    " Close all buffers except current
:bd           " Close current buffer (manual)
```

### **👀 View Open Buffers**
```
:ls           " List all buffers
:buffers      " Same as :ls
```

---

## 🔄 **Swap File Management**

**Swap files** cause "Recover or Edit Anyway" prompts. We've disabled them for a cleaner experience.

### **✅ Current Configuration:**
- **Swap files:** Disabled (no more recovery prompts!)
- **Persistent undo:** Enabled (better than swap files)
- **Auto-cleanup:** Happens on session save

### **🧹 Manual Swap File Cleanup**
```
<leader>sw    " Clean all swap files in project
```
**When to use:** If you ever see .swp files or get recovery prompts.

### **📁 Where Undo History is Stored:**
```
~/.local/state/nvim/undo/
```
This gives you unlimited undo history between sessions (better than swap files).

---

## 🎯 **Best Practices**

### **📅 Daily Workflow:**

#### **🌅 Starting Work:**
1. **Navigate to project:** `cd ~/my-project`
2. **Open Neovim:** `nvim`
3. **Dashboard appears** with your custom robot
4. **Choose your action:**
   - Press `ls` → Restore your last session
   - Press `cs` → Restore session for current directory
   - Press `ff` → Find and open files

#### **💻 During Work:**
1. **Save files frequently:** `:w` or `<Ctrl+S>`
2. **Clean buffers occasionally:** `<leader>bc`
3. **Save session when switching projects:** `<leader>ss`

#### **🌙 Ending Work:**
1. **Save all files:** `:wa`
2. **Save session:** `<leader>ss` (you'll see confirmation)
3. **Exit cleanly:** `:qa` or `q` from dashboard

### **🗂️ Project Management:**

#### **📁 Working on Multiple Projects:**
```bash
# Terminal workflow:
cd ~/project1
nvim                    # Opens to dashboard
# Press 'cs' for project1 session

cd ~/project2  
nvim                    # Opens to dashboard  
# Press 'cs' for project2 session
```

#### **💾 Session Strategy:**
- **One session per project directory**
- **Save session before switching projects**
- **Use `cs` for project-specific sessions**
- **Use `ls` for your most recent work**

### **🧹 Maintenance:**

#### **Weekly Cleanup:**
```
<leader>bc    " Clean unused buffers
<leader>sw    " Clean swap files (if any)
```

#### **When Sessions Get Messy:**
1. Close unnecessary files: `<leader>bd`
2. Clean buffers: `<leader>bc`
3. Save clean session: `<leader>ss`

---

## 🔧 **Troubleshooting**

### **❓ Common Issues:**

#### **🔄 "Found swap file" or "Recover or Edit Anyway" prompts:**
**Solution:** Run `<leader>sw` to clean swap files.
**Prevention:** This shouldn't happen anymore with our config.

#### **📁 Too many files open when restoring session:**
**Solution:** 
1. `<leader>bc` to clean buffers
2. `<leader>ss` to save clean session

#### **💾 Session not saving properly:**
**Check:**
1. Are you in the right directory? (`:pwd`)
2. Do you have write permissions?
3. Try manual save: `:lua require("persistence").save()`

#### **🚪 Can't exit Neovim:**
**Solutions:**
```vim
:qa           " Quit all
:qa!          " Force quit all (loses unsaved changes)
:wqa          " Save all and quit
```

#### **📂 Session restored in wrong directory:**
**Fix:**
1. Navigate to correct directory: `:cd /path/to/project`
2. Save new session: `<leader>ss`

### **🔍 Debug Commands:**

#### **Check session status:**
```vim
:echo v:this_session                    " Current session file
:echo getcwd()                          " Current directory
:ls                                     " List open buffers
```

#### **Session file locations:**
```bash
~/.local/state/nvim/sessions/           # Session files
~/.local/state/nvim/undo/               # Undo history
```

---

## 🎮 **All Commands Summary**

### **File Operations:**
| Command | Key | Description |
|---------|-----|-------------|
| Save file | `:w` | Save current file |
| Save all | `:wa` | Save all open files |
| Close file | `<leader>bd` | Close current buffer |

### **Session Operations:**
| Command | Key | Description |
|---------|-----|-------------|
| Save session | `<leader>ss` | Save workspace (with terminals & layout) |
| Load last session | `<leader>ql` | Restore last session |
| Load directory session | `<leader>qs` | Restore current dir session |
| Stop session saving | `<leader>qd` | Don't save on exit |

### **Buffer Management:**
| Command | Key | Description |
|---------|-----|-------------|
| Clean unused buffers | `<leader>bc` | Remove hidden buffers |
| Close all except current | `<leader>ba` | Keep only current file |
| List buffers | `:ls` | Show all open buffers |

### **Navigation:**
| Command | Key | Description |
|---------|-----|-------------|
| Open dashboard | `<leader>od` | Access dashboard anytime |

### **Maintenance:**
| Command | Key | Description |
|---------|-----|-------------|
| Clean swap files | `<leader>sw` | Remove .swp files |
| Exit Neovim | `:qa` | Quit all windows |

### **Tab Management:**
| Command | Key | Description |
|---------|-----|-------------|
| Move tab right | `<leader>t>` | Move current tab one position right |
| Move tab left | `<leader>t<` | Move current tab one position left |
| Move tab to first | `<leader>tf` | Move current tab to beginning |
| Move tab to last | `<leader>tl` | Move current tab to end |
| Close current tab | `<leader>tc` | Close entire tab |
| Go to tab 1 | `<leader>1` | Jump to first tab |
| Go to tab 2 | `<leader>2` | Jump to second tab |
| Go to tab 3 | `<leader>3` | Jump to third tab |
| Go to tab 4 | `<leader>4` | Jump to fourth tab |

### **Dashboard (on startup):**
| Key | Action |
|-----|--------|
| `ls` | Restore Last Session |
| `cs` | Session for Current Directory |
| `ff` | Find File |
| `fo` | Recent Files |
| `fw` | Find Word |
| `th` | Themes |
| `ch` | Mappings |
| `q` | Exit |

---

## 🚀 **Pro Tips**

### **⚡ Efficiency Hacks:**
1. **Use `<leader>ss` frequently** - it's fast and keeps sessions clean
2. **Start each project session with `cs`** - keeps projects separate
3. **Use `<leader>bc` when switching between many files** - keeps memory clean
4. **The dashboard is your friend** - use `ls` to jump back into work instantly

### **🎯 Workflow Optimization:**
1. **Save session before lunch/breaks** - come back instantly
2. **One terminal per project** - keep contexts separate  
3. **Use notifications** - they confirm your actions worked
4. **Trust the automation** - buffers and swap files clean automatically

### **🛡️ Safety:**
- **Sessions auto-clean** - no manual maintenance needed
- **Undo history persists** - better than swap file recovery
- **Notifications confirm actions** - you always know what happened
- **Multiple restore options** - `ls` for last work, `cs` for current project

---

**✨ Your development environment is now optimized for maximum productivity with minimal maintenance! ✨**

*Last updated: Configuration in `/home/juan/.config/nvim/`*