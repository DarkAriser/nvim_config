return {
  "nvim-mini/mini.nvim",
  config = function()
    require("mini.move").setup({
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = "<M-h>",
        right = "<M-l>",
        down = "<M-j>",
        up = "<M-k>",

        -- Move current line in Normal mode
        line_left = "<M-h>",
        line_right = "<M-l>",
        line_down = "<M-j>",
        line_up = "<M-k>",
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    })
    local gen_loader = require("mini.snippets").gen_loader
    require("mini.snippets").setup({
      snippets = {
        -- Load custom file with global snippets first (adjust for Windows)
        gen_loader.from_file("~/.config/nvim/snippets/global.json"),

        -- Load snippets based on current language by reading files from
        -- "snippets/" subdirectories from 'runtimepath' directories.
        gen_loader.from_lang(),
      },
    })
  end,
}
