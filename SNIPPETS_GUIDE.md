# 🚀 Custom Snippets Guide - NvChad Configuration

This guide covers all custom snippets configured in your development environment and how to use them effectively.

---

## 📁 **Snippets Structure**

Your snippets are organized by language in separate files:

```
~/.config/nvim/lua/snippets/
├── init.lua          # Main loader and configuration
├── dart.lua          # Dart language snippets
├── flutter.lua       # Flutter framework snippets
├── go.lua            # Go language snippets
└── typescript.lua    # TypeScript/JavaScript snippets
```

**Configuration loaded in:** `/home/juan/.config/nvim/init.lua:37`

---

## 🎯 **How to Use Snippets**

### **What are Snippets?**
**Snippets** are shortcuts that expand small text into complete code templates. They save you time by typing less!

**Example:** Type `pd` → Press `Tab` → Becomes `print('🐛 DEBUG: message');`

### **Key Terminology:**
- **🔑 Trigger:** The short text you type (like `pd`, `stless`)
- **🚀 Expand:** Convert the trigger into full code template
- **📍 Placeholder:** Highlighted text you can replace with your content
- **🎯 Navigate:** Move between placeholders to fill them in

### **Understanding Keyboard Shortcuts:**
- **`<C-j>`** = **Ctrl + j** (hold Ctrl, press j)
- **`<C-k>`** = **Ctrl + k** (hold Ctrl, press k)  
- **`<C-l>`** = **Ctrl + l** (hold Ctrl, press l)
- **`Tab`** = Tab key (most common way to expand)

### **Step-by-Step Example:**
```dart
1. Open a .dart file
2. Type: stless
3. Press Tab (snippet expands)
4. You see: StatelessWidget template with highlighted "MyWidget"
5. Type your widget name (replaces "MyWidget")
6. Press Ctrl+j to move to next placeholder
7. Type your widget content
8. Done! Complete widget created
```

### **Basic Usage**
1. **Type the snippet trigger** (e.g., `pd`)
2. **Press `Tab`** or use completion to expand
3. **Navigate placeholders** with `Ctrl+j` (next) and `Ctrl+k` (previous)
4. **Fill in the placeholders** with your custom content

### **Navigation Keybindings**
**Source:** `/home/juan/.config/nvim/lua/snippets/init.lua:25-38`

| Key | Action | Description |
|-----|--------|-------------|
| `<C-j>` | Expand/Next | Expand snippet or jump to next placeholder |
| `<C-k>` | Previous | Jump to previous placeholder |
| `<C-l>` | Choice | Change choice when multiple options available |

---

## 🎯 **Dart Snippets**
**Source:** `/home/juan/.config/nvim/lua/snippets/dart.lua`

| Trigger | Expansion | Description |
|---------|-----------|-------------|
| `pd` | `print('🐛 DEBUG: message');` | Debug print statement |
| `todo` | `// TODO: Add implementation` | TODO comment |
| `class` | Class template | Basic class structure |
| `fn` | Function template | Function with return type |
| `try` | Try-catch block | Exception handling |
| `list` | `List<String> items = [];` | List initialization |
| `map` | `Map<String, dynamic> data = {};` | Map initialization |

### **Example Usage:**
```dart
// Type: pd<Tab>
print('🐛 DEBUG: message');

// Type: list<Tab>
List<String> items = [];

// Type: fn<Tab>
void functionName() {
  // Implementation
}
```

---

## 📱 **Flutter Snippets**
**Source:** `/home/juan/.config/nvim/lua/snippets/flutter.lua`

| Trigger | Expansion | Description |
|---------|-----------|-------------|
| `stless` | StatelessWidget | Complete StatelessWidget template |
| `stful` | StatefulWidget | Complete StatefulWidget template |
| `cont` | Container with decoration | Styled container |
| `scaffold` | Scaffold template | Basic screen structure |
| `col` | Column widget | Vertical layout |
| `row` | Row widget | Horizontal layout |
| `pad` | Padding widget | Widget with padding |
| `center` | Center widget | Centered widget |
| `btn` | ElevatedButton | Button with onPressed |

### **Example Usage:**
```dart
// Type: stless<Tab>
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// Type: cont<Tab>
Container(
  padding: const EdgeInsets.all(8.0),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Text('Hello'),
)
```

---

## 📜 **TypeScript/JavaScript Snippets**
**Source:** `/home/juan/.config/nvim/lua/snippets/typescript.lua`

| Trigger | Expansion | Description |
|---------|-----------|-------------|
| `cl` | `console.log('Debug: ', variable);` | Console log with variable |
| `fn` | Function with types | TypeScript function |
| `af` | Arrow function | Arrow function with types |
| `int` | Interface | TypeScript interface |
| `type` | Type definition | Custom type |
| `class` | Class template | Class with constructor |
| `imp` | Import statement | ES6 import |
| `exp` | Export statement | ES6 export |
| `try` | Try-catch block | Error handling |
| `async` | Async function | Promise-based function |
| `rfc` | React functional component | Complete React component |

### **Example Usage:**
```typescript
// Type: fn<Tab>
function functionName(params): void {
  // body
}

// Type: int<Tab>
interface InterfaceName {
  property: string;
}

// Type: rfc<Tab>
import React from 'react';

interface ComponentProps {
  // props
}

const Component: React.FC<ComponentProps> = (props) => {
  return (
    <div>Component</div>
  );
};

export default Component;
```

---

## 🐹 **Go Snippets**
**Source:** `/home/juan/.config/nvim/lua/snippets/go.lua`

| Trigger | Expansion | Description |
|---------|-----------|-------------|
| `pd` | `fmt.Println("🐛 DEBUG:", variable)` | Debug print |
| `fn` | Function template | Go function |
| `main` | Main function | Package main with main() |
| `struct` | Struct definition | Custom struct |
| `method` | Method on struct | Receiver method |
| `interface` | Interface definition | Go interface |
| `err` | Error handling | Standard error check |
| `for` | For loop | Traditional for loop |
| `range` | Range loop | Range over collection |
| `if` | If statement | Conditional |
| `switch` | Switch statement | Switch with cases |
| `package` | Package declaration | Package statement |
| `import` | Single import | Import package |
| `imports` | Multiple imports | Import block |
| `handler` | HTTP handler | HTTP handler function |
| `test` | Test function | Unit test function |

### **Example Usage:**
```go
// Type: main<Tab>
package main

import "fmt"

func main() {
	fmt.Println("Hello, World!")
}

// Type: struct<Tab>
type StructName struct {
	Field string
}

// Type: err<Tab>
if err != nil {
	return err
}
```

---

## 👀 **How to View All Available Snippets**

### **Method 1: In-editor snippet list**
While in insert mode in a file:
1. **Start typing and press `<C-Space>`** to trigger completion
2. **Look for snippet entries** (usually marked with `~` or snippet icon)
3. **Browse through available snippets** for current file type

### **Method 2: Custom keybindings (Recommended)**
**Source:** `/home/juan/.config/nvim/lua/mappings.lua:101-113`

| Key | Command | Description |
|-----|---------|-------------|
| `<leader>sl` | `:SnippetsList` | List all available snippets |
| `<leader>se` | Edit snippets file | Edit snippets for current file type |

**Usage:**
- Press `Space + sl` to see all snippets
- Press `Space + se` to edit snippets (opens appropriate file)

### **Method 3: View snippet source files**
```vim
:e ~/.config/nvim/lua/snippets/dart.lua
:e ~/.config/nvim/lua/snippets/flutter.lua
:e ~/.config/nvim/lua/snippets/typescript.lua
:e ~/.config/nvim/lua/snippets/go.lua
```

### **Method 4: Custom command to list snippets**
Add this to your configuration to create a command that shows all snippets:
```lua
vim.api.nvim_create_user_command('SnippetsList', function()
  local ls = require('luasnip')
  local snippets = ls.get_snippets()
  for ft, snips in pairs(snippets) do
    print("=== " .. ft .. " ===")
    for _, snip in ipairs(snips) do
      print("  " .. snip.trigger .. " - " .. (snip.name or "No description"))
    end
  end
end, {})
```

Then use: `:SnippetsList`

### **Method 5: Telescope integration (if you want to add it)**
You can integrate with Telescope for a beautiful snippet browser:
```lua
-- Add to your telescope configuration
require('telescope').load_extension('luasnip')
```
Then use: `:Telescope luasnip`

---

## 🔧 **Configuration Details**

### **Snippet Engine Configuration**
**Source:** `/home/juan/.config/nvim/lua/snippets/init.lua:18-23`

```lua
ls.config.set_config({
  history = true,                    -- Remember snippet history
  updateevents = "TextChanged,TextChangedI", -- Update on text changes
  enable_autosnippets = true,        -- Enable automatic snippets
})
```

### **File Type Associations**
- **Dart files (.dart)**: Gets both `dart` and `flutter` snippets
- **TypeScript files (.ts)**: Gets `typescript` snippets  
- **JavaScript files (.js)**: Gets `typescript` snippets (shared)
- **Go files (.go)**: Gets `go` snippets

---

## ➕ **Adding New Snippets**

### **To add a new snippet to existing language:**
1. **Edit the appropriate file** (e.g., `~/.config/nvim/lua/snippets/dart.lua`)
2. **Add your snippet** following the pattern:
```lua
s("trigger", {
  t("static text"),
  i(1, "placeholder"),
  t("more static text"),
}),
```
3. **Reload configuration:** `:source ~/.config/nvim/init.lua`

### **To add a new language:**
1. **Create new file** (e.g., `~/.config/nvim/lua/snippets/python.lua`)
2. **Add snippets** using the same format as other files
3. **Load in init.lua:**
```lua
local python_snippets = require("snippets.python")
ls.add_snippets("python", python_snippets)
```

---

## 🔄 **Reloading Snippets**

When you modify snippets:

### **Quick reload:**
```vim
:source ~/.config/nvim/init.lua
```

### **Force reload specific module:**
```vim
:lua package.loaded['snippets'] = nil | require('snippets')
```

### **For testing new snippets:**
```vim
:lua package.loaded['snippets.dart'] = nil
:lua require('snippets')
```

---

## 🎨 **Snippet Syntax Guide**

### **Basic Elements:**
- `s("trigger", { ... })` - Creates a snippet
- `t("text")` - Static text
- `i(1, "placeholder")` - Insert placeholder (numbered)
- `f(function, {1})` - Function that uses other placeholders
- `c(1, { t("option1"), t("option2") })` - Choice node

### **Advanced Features:**
- **Dynamic text** based on other placeholders
- **Conditional snippets** based on context
- **Multi-line snippets** with proper indentation
- **Repeating placeholders** that sync content

---

## 🚀 **Performance & Tips**

### **Best Practices:**
- ✅ Use **short, memorable triggers** (2-5 characters)
- ✅ Group related snippets by **logical categories**
- ✅ Use **consistent naming** across languages when possible
- ✅ Test snippets after adding them

### **Performance:**
- Snippets are **loaded on startup** for fast access
- **Lazy loading** of community snippets for better performance
- **File-type specific** loading reduces memory usage

---

## 📊 **Summary**

- **Total custom snippets:** 45+ across 4 languages
- **Languages supported:** Dart, Flutter, TypeScript/JavaScript, Go
- **Navigation:** `Ctrl+j/k/l` for placeholder management
- **View all:** `<leader>sl` (Space + sl) or `:SnippetsList`
- **Reload:** `:source ~/.config/nvim/init.lua`

Your snippet system is designed for **maximum productivity** in your development workflow! 🚀