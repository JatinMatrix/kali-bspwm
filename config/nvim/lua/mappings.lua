require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Salir de la ventana
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Cerrar cerrar ventana" })

-- Salir forfozamente sin guardar
map("n", "<leader><S-q>", "<cmd>q!<CR>", { desc = "Cerrar cerrar sin guardar" })

-- Guardar archivo
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Guardar guardar archivo" })

-- Guardar archivo y salir
map("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Guardar guardar y cerrar ventana" })

-- Mappings adicionales
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
