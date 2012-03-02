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
noremap <C-n> :tabn<CR>
noremap <F3> :NERDTreeToggle<CR>
nmap <C-k> :tabnext<CR>
nmap <C-j> :tabprev<CR>
inoremap <F4> <c-o>:w<cr>
auto Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
:let NERDTreeQuitOnOpen=1
