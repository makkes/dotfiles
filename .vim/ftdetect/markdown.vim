" Markdown
autocmd BufNewFile,BufRead *.{md,mkd,mkdn,mark*} set filetype=markdown
autocmd BufWritePost *.{md,mkd,mkdn,mark*} silent !pandoc -c ~/.pandoc/pandoc.css -sSo %:r.html %
