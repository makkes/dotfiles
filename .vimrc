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
nnoremap <C-l> :tabnext<CR>
nnoremap <C-k> :tabprev<CR>
nnoremap <F3> :NERDTreeTabsToggle<CR>
nnoremap <F4> :bd<CR>
"inoremap <F4> <c-o>:w<cr>
"nnoremap <F5> :only<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>
auto Filetype html,htmldjango,xml,xsl source ~/.vim/scripts/closetag.vim
:let NERDTreeQuitOnOpen=0
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=magenta
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

au BufRead,BufNewFile *.jsm setfiletype javascript

let g:Tex_DefaultTargetFormat='pdf'

let g:syntastic_auto_jump=1
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['c'] }

" Always display the status line, even if only one window is displayed
set laststatus=2
" Show full file path in status line
set statusline=%<\ %n:%F\ %m%r%y\ %=line\ %l/%L,\ col\ %c%V
