return {
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    -- dependencies = { "rafamadriz/friendly-snippets" },
    -- dependencies = "nvim-mini/mini.nvim",
    -- dependencies = { "L3MON4D3/LuaSnip" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      --snippets = { preset = "mini_snippets" },
      keymap = {
        -- disable the default <CR> accepting suggestion
        ["<CR>"] = false,
        -- set Ctrl+f to accept instead
        ["<C-f>"] = { "accept", "fallback" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
