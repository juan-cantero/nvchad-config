require "nvchad.options"

-- add yours here!

local o = vim.o

-- Swap file management to avoid "recover or edit anyway" prompts
o.swapfile = false          -- Disable swap files completely (prevents recovery prompts)
o.backup = false            -- Disable backup files
o.writebackup = false       -- Disable backup before overwriting file

-- Alternative: Keep swap files but in a centralized location
-- o.swapfile = true
-- o.directory = vim.fn.stdpath("state") .. "/swap//"

-- Undo settings (better than swap files for recovery)
o.undofile = true           -- Enable persistent undo
o.undodir = vim.fn.stdpath("state") .. "/undo//"
