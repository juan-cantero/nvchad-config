-- Snippets configuration loader
local ls = require("luasnip")

-- Load all snippet files
local dart_snippets = require("snippets.dart")
local flutter_snippets = require("snippets.flutter") 
local typescript_snippets = require("snippets.typescript")
local go_snippets = require("snippets.go")

-- Add snippets to LuaSnip
ls.add_snippets("dart", dart_snippets)
ls.add_snippets("dart", flutter_snippets) -- Flutter snippets also work in dart files
ls.add_snippets("typescript", typescript_snippets)
ls.add_snippets("javascript", typescript_snippets) -- TypeScript snippets also work in JS
ls.add_snippets("go", go_snippets)

-- Load friendly-snippets (community snippets)
require("luasnip.loaders.from_vscode").lazy_load()

-- Configuration
ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
})

-- Keybindings for snippets
vim.keymap.set({"i", "s"}, "<C-j>", function() 
  if ls.expand_or_jumpable() then 
    ls.expand_or_jump() 
  end 
end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-k>", function() 
  if ls.jumpable(-1) then 
    ls.jump(-1) 
  end 
end, {silent = true})

vim.keymap.set("i", "<C-l>", function() 
  if ls.choice_active() then 
    ls.change_choice(1) 
  end 
end)

-- Custom command to list all available snippets
vim.api.nvim_create_user_command('SnippetsList', function()
  local snippets = ls.get_snippets()
  local current_ft = vim.bo.filetype
  
  if current_ft and current_ft ~= "" then
    print("=== Snippets for " .. current_ft .. " ===")
    if snippets[current_ft] then
      for _, snip in ipairs(snippets[current_ft]) do
        print("  📝 " .. snip.trigger .. " - " .. (snip.name or snip.trigger))
      end
    else
      print("  No custom snippets found for " .. current_ft)
    end
    print("\n=== All available file types ===")
  else
    print("=== All available snippets ===")
  end
  
  for ft, snips in pairs(snippets) do
    if #snips > 0 then
      print("📁 " .. ft .. " (" .. #snips .. " snippets)")
      for i, snip in ipairs(snips) do
        if i <= 3 then -- Show first 3 snippets
          print("  📝 " .. snip.trigger)
        elseif i == 4 then
          print("  ... and " .. (#snips - 3) .. " more")
          break
        end
      end
    end
  end
  print("\n💡 Use :LuaSnipEdit to edit snippets for current filetype")
end, { desc = "List all available snippets" })