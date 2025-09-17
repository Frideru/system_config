syntax on
set mouse=a
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set nobackup
colorscheme slate
let &t_SI = "\e[5 q"   " cursor in insert mode
let &t_EI = "\e[2 q"   " cursor in normal mode
let &t_SR = "\e[3 q"   " cursor in replace mode
let &t_ti .= "\e[2 q"  " cursor when vim starts
