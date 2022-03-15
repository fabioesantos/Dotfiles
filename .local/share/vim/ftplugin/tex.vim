" Show word count in latex files
set statusline+=\ [%{WordCount()}\ words]

" Live word count
let g:word_count=wordcount().words
function WordCount()
    if has_key(wordcount(),'visual_words')
        let g:word_count=wordcount().visual_words."/".wordcount().words " count selected words
    else
        let g:word_count=wordcount().cursor_words."/".wordcount().words " or shows words 'so far'
    endif
    return g:word_count
endfunction

"------------ 
set errorformat=%f:%l:%c:%m 
function Latex() 
    update 
    let file=expand('%:t:r') 
    let errors=system('compiler '.file.'.tex | latex-errorfilter') 
    if errors=="" 
        echo 'LaTeX ok: No warning/error' 
    else 
        cexpr errors 
    endif 
endfunction 

map <F5> :call Latex()<CR> 
map <F7> :cprev<CR> 
map <F8> :cnext<CR> 
map <F9> :clist<CR>
"------------ 
