filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
set background=dark
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set tw=79
set mouse=a
set ignorecase
set number
noremap <C-n> :tabn<CR>
noremap <F3> :NERDTreeTabsToggle<CR>
nmap <C-k> :tabnext<CR>
nmap <C-j> :tabprev<CR>
nmap <F4> :bd<CR>
nmap <F5> :only<CR>
"inoremap <F4> <c-o>:w<cr>
auto Filetype html,htmldjango,xml,xsl source ~/.vim/scripts/closetag.vim
:let NERDTreeQuitOnOpen=0
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=magenta
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
