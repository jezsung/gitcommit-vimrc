" Git commit message configuration for Vim
" Enforces best practices: 50 char subject, blank line 2, 72 char body

filetype plugin indent on

augroup GitCommit
    autocmd!
    autocmd FileType gitcommit autocmd TextChangedI,TextChanged <buffer> call s:MaxLength(1, 50)
    autocmd FileType gitcommit autocmd TextChangedI,TextChanged <buffer> call s:Blank(2)
    autocmd FileType gitcommit setlocal textwidth=72 formatoptions+=tcqaw colorcolumn=73
    autocmd FileType gitcommit setlocal autoindent
    autocmd FileType gitcommit setlocal spell spelllang=en_us
augroup END

function! s:MaxLength(line_num, max_length)
    if line(".") == a:line_num
        let line_content = getline(a:line_num)
        if len(line_content) > a:max_length
            call setline(a:line_num, strpart(line_content, 0, a:max_length))
            call cursor(a:line_num, a:max_length + 1)
        endif
    endif
endfunction

function! s:Blank(line_num)
    if line(".") == a:line_num
        call setline(a:line_num, "")
    endif
endfunction
