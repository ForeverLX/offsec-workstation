-- offsec-workstation minimal nvim config
-- EXAMPLE - verify plugin bootstrap steps in official docs for lazy.nvim & Telescope.

local fn = vim.fn
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
})

-- Basic ergonomics
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true

local telescope = require("telescope")
telescope.setup({
  defaults = {
    -- keep it minimal; rely on rg/fd
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
    },
  },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (fd)" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live grep (rg)" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Buffers" })
