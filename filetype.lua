vim.filetype.add({
  extension = { v = "verilog" },
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "*.v", "*.sv" },
  callback = function()
    vim.keymap.set({ "i", "c" }, "`", "`", { noremap = true, buffer = 0 })
    vim.keymap.set({ "i", "c" }, "{", "{", { noremap = true, buffer = 0 })
  end,
})
