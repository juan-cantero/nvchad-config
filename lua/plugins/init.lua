return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "dart", "yaml"
  		},
  	},
  },

  -- Flutter/Dart plugins
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup({
        ui = {
          border = "rounded",
          notification_style = "nvim-notify",
        },
        decorations = {
          statusline = {
            app_version = false,
            device = true,
          }
        },
        debugger = {
          enabled = false,
          run_via_dap = false,
          register_configurations = function(paths)
            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch dart",
                dartSdkPath = paths.dart_sdk,
                flutterSdkPath = paths.flutter_sdk,
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
              {
                type = "flutter",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = paths.dart_sdk,
                flutterSdkPath = paths.flutter_sdk,
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              }
            }
          end,
        },
        flutter_path = nil, -- Uses flutter from PATH
        flutter_lookup_cmd = nil,
        fvm = false,
        widget_guides = {
          enabled = false,
        },
        closing_tags = {
          highlight = "ErrorMsg",
          prefix = ">",
          enabled = true
        },
        dev_log = {
          enabled = true,
          notify_errors = false,
          open_cmd = "tabedit",
        },
        dev_tools = {
          autostart = false,
          auto_open_browser = false,
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = false
        },
        lsp = {
          color = {
            enabled = false,
            background = false,
            background_color = nil,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
          end,
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
          }
        }
      })
    end,
  },

  -- Dart syntax highlighting
  {
    "dart-lang/dart-vim-plugin",
    ft = "dart",
  },

  -- Surround text objects (for quote wrapping)
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },

  -- GitHub Copilot Chat (ask questions, no auto-completion)
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    lazy = false,
    dependencies = {
      { "github/copilot.vim", lazy = false }, -- or github/copilot.lua
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup({
        debug = false,
        auto_follow_cursor = false,
        auto_insert_mode = false,
        clear_chat_on_new_prompt = false,
        context = "buffer", -- or 'buffer', 'buffers'
        history_path = vim.fn.stdpath("data") .. "/copilotchat_history",
        callback = nil,
        selection = function(source)
          return require("CopilotChat.select").visual(source) or require("CopilotChat.select").buffer(source)
        end,
      })
      
      -- Enable auto-completion if needed (set to true to enable)
      vim.g.copilot_enabled = false  -- Change to true if you want auto-suggestions
    end,
  },

  -- Enhanced terminal management
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
    end,
  },

  -- Custom statusline configuration
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              function()
                local filepath = vim.fn.expand('%:p')
                if filepath == '' then return '[No Name]' end
                
                -- Find git root or project root
                local git_root = vim.fn.system('git rev-parse --show-toplevel 2>/dev/null'):gsub('\n', '')
                if vim.v.shell_error == 0 and git_root ~= '' then
                  -- Get project name (last directory of git root)
                  local project_name = git_root:match("([^/]+)$")
                  -- Get relative path from git root (remove git_root prefix)
                  local relative_path = filepath:gsub('^' .. vim.pesc(git_root) .. '/', '')
                  return project_name .. '/' .. relative_path
                end
                
                -- Fallback to just filename if no git root
                return vim.fn.expand('%:t')
              end,
              icon = '',
              color = { fg = '#C678DD', gui = 'bold' }, -- Púrpura brillante y negrita
            }
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" }
        },
      })
    end,
  },

  -- Noice.nvim - Beautiful UI for commands, notifications, and messages
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        cmdline = {
          enabled = true, -- enables the Noice cmdline UI
          view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
          opts = {}, -- global options for the cmdline. See section on views
        },
        messages = {
          enabled = true, -- enables the Noice messages UI
          view = "notify", -- default view for messages
          view_error = "notify", -- view for errors
          view_warn = "notify", -- view for warnings
          view_history = "messages", -- view for :messages
          view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
        },
        popupmenu = {
          enabled = true, -- enables the Noice popupmenu UI
          backend = "nui", -- backend to use to show regular cmdline completions
        },
        notify = {
          enabled = true,
          view = "notify",
        },
        health = {
          checker = false, -- Disable if you don't want health checks to run
        },
      })
    end,
  },

  -- Session Management (like VS Code)
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
        options = { "curdir", "tabpages", "winsize" }, -- Removed "buffers" to reduce hidden buffers
        pre_save = function()
          -- Only close problematic floating windows (notifications, etc.)
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local config = vim.api.nvim_win_get_config(win)
            -- Close floating windows that are not editor-relative (notifications, popups)
            if config.relative ~= "" and config.relative ~= "editor" then
              pcall(vim.api.nvim_win_close, win, true)
            end
          end
          
          -- Close help, quickfix, and other temporary special buffers
          vim.cmd("silent! cclose")     -- Close quickfix
          vim.cmd("silent! lclose")     -- Close location list
          vim.cmd("silent! helpclose")  -- Close help
          
          -- Clean up any swap files
          local swap_files = vim.fn.glob("**/*.swp", false, true)
          for _, file in ipairs(swap_files) do
            vim.fn.delete(file)
          end
        end,
      })
      
      -- No auto-restore - let user control via keybindings
      -- Dashboard will always show, use <leader>ql to restore last session
    end,
  },
}
