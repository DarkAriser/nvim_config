return {
  {
    "gbprod/cutlass.nvim",
    config = function()
      require("cutlass").setup({
        select = "_",
        delete = "_",
        change = "_",
        exclude = { "ns", "nS" },
      })
    end
  }
}
