-- Custom commands for enhanced telescope functionality

-- Command to find directories with optional path parameter
vim.api.nvim_create_user_command('TelescopeProjectDir', function(opts)
  local path = opts.args ~= "" and opts.args or vim.fn.getcwd()
  
  -- Expand path if it starts with ~
  if path:sub(1, 1) == "~" then
    path = vim.fn.expand(path)
  end
  
  require("telescope.builtin").find_files({
    find_command = { 
      "find", path, "-type", "d", 
      "-not", "-path", "*/.*",
      "-not", "-path", "*/node_modules/*", 
      "-not", "-path", "*/.git/*",
      "-not", "-path", "*/.dart_tool/*"
    },
    prompt_title = "Find Project Directory: " .. path,
    cwd = path,
    attach_mappings = function(prompt_bufnr, map)
      local action_state = require("telescope.actions.state")
      local actions = require("telescope.actions")
      
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        
        if selection then
          -- Change working directory
          vim.cmd("cd " .. selection.value)
          
          -- Change nvim-tree root if available
          local ok, nvim_tree_api = pcall(require, "nvim-tree.api")
          if ok then
            nvim_tree_api.tree.change_root(selection.value)
          end
          
          -- Notify user
          vim.notify("📁 Working directory changed to: " .. selection.value, vim.log.levels.INFO)
          print("Use 'Space + fb' to browse files in this directory")
        end
      end)
      
      return true
    end,
  })
end, {
  nargs = '?',
  desc = 'Find project directory and set as working directory',
  complete = 'dir'
})

-- Command to find folders like your example: :TelescopeDir /cinemapedia/lib
vim.api.nvim_create_user_command('TelescopeDir', function(opts)
  local path = opts.args ~= "" and opts.args or vim.fn.getcwd()
  
  -- Expand path if it starts with ~
  if path:sub(1, 1) == "~" then
    path = vim.fn.expand(path)
  end
  
  -- If path doesn't start with /, make it relative to current directory
  if path:sub(1, 1) ~= "/" and path:sub(1, 1) ~= "~" then
    path = vim.fn.getcwd() .. "/" .. path
  end
  
  require("telescope.builtin").find_files({
    find_command = { 
      "find", path, "-type", "d", 
      "-not", "-path", "*/.*"
    },
    prompt_title = "Directories in: " .. path,
    cwd = path,
    attach_mappings = function(prompt_bufnr, map)
      local action_state = require("telescope.actions.state")
      local actions = require("telescope.actions")
      
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        
        if selection then
          -- Change working directory
          vim.cmd("cd " .. selection.value)
          
          -- Change nvim-tree root if available
          local ok, nvim_tree_api = pcall(require, "nvim-tree.api")
          if ok then
            nvim_tree_api.tree.change_root(selection.value)
          end
          
          -- Notify user
          vim.notify("📁 Working directory changed to: " .. selection.value, vim.log.levels.INFO)
          print("Now run 'Space + fb' to browse this directory")
        end
      end)
      
      return true
    end,
  })
end, {
  nargs = '?',
  desc = 'Find directories in specified path and set as working directory',
  complete = 'dir'
})

-- Shorthand command alias
vim.api.nvim_create_user_command('Tdir', function(opts)
  vim.cmd('TelescopeDir ' .. opts.args)
end, {
  nargs = '?',
  desc = 'Shorthand for TelescopeDir',
  complete = 'dir'
})