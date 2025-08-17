-- Ultra-simple nvim-tree config - no file icons, just text + git status
return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      renderer = {
        icons = {
          show = {
            file = false,        -- No file icons (no more diamonds!)
            folder = true,       -- Keep folder icons
            folder_arrow = true, -- Keep folder arrows
            git = true,         -- Keep git status icons
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            folder = {
              arrow_closed = "▶",
              arrow_open = "▼", 
              default = "📁",
              open = "📂",
              empty = "📁",
              empty_open = "📂",
              symlink = "🔗",
              symlink_open = "🔗",
            },
            git = {
              unstaged = "✗",
              staged = "✓", 
              unmerged = "!",
              renamed = "➜",
              untracked = "★",
              deleted = "✖",
              ignored = "◌",
            },
          },
        },
      },
    },
  },
}