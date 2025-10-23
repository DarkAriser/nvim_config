return {
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { "rafamadriz/friendly-snippets" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        -- disable the default <CR> accepting suggestion
        ["<CR>"] = false,
        -- set Ctrl+f to accept instead
        ["<C-f>"] = { 'accept', 'fallback' },
      },
    },
  },
}
