local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = require "telescope._extensions.file_browser.actions"

telescope.setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
  extensions = {
    file_browser = {
      -- Remove theme to use default horizontal layout
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- Insert mode - for searching and navigation
          ["<A-c>"] = fb_actions.create,
          ["<S-CR>"] = fb_actions.create_from_prompt,
          ["<A-r>"] = fb_actions.rename,
          ["<A-m>"] = fb_actions.move,
          ["<A-y>"] = fb_actions.copy,
          ["<A-d>"] = fb_actions.remove,
          ["<C-o>"] = fb_actions.open,
          ["<C-g>"] = fb_actions.goto_parent_dir,
          ["<C-e>"] = fb_actions.goto_home_dir,
          ["<C-w>"] = fb_actions.goto_cwd,
          ["<C-t>"] = fb_actions.change_cwd,
          ["<C-f>"] = fb_actions.toggle_browser,
          ["<C-h>"] = fb_actions.toggle_hidden,
          ["<C-s>"] = fb_actions.toggle_all,
          ["<bs>"] = fb_actions.backspace,
        },
        ["n"] = {
          -- Normal mode - nvim-tree like navigation
          ["a"] = fb_actions.create,              -- a to create (like nvim-tree)
          ["r"] = fb_actions.rename,              -- r to rename
          ["d"] = fb_actions.remove,              -- d to delete
          ["y"] = fb_actions.copy,                -- y to copy
          ["m"] = fb_actions.move,                -- m to move/cut
          ["o"] = actions.select_default,         -- o to open/navigate
          ["<CR>"] = actions.select_default,      -- Enter to open/navigate
          ["l"] = actions.select_default,         -- l to open (vim-like)
          ["h"] = fb_actions.goto_parent_dir,     -- h to go up (vim-like)
          ["<BS>"] = fb_actions.goto_parent_dir,  -- Backspace to go up
          ["-"] = fb_actions.goto_parent_dir,     -- - to go up
          ["~"] = fb_actions.goto_home_dir,       -- ~ to home
          ["."] = fb_actions.toggle_hidden,       -- . to toggle hidden files
          ["<C-w>"] = function(prompt_bufnr)      -- Ctrl+w to set working directory
            local action_state = require("telescope.actions.state")
            local actions = require("telescope.actions")
            local selection = action_state.get_selected_entry()
            
            if selection then
              local path = selection.value
              local stat = vim.loop.fs_stat(path)
              
              if stat and stat.type == "directory" then
                actions.close(prompt_bufnr)
                vim.cmd("cd " .. path)
                
                -- Change nvim-tree root if available
                local ok, nvim_tree_api = pcall(require, "nvim-tree.api")
                if ok then
                  nvim_tree_api.tree.change_root(path)
                end
                
                vim.notify("📁 Working directory set to: " .. path, vim.log.levels.INFO)
              else
                vim.notify("⚠️  Please select a directory to set as working directory", vim.log.levels.WARN)
              end
            end
          end,
          ["f"] = fb_actions.toggle_browser,      -- f to toggle file/folder view
        },
      },
    },
  },
})

-- Load telescope extensions
telescope.load_extension("file_browser")