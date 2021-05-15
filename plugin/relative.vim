let s:save_cpo = &cpo
set cpo&vim

augroup NvimRelative

  " autocmd InsertEnter * lua require'relative'.setnumbers()
  " autocmd InsertLeave * lua require'relative'.setrelative()

  autocmd BufNewFile  * lua require'relative'.setnumbers()
  autocmd BufReadPost  * lua require'relative'.setrelative()

  autocmd FocusLost   * lua require'relative'.setnumbers()
  autocmd FocusGained * lua require'relative'.setrelative()

  " autocmd CmdLineEnter * set norelativenumber | redraw
  " autocmd CmdlineLeave * set relativenumber

  autocmd WinEnter * lua require'relative'.setrelative()
  autocmd WinLeave * lua require'relative'.setnumbers()

augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
