-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.g.mapleader = ","

local map = vim.keymap.set

-- General
map("n", "ZX", "<Cmd>update<CR>",                  {silent=true, desc="Save current buffer"})

map("v", "//", '"fy/\\v<C-R>"<CR>',                {silent=true, desc="Search for selected text"})
map("",  ",/", "<Cmd>lvim // %<CR><Cmd>lopen<CR>", {silent=true, desc="Open search results in scratch buffer", noremap=true})
map("", ",j", "<Cmd>lnext<CR>zz", {silent=true, desc="Goto next lvim result", noremap=true})
map("", ",k", "<Cmd>lprev<CR>zz", {silent=true, desc="Goto prev lvim result", noremap=true})

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc="Exit terminal mode" })

--   Cuts
map("n", ",d",  '"+d',  { noremap=true, desc = "Delete selection and copy" })
map("v", ",d",  '"+d',  { noremap=true, desc = "Delete selection and copy" })
map("n", ",x",  '"+x',  { noremap=true, desc = "Delete character and copy" })
map("n", ",dd", '"+dd', { noremap=true, desc = "Delete line and copy" })
map("n", ",D",  '"+D',  { noremap=true, desc = "Delete remaining line and copy" })

-- Pounce
map("n", "s",  function() require("pounce").pounce({}) end)
map("n", "S",  function() require("pounce").pounce({ do_repeat = true }) end)
map("x", "s",  function() require("pounce").pounce({}) end)
map("o", "gs", function() require("pounce").pounce({}) end)

-- Dial
map("n", "<C-a>",  function() require("dial.map").manipulate("increment", "normal")  end)
map("n", "<C-x>",  function() require("dial.map").manipulate("decrement", "normal")  end)
map("n", "<C-ga>", function() require("dial.map").manipulate("increment", "gnormal") end)
map("n", "<C-gx>", function() require("dial.map").manipulate("decrement", "gnormal") end)
map("v", "<C-a>",  function() require("dial.map").manipulate("increment", "visual")  end)
map("v", "<C-x>",  function() require("dial.map").manipulate("decrement", "visual")  end)
map("v", "<C-ga>", function() require("dial.map").manipulate("increment", "gvisual") end)
map("v", "<C-gx>", function() require("dial.map").manipulate("decrement", "gvisual") end)

-- vim-easy-align
-- map("v", "ga", "<Plug>(EasyAlign)")
-- map("n", "ga", "<Plug>(EasyAlign)")

-- nvim-scissors
map( "n", "<leader>se",          function() require("scissors").editSnippet()   end, { desc = "Snippet: Edit" })
map( { "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end, { desc = "Snippet: Add" }
)

