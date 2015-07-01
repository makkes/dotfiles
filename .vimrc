filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
set t_Co=256
colorscheme late_evening
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
set hidden
set dict+=/usr/share/dict/british-english,/usr/share/dict/ngerman
set complete+=k
command! RemoveDuplicateWhitespaces 1,$s/\([^ ]\)   */\1 /ge
autocmd FileType javascript,css nmap <silent> ,; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> ,; <ESC>:call cosco#commaOrSemiColon()<CR>a
inoremap <C-r><C-d> <C-o>:RemoveDuplicateWhitespaces<CR>
nnoremap <C-r><C-d> :RemoveDuplicateWhitespaces<CR>
inoremap <C-c> <CR><Esc>O
inoremap <silent> <C-s> <C-o>:w<CR>
inoremap <Down> <C-o>g<Down>
inoremap <Up> <C-o>g<Up>
nnoremap <Down> g<Down>
nnoremap <Up> g<Up>
nnoremap <C-j> :tabprev<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <F3> :NERDTreeTabsToggle<CR>
nnoremap <F4> :bd<CR>
"inoremap <F4> <c-o>:w<cr>
"nnoremap <F5> :only<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>
auto Filetype html,htmldjango,xml,xsl source ~/.vim/scripts/closetag.vim
:let NERDTreeQuitOnOpen=0

" Highlighting
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=magenta
hi TabLineSel ctermfg=Red ctermbg=Black

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

au BufRead,BufNewFile *.jsm setfiletype javascript

" Command-T stuff
let g:CommandTWildIgnore=&wildignore . ",**/node_modules/*"
let g:CommandTMaxDepth=15
let g:CommandTMaxFiles=100000
let g:CommandTFilescanner="git"

" latex-suite stuff
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_FoldedSections=''
let g:Tex_FoldedEnvironments=''
let g:Tex_FoldedCommands=''
let g:Tex_FoldedMisc=''
set grepprg=grep\ -nH\ $*

" Syntastic stuff
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_auto_jump=0
let g:syntastic_check_on_open=0
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['javascript'],
                           \ 'passive_filetypes': ['c'] }

" Tern stuff
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" Always display the status line, even if only one window is displayed
set laststatus=2
" Show full file path in status line
set statusline=%<\ %n:%F\ %m%r%y\ %=line\ %l/%L,\ col\ %c%V
set modeline
" always vertically center the cursor
set scrolloff=999
