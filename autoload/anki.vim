" Last Change:  2019 July 25
" Maintainer:   Shaedil <shaedildider@gmail.com>
" License:      This file is protected under the MIT License

if exists("g:loaded_anki_autoload")
    finish
endif
let g:loaded_anki_autoload = 1

function! AnkiCardTemplates(cardtype, index) "{{{
" opens window with the 'basic' note type from being :r that template
    if a:cardtype == 'Basic' && a:index == 0
        exec ':new' | exec ':r ' . s:PathogenAnkiTemplatePath . '\basic.txt'
    elseif a:cardtype == 'Basic'
        exec ':r ' . s:PathogenAnkiTemplatePath . '\basic.txt'
    elseif a:cardtype == 'Basic&Reversed'
        exec ':r ' . s:PathogenAnkiTemplatePath . '\basic&reversed.txt'
    elseif a:cardtype == 'Cloze'
        exec ''
    endif
endfunction "}}}
