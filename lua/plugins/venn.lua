return {
  "jbyuki/venn.nvim",
  dependencies = {
    "nvimtools/hydra.nvim",
  },
  config = function()
    local Hydra = require("hydra")
    local venn_hint_utf = [[
 Arrow^^^^^^  Select region with <C-v>^^^^^^
 ^ ^ _K_ ^ ^  _f_: Surround with box ^ ^ ^ ^
 _H_ ^ ^ _L_  _<C-h>_: ◄, _<C-j>_: ▼
 ^ ^ _J_ ^ ^  _<C-k>_: ▲, _<C-l>_: ► _<C-c>_
 ^ ^ ^ ^ ^ ^  _F_: Surround with bold box ^ ^ ^ ^
 ^ ^ ^ ^ ^ ^  _t_: Surround with double box ^ ^ ^ ^
 ^ ^ ^ ^ ^ ^  _T_: Fill box ^ ^ ^ ^
]]

    -- :setlocal ve=all
    -- :setlocal ve=none
    Hydra({
      name = "Draw Utf-8 Venn Diagram",
      hint = venn_hint_utf,
      config = {
        color = "pink",
        invoke_on_body = true,
        on_enter = function()
          vim.wo.virtualedit = "all"
        end,
      },
      mode = "n",
      body = "<leader>ve",
      heads = {
        { "<C-h>", "xi<C-v>u25c4<Esc>" }, -- mode = 'v' somehow breaks
        { "<C-j>", "xi<C-v>u25bc<Esc>" },
        { "<C-k>", "xi<C-v>u25b2<Esc>" },
        { "<C-l>", "xi<C-v>u25ba<Esc>" },
        { "H", "<C-v>h:VBox<CR>" },
        { "J", "<C-v>j:VBox<CR>" },
        { "K", "<C-v>k:VBox<CR>" },
        { "L", "<C-v>l:VBox<CR>" },
        { "f", ":VBox<CR>", { mode = "v" } },
        { "F", ":VBoxH<CR>", { mode = "v" } },
        { "t", ":VBoxD<CR>", { mode = "v" } },
        { "T", ":VFill<CR>", { mode = "v" } },
        { "<C-c>", nil, { exit = true } },
      },
    })

    Hydra({
      name = "Draw Twin Utf-8 Venn Diagram",
      hint = venn_hint_utf,
      config = {
        color = "pink",
        invoke_on_body = true,
        on_enter = function()
          vim.wo.virtualedit = "all"
        end,
      },
      mode = "n",
      body = "<leader>vr",
      heads = {
        { "<C-h>", "xi<C-v>u25c4<Esc>" }, -- mode = 'v' somehow breaks
        { "<C-j>", "xi<C-v>u25bc<Esc>" },
        { "<C-k>", "xi<C-v>u25b2<Esc>" },
        { "<C-l>", "xi<C-v>u25ba<Esc>" },
        { "H", "<C-v>h:VBoxD<CR>" },
        { "J", "<C-v>j:VBoxD<CR>" },
        { "K", "<C-v>k:VBoxD<CR>" },
        { "L", "<C-v>l:VBoxD<CR>" },
        { "f", ":VBox<CR>", { mode = "v" } },
        { "F", ":VBoxH<CR>", { mode = "v" } },
        { "t", ":VBoxD<CR>", { mode = "v" } },
        { "T", ":VFill<CR>", { mode = "v" } },
        { "<C-c>", nil, { exit = true } },
      },
    })

    Hydra({
      name = "Draw Bold Utf-8 Venn Diagram",
      hint = venn_hint_utf,
      config = {
        color = "pink",
        invoke_on_body = true,
        on_enter = function()
          vim.wo.virtualedit = "all"
        end,
      },
      mode = "n",
      body = "<leader>vt",
      heads = {
        { "<C-h>", "xi<C-v>u25c4<Esc>" }, -- mode = 'v' somehow breaks
        { "<C-j>", "xi<C-v>u25bc<Esc>" },
        { "<C-k>", "xi<C-v>u25b2<Esc>" },
        { "<C-l>", "xi<C-v>u25ba<Esc>" },
        { "H", "<C-v>h:VBoxH<CR>" },
        { "J", "<C-v>j:VBoxH<CR>" },
        { "K", "<C-v>k:VBoxH<CR>" },
        { "L", "<C-v>l:VBoxH<CR>" },
        { "f", ":VBox<CR>", { mode = "v" } },
        { "F", ":VBoxH<CR>", { mode = "v" } },
        { "t", ":VBoxD<CR>", { mode = "v" } },
        { "T", ":VFill<CR>", { mode = "v" } },
        { "<C-c>", nil, { exit = true } },
      },
    })

    -- simplified ascii art with hydra
    -- symbols (-,|,^,<,>,/,\)
    -- capital letters => -| movements
    -- C-letters => <v^>
    -- leader right clockwise (time running): \/ including movements
    -- leader left clockwise (enough time): \/ without movements
    local venn_hint_ascii   = [[
     -| moves: _H_ _J_ _K_ _L_
     <v^> arrow: _<C-h>_ _<C-j>_ _<C-k>_ _<C-l>_
     diagnoal + move: leader + clockwise like ◄ ▲
     _<leader>jh_ _<leader>hk_ _<leader>lj_ _<leader>kl_
     diagnoal + nomove: anticlockwise like ▲ + ◄
     _<leader>hj_ _<leader>kh_ _<leader>jl_ _<leader>lk_
     set +: _<leader>n_
     rectangle move + arrow, ie ► with ->
     _<leader>h_ _<leader>j_ _<leader>k_ _<leader>l_
                                  _<C-c>_
    ]]
    -- _F_: surround^^   _f_: surround     ^^ ^
    -- + corners ^  ^^   overwritten corners
    Hydra {
      name = 'Draw Ascii Diagram',
      hint = venn_hint_ascii,
      config = {
        color = 'pink',
        invoke_on_body = true,
        on_enter = function() vim.wo.virtualedit = 'all' end,
      },
      mode = 'n',
      body = '<leader>va',
      heads = {
        { '<C-h>', 'r<' },
        { '<C-j>', 'rv' },
        { '<C-k>', 'r^' },
        { '<C-l>', 'r>' },
        { 'H', 'r-h' },
        { 'J', 'r|j' },
        { 'K', 'r|k' },
        { 'L', 'r-l' },
        { '<leader>jh', 'r/hj' },
        { '<leader>hj', 'r/' },
        { '<leader>hk', 'r\\hk' },
        { '<leader>kh', 'r\\' },
        { '<leader>lj', 'r\\jl' },
        { '<leader>jl', 'r\\' },
        { '<leader>kl', 'r/kl' },
        { '<leader>lk', 'r/' },
        { '<leader>n', 'r+' },
        { '<leader>h', 'r-hr<' },
        { '<leader>j', 'r|jrv' },
        { '<leader>k', 'r|kr^' },
        { '<leader>l', 'r-lr>' },
        { '<C-c>', nil, { exit = true } },
      },
    }



  end,
}
