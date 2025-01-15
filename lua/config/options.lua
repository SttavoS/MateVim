vim.g.mapleader = " "

local opt = vim.opt

opt.number = true
opt.clipboard = "unnamedplus"

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.mouse = "a"

opt.termguicolors = true

-- Desativar arquivos de backup e swap
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Tempo de espera para mapeamentos
opt.timeoutlen = 500
