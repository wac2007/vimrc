" Use base vim plugins
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
"---------------------------------------------------------------
"---------------------------------------------------------------

"---------------------------------------------------------------
" Exclusive nvim comands
"---------------------------------------------------------------

" Init plugin manager
call plug#begin('~/.vim/plugged')

" https://github.com/github/copilot.vim
Plug 'github/copilot.vim'

" https://github.com/stevearc/vim-arduino
Plug 'stevearc/vim-arduino'

call plug#end()

" End of plugins
"---------------------------------------------------------------
"---------------------------------------------------------------
" Configs

" Vim arduino
nnoremap <buffer> <leader>aa <cmd>ArduinoAttach<CR>
nnoremap <buffer> <leader>am <cmd>ArduinoVerify<CR>
nnoremap <buffer> <leader>au <cmd>ArduinoUpload<CR>
nnoremap <buffer> <leader>ad <cmd>ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab <cmd>ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap <cmd>ArduinoChooseProgrammer<CR>


let g:arduino_dir = "$HOME/Library/Arduino15"
let g:arduino_home_dir = "$HOME/Library/Arduino15"
let g:arduino_cmd = "/opt/homebrew/bin/arduino-cli"
