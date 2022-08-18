set nofoldenable
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
set encoding=utf-8
set t_Co=256
colorscheme solarized
set expandtab
set hlsearch "highlight matches of current search
set formatoptions=tcroqn
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set tw=150
set ignorecase
set number
set hidden
"set complete+=k
"set completeopt=longest,menuone
set cursorline "highlight current line for better visibility
set colorcolumn=+1
set nostartofline
command! RemoveDuplicateWhitespaces 1,$s/\([^ ]\)   */\1 /ge

"keyboard mappings for different file types
autocmd FileType javascript,css nmap <silent> ,; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> ,; <ESC>:call cosco#commaOrSemiColon()<CR>a
autocmd Filetype html,htmldjango,xml,xsl source ~/.vim/scripts/closetag.vim
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
"nnoremap <F4> :bd<CR>
"inoremap <F4> <c-o>:w<cr>
"nnoremap <F5> :only<CR>
nnoremap <silent> <F9> :TagbarOpen jfc<CR>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" use Enter and Shift-Enter in normal mode to
" insert new lines without entering insert mode.
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" Highlighting
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=magenta
hi TabLineSel ctermfg=Red ctermbg=Black

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

au BufRead,BufNewFile *.jsm setfiletype javascript

" NERDTree stuff
:let NERDTreeQuitOnOpen=0
nnoremap <F3> :NERDTreeFind<CR>
nnoremap <F4> :NERDTreeClose<CR>

" neocomplete stuff
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" latex-suite stuff
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_FoldedSections=''
let g:Tex_FoldedEnvironments=''
let g:Tex_FoldedCommands=''
let g:Tex_FoldedMisc=''
set grepprg=grep\ -nH\ $*

" Syntastic stuff
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_auto_jump=0
let g:syntastic_check_on_open=0
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['javascript'],
                           \ 'passive_filetypes': ['c', 'go'] }

" vim-go stuff
let g:go_fmt_autosave = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_decls_includes = "func,type"
let g:go_snippet_engine = "neosnippet"
au FileType go nmap <Leader>gd <Plug>(go-doc)

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

" CtrlP stuff
nnoremap <c-b> :CtrlPBuffer<cr>
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat,*/node_modules/*
let g:ctrlp_max_files=10000

" Tagbar
"autocmd VimEnter * nested :call tagbar#autoopen(1)
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

set backspace=indent,eol,start

function! ResCur()
    if &ft =~ 'gitcommit'
        return
    endif
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

runtime vimrc_local
