require 'user.options'
require 'user.bepo'
require 'user.keymaps'
require 'user.plugins'
require 'user.colorscheme'
require 'user.cmp'
require 'user.lsp'
require 'user.comment'
require 'user.telescope'
require 'user.treesitter'
require 'user.autopairs'
require 'user.gitsigns'
require 'user.nvim-tree'
require 'user.bufferline'

require('feline').setup({preset = 'noicon'})

vim.cmd([[set mouse=]])
-- When editing a file, always jump to the last known cursor position.
-- Don't do it when the position is invalid or when inside an event handler
-- (happens when dropping a file on gvim).
vim.cmd[[
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
]]

vim.cmd([[
  augroup CmpDebounceAuGroup
    au!
    au TextChangedI * lua require('user.debounce').debounce()
  augroup end
]])

vim.cmd([[
  let g:localvimrc_ask=0
  let g:localvimrc_sandbox=0
]])

-- UTF8 à tester
-- command! -nargs=* UTF8 call EncodeUTF8(<f-args>)
-- fun! EncodeUTF8(...)
--    let utf8str = ""
--    for i in a:000
--       let utf8str .= "\\x" . i
--    endfor
--    exe "norm i" . eval("\"".utf8str."\"")
-- endfun
