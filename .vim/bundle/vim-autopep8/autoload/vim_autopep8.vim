if exists("b:loaded_autopep8_ftplugin")
    finish
endif
let b:loaded_autopep8_ftplugin=1

fun! vim_autopep8#fix_current_file() "{{{
    if &modifiable && &modified
        try
            write
        catch /E212/
            echohl Error | echo "File modified and I can't save it. Cancel operation." | echohl None
            return 0
        endtry
    endif
    python vim_autopep8.fix_current_file()
    cclose
    edit
    syntax on
endfunction "}}}

python << EOF

sys.path.insert(1, os.path.join(vim.eval('expand("<sfile>:p:h:h")'), 'plugin'))
import vim_autopep8
sys.path.pop(1)

EOF
