# NvChad Configuration Migration Guide for Windows 11

## Overview
This guide helps you migrate the complete NvChad development environment from Linux to Windows 11. This configuration includes enhanced statusline, floating UI, Flutter development tools, and modern terminal management.

## Prerequisites Installation (Windows 11)

### 1. Install Required Software
```powershell
# Install via winget (Windows Package Manager)
winget install Git.Git
winget install Neovim.Neovim
winget install Microsoft.WindowsTerminal
winget install JanDeDobbeleer.OhMyPosh  # For Starship alternative
```

### 2. Install Package Managers
```powershell
# Install Chocolatey (optional but recommended)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Node.js (for LSP servers)
winget install OpenJS.NodeJS

# Install Python (for Python LSP)
winget install Python.Python.3.11
```

### 3. Install Fonts (Important for Icons)
```powershell
# Install Nerd Font (required for icons in statusline)
# Download from: https://github.com/ryanoasis/nerd-fonts/releases
# Recommended: JetBrainsMono Nerd Font or FiraCode Nerd Font
```

### 4. Setup PowerShell Profile (Optional - for better terminal experience)
```powershell
# Create PowerShell profile
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

# Add to profile for better experience
notepad $PROFILE
```

Add to profile:
```powershell
# Better PowerShell experience
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
```

## Configuration Migration Steps

### Step 1: Clone the Configuration Repository
```cmd
# Navigate to your user's AppData directory (Windows equivalent of ~/.config)
cd %LOCALAPPDATA%

# Clone the NvChad configuration
git clone https://github.com/juan-cantero/nvchad-config.git nvim
```

### Step 2: Directory Structure Verification
Ensure your Windows structure matches:
```
%LOCALAPPDATA%/nvim/
├── lua/
│   ├── chadrc.lua              # Main NvChad config
│   ├── configs/
│   │   └── statusline.lua      # Custom statusline config
│   └── plugins/
│       └── init.lua            # All plugin configurations
├── lazy-lock.json              # Plugin version lock
├── nvchad-dev-cheatsheet.md    # Development cheatsheet
└── WINDOWS11_MIGRATION_GUIDE.md # This file
```

### Step 3: Launch Neovim
```cmd
nvim
```

First launch will:
- Install lazy.nvim plugin manager automatically
- Download all configured plugins
- Install LSP servers and dependencies
- Setup the enhanced statusline and UI

## Plugin Configuration Details

### Enhanced Features You'll Get:
1. **Lualine Statusline**: Project-relative paths in purple
2. **Noice.nvim**: Floating command UI and notifications
3. **ToggleTerm**: Advanced terminal management
4. **Flutter Tools**: Complete Flutter development setup
5. **Copilot Chat**: AI assistance (optional)
6. **nvim-surround**: Text manipulation tools

### Key Bindings (Same as Linux):
- `Ctrl + \` - Toggle floating terminal
- `Alt + h/v/i` - Terminal variations
- `<leader>ff` - Find files (Space + ff)
- `<leader>fw` - Find in files
- `:` - Floating command palette
- `/` - Floating search

## Windows-Specific Configurations

### Terminal Settings
1. **Windows Terminal**: Set as default terminal
2. **Font**: Configure Nerd Font in terminal settings
3. **Shell Integration**: PowerShell Core recommended over CMD

### Git Configuration (if not done)
```cmd
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global core.autocrlf true
git config --global core.editor "nvim"
```

### Development Environment Setup

#### For Flutter Development:
```cmd
# Install Flutter
winget install Google.Flutter

# Add to PATH in System Environment Variables
# Verify installation
flutter doctor
```

#### For Node.js Development:
```cmd
# Install global packages
npm install -g @vue/cli @angular/cli typescript
```

## Troubleshooting Common Windows Issues

### Issue 1: Icons Not Displaying
**Solution**: Install a Nerd Font and configure your terminal
- Download: JetBrainsMono Nerd Font
- Install in Windows
- Set in Windows Terminal/your terminal

### Issue 2: Git Authentication
**Solution**: Use Windows Credential Manager
```cmd
git config --global credential.helper manager-core
```

### Issue 3: Python Path Issues
**Solution**: Add Python to PATH
```cmd
# Add to system PATH:
# C:\Users\{username}\AppData\Local\Programs\Python\Python311\
# C:\Users\{username}\AppData\Local\Programs\Python\Python311\Scripts\
```

### Issue 4: Node.js LSP Not Working
**Solution**: Install node globally accessible
```cmd
npm install -g neovim
npm install -g typescript typescript-language-server
```

## Verification Checklist

After installation, verify these features work:
- [ ] NvChad loads without errors
- [ ] Statusline shows project/file/path in purple
- [ ] `:w` shows floating command popup
- [ ] `Ctrl + \` opens floating terminal
- [ ] Icons display correctly (need Nerd Font)
- [ ] File finder works (`Space + ff`)
- [ ] Git integration shows branch in statusline

## Commands for New Claude Session

When working with another Claude session for troubleshooting:

```markdown
I'm migrating an NvChad configuration from Linux to Windows 11. 

Repository: https://github.com/juan-cantero/nvchad-config
Key features:
- Enhanced Lualine statusline with project-relative paths
- Noice.nvim for floating command UI
- ToggleTerm for terminal management
- Flutter development tools
- Custom purple statusline colors

Please help me with [specific issue].

Current Windows setup:
- Windows 11
- Neovim installed via winget
- Configuration cloned to %LOCALAPPDATA%/nvim/

[Describe specific issue here]
```

## Additional Resources

- [NvChad Documentation](https://nvchad.com/)
- [Neovim Windows Installation](https://github.com/neovim/neovim/wiki/Installing-Neovim#windows)
- [Windows Terminal Configuration](https://docs.microsoft.com/en-us/windows/terminal/)
- [Nerd Fonts](https://www.nerdfonts.com/)

---

**Note**: This configuration is optimized for development workflows with enhanced UI features. All keybindings and functionality should work identically to the Linux version once properly configured.

## Support

If you encounter issues:
1. Check Windows Terminal font configuration
2. Verify Neovim version compatibility
3. Ensure all prerequisites are installed
4. Check PATH environment variables
5. Restart terminal/PowerShell after installations