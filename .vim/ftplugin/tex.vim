let g:Tex_Env_figure =     "\\begin{figure}[<+htpb+>]\<cr>\\centering\<cr>\\includegraphics{<+file+>}\<cr>\\caption{<+caption text+>}\<cr>\\label{fig:<+label+>}\<cr>\\end{figure}<++>"
call IMAP('lstinline', '\lstinline|<++>|', 'tex')
set tw=0
