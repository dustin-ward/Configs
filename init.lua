-- Vimopts -- 
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

-- Remaps -- 
-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep search term in middle of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Search and replace all instances
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
