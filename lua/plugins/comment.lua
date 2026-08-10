return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
	},
  config = function()
    require("Comment").setup()
    local ft = require("Comment.ft")

    ft.lsv = {'// %s', '/* %s */'}
  end,
}
