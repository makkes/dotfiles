call pathogen#infect()
set background=dark
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
filetype plugin on
filetype indent on
set autoindent
set tw=70
set pastetoggle=<F3>
set mouse=a
set ignorecase
set number
noremap <C-n> :tabn<CR>
noremap <F3> :NERDTreeTabsToggle<CR>
nmap <C-k> :tabnext<CR>
nmap <C-j> :tabprev<CR>
inoremap <F4> <c-o>:w<cr>
auto Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
:let NERDTreeQuitOnOpen=0
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=magenta
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
