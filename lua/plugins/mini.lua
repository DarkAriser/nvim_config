return {
  "nvim-mini/mini.nvim",
  config = function()
    --------------------------------------------------
    ---  Move
    --------------------------------------------------
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

    --------------------------------------------------
    ---  Snippets
    --------------------------------------------------
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

    --------------------------------------------------
    ---  CursorWord
    --------------------------------------------------
    require("mini.cursorword").setup({})

    --------------------------------------------------
    ---  Align
    --------------------------------------------------
    require("mini.align").setup({
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        start = "ga",
        start_with_preview = "gA",
      },

      -- Modifiers changing alignment steps and/or options
      --  modifiers = {
      --    -- Main option modifiers
      --    ['s'] = --<function: enter split pattern>,
      --    ['j'] = --<function: choose justify side>,
      --    ['m'] = --<function: enter merge delimiter>,
      --
      --    -- Modifiers adding pre-steps
      --    ['f'] = --<function: filter parts by entering Lua expression>,
      --    ['i'] = --<function: ignore some split matches>,
      --    ['p'] = --<function: pair parts>,
      --    ['t'] = --<function: trim parts>,
      --
      --    -- Delete some last pre-step
      --    ['<BS>'] = --<function: delete some last pre-step>,
      --
      --    -- Special configurations for common splits
      --    ['='] = --<function: enhanced setup for '='>,
      --    [','] = --<function: enhanced setup for ','>,
      --    ['|'] = --<function: enhanced setup for '|'>,
      --    [' '] = --<function: enhanced setup for ' '>,
      --  },
    })
  end,
}
