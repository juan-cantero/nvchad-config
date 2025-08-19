require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Custom VSCode-like tricks
map("n", "<leader>i", "i <Esc>i", { desc = "Insert space and enter insert" })
map("n", "<leader>a", "a <Esc>i ", { desc = "Append space and enter insert with space" })
map("n", "<leader>q", "ysiw\"", { desc = "Surround word with quotes" })
map("n", "<leader>;", "mzA;<Esc>`z", { desc = "Add semicolon at end of line" })

-- Format blocks - Position cursor on opening bracket (works with/without spaces after commas)
map("n", "<leader>f", "a<CR><Esc>f)i<CR><Esc>kvi(:s/,\\s*/,\\r/g<CR>va(=", { desc = "Format parentheses () - position on (" })
map("n", "<leader>F", "a<CR><Esc>f}i<CR><Esc>kvi{:s/,\\s*/,\\r/g<CR>va{=", { desc = "Format braces {} - position on {" })
map("n", "<leader>b", "a<CR><Esc>f]i<CR><Esc>kvi[:s/,\\s*/,\\r/g<CR>va[=", { desc = "Format brackets [] - position on [" })

-- Alternative: Format selection inside brackets
map("v", "<leader>f", ":s/, /,\\r/g<CR>gv=", { desc = "Format selected parameters" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Terminal mode mappings
map("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal insert mode" })
map("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit terminal insert mode" })
map("t", "<C-w>h", "<C-\\><C-n><C-w>h", { desc = "Terminal: Move left" })
map("t", "<C-w>j", "<C-\\><C-n><C-w>j", { desc = "Terminal: Move down" })
map("t", "<C-w>k", "<C-\\><C-n><C-w>k", { desc = "Terminal: Move up" })
map("t", "<C-w>l", "<C-\\><C-n><C-w>l", { desc = "Terminal: Move right" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Flutter specific mappings
map("n", "<leader>fr", ":FlutterRun<CR>", { desc = "Flutter Run" })
map("n", "<leader>fd", ":FlutterDevices<CR>", { desc = "Flutter Devices" })
map("n", "<leader>fe", ":FlutterEmulators<CR>", { desc = "Flutter Emulators" })
map("n", "<leader>fR", ":FlutterReload<CR>", { desc = "Flutter Hot Reload" })
map("n", "<leader>fS", ":FlutterRestart<CR>", { desc = "Flutter Hot Restart" })
map("n", "<leader>fq", ":FlutterQuit<CR>", { desc = "Flutter Quit" })
map("n", "<leader>ft", ":FlutterDevTools<CR>", { desc = "Flutter Dev Tools" })
map("n", "<leader>fo", ":FlutterOutlineToggle<CR>", { desc = "Flutter Outline" })
map("n", "<leader>fl", ":FlutterLspRestart<CR>", { desc = "Flutter LSP Restart" })

-- Terminal tabs and panels (VS Code-like)
map("n", "<leader>tt", ":tab terminal<CR>", { desc = "Terminal Tab" })
map("n", "<leader>ts", ":split | terminal<CR> | resize 15<CR>", { desc = "Terminal Panel Bottom" })
map("n", "<leader>tv", ":vsplit | terminal<CR>", { desc = "Terminal Panel Right" })

-- Tab navigation shortcuts
map("n", "<leader>1", "1gt", { desc = "Go to Tab 1" })
map("n", "<leader>2", "2gt", { desc = "Go to Tab 2" }) 
map("n", "<leader>3", "3gt", { desc = "Go to Tab 3" })
map("n", "<leader>4", "4gt", { desc = "Go to Tab 4" })

-- Dedicated terminal tab setup (2 terminals)
map("n", "<leader>tw", function()
  -- Create new tab for terminals
  vim.cmd("tabnew")
  -- Split into 2 horizontal terminals
  vim.cmd("terminal")
  vim.cmd("split | terminal")
  -- Resize terminals equally
  vim.cmd("wincmd =")  -- Equal window sizes
end, { desc = "Terminal Workspace Tab (2 terminals)" })

-- Quick terminal panels (single terminals)
map("n", "<leader>t1", ":split | terminal<CR> | resize 15<CR>", { desc = "Flutter Terminal" })
map("n", "<leader>t2", ":split | terminal<CR> | resize 15<CR>", { desc = "Claude Code Terminal" }) 
map("n", "<leader>t3", ":split | terminal<CR> | resize 15<CR>", { desc = "General Commands Terminal" })

-- ToggleTerm mappings (enhanced terminals)
map("n", "<C-\\>", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
map("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Float Terminal" })
map("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { desc = "Horizontal Terminal" })
map("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { desc = "Vertical Terminal" })

-- ToggleTerm numbered terminals (using capital T to avoid conflict)
map("n", "<leader>T1", ":1ToggleTerm<CR>", { desc = "ToggleTerm 1" })
map("n", "<leader>T2", ":2ToggleTerm<CR>", { desc = "ToggleTerm 2" })
map("n", "<leader>T3", ":3ToggleTerm<CR>", { desc = "ToggleTerm 3" })
map("n", "<leader>T4", ":4ToggleTerm<CR>", { desc = "ToggleTerm 4" })

-- Dart specific mappings
map("n", "<leader>da", ":DartAnalyzer<CR>", { desc = "Dart Analyzer" })
map("n", "<leader>df", ":DartFmt<CR>", { desc = "Dart Format" })

-- GitHub Copilot Chat mappings
map("n", "<leader>ca", ":Copilot auth<CR>", { desc = "Copilot Auth" })
map("n", "<leader>cc", ":CopilotChat<CR>", { desc = "Copilot Chat" })
map("n", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "Copilot Explain Code" })
map("n", "<leader>cr", ":CopilotChatReview<CR>", { desc = "Copilot Review Code" })
map("n", "<leader>cf", ":CopilotChatFix<CR>", { desc = "Copilot Fix Code" })
map("n", "<leader>co", ":CopilotChatOptimize<CR>", { desc = "Copilot Optimize Code" })
map("n", "<leader>cd", ":CopilotChatDocs<CR>", { desc = "Copilot Generate Docs" })
map("n", "<leader>ct", ":CopilotChatTests<CR>", { desc = "Copilot Generate Tests" })
map("v", "<leader>cc", ":CopilotChatVisual<CR>", { desc = "Copilot Chat Visual" })
map("v", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "Copilot Explain Selection" })

-- Snippets management
map("n", "<leader>sl", ":SnippetsList<CR>", { desc = "List all snippets" })
map("n", "<leader>se", ":LuaSnipEdit<CR>", { desc = "Edit snippets for current filetype" })

-- Dart LSP formatting and code actions
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function()
    -- LSP keymaps for Dart files
    vim.keymap.set("n", "<leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = true, desc = "Format Dart file" })
    
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = true, desc = "Code Actions" })
    vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { buffer = true, desc = "Code Actions" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = true, desc = "Rename Symbol" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true, desc = "Go to Definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = true, desc = "Go to References" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true, desc = "Hover Documentation" })
    
    -- Format on save for Dart files
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = 0,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
})
