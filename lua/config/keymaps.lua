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
local pounce = require("pounce").pounce
map("n", "s",  function() pounce({}) end)
map("n", "S",  function() pounce({ do_repeat = true }) end)
map("x", "s",  function() pounce({}) end)
map("o", "gs", function() pounce({}) end)

-- Dial
local dialmanip = require("dial.map").manipulate
map("n", "<C-a>",  function() dialmanip("increment", "normal")  end)
map("n", "<C-x>",  function() dialmanip("decrement", "normal")  end)
map("n", "<C-ga>", function() dialmanip("increment", "gnormal") end)
map("n", "<C-gx>", function() dialmanip("decrement", "gnormal") end)
map("v", "<C-a>",  function() dialmanip("increment", "visual")  end)
map("v", "<C-x>",  function() dialmanip("decrement", "visual")  end)
map("v", "<C-ga>", function() dialmanip("increment", "gvisual") end)
map("v", "<C-gx>", function() dialmanip("decrement", "gvisual") end)

-- vim-easy-align
-- map("v", "ga", "<Plug>(EasyAlign)")
-- map("n", "ga", "<Plug>(EasyAlign)")

-- nvim-scissors
local scis = require("scissors")
map( "n", "<leader>se",          function() scis.editSnippet()   end, { desc = "Snippet: Edit" })
map( { "n", "x" }, "<leader>sa", function() scis.addNewSnippet() end, { desc = "Snippet: Add" })

-- multi-curosr
-- Add or skip cursor above/below the main cursor.
local mc = require("multicursor-nvim")
map({"n", "x"}, "<up>",           function() mc.lineAddCursor(-1)  end)
map({"n", "x"}, "<down>",         function() mc.lineAddCursor(1)   end)
map({"n", "x"}, "<leader><up>",   function() mc.lineSkipCursor(-1) end)
map({"n", "x"}, "<leader><down>", function() mc.lineSkipCursor(1)  end)

-- Add or skip adding a new cursor by matching word/selection
map({"n", "x"}, "<leader>n", function() mc.matchAddCursor(1)   end)
map({"n", "x"}, "<leader>s", function() mc.matchSkipCursor(1)  end)
map({"n", "x"}, "<leader>N", function() mc.matchAddCursor(-1)  end)
map({"n", "x"}, "<leader>S", function() mc.matchSkipCursor(-1) end)

-- Add and remove cursors with control + left click.
map("n", "<c-leftmouse>", mc.handleMouse)
map("n", "<c-leftdrag>", mc.handleMouseDrag)
map("n", "<c-leftrelease>", mc.handleMouseRelease)

-- Disable and enable cursors.
map({"n", "x"}, "<c-q>", mc.toggleCursor)

-- Mappings defined in a keymap layer only apply when there are
-- multiple cursors. This lets you have overlapping mappings.
mc.addKeymapLayer(function(layerSet)

  -- Select a different cursor as the main one.
  layerSet({"n", "x"}, "<left>", mc.prevCursor)
  layerSet({"n", "x"}, "<right>", mc.nextCursor)

  -- Delete the main cursor.
  layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)

  -- Enable and clear cursors using escape.
  layerSet("n", "<esc>", function()
    if not mc.cursorsEnabled() then
      mc.enableCursors()
    else
      mc.clearCursors()
    end
  end)
end)


