require("erdzot.remap")
require("erdzot.set")
require("erdzot.packer")

require 'nvim-treesitter.install'.compilers = { "clang","zig" }

-- require("rose-pine").setup({
--     disable_background = true
-- })
-- vim.cmd("colorscheme rose-pine")
require("onedark").setup {
    transparent = false 
}
require("onedark").load()
