require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "dartls" }
vim.lsp.enable(servers)

-- Dart/Flutter specific configuration
local lspconfig = require("lspconfig")

lspconfig.dartls.setup({
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = true,
    suggestFromUnimportedLibraries = true,
    closingLabels = true,
    outline = true,
    flutterOutline = true,
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    }
  }
})

-- read :h vim.lsp.config for changing options of lsp servers 
