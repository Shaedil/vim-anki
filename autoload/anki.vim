" Last Change:  2019 July 25
" Maintainer:   Shaedil <shaedildider@gmail.com>
" License:      This file is protected under the MIT License

if exists("g:loaded_anki_autoload")
    finish
endif
let g:loaded_anki_autoload = 1

function! AnkiCardTemplates(cardtype) "{{{
" opens window with the 'basic' note type from being :r that template
    if s:cardtype == 'Basic'
        exec ':new' | exec 'r ../templates/basic.txt'
    elseif s:cardtype == 'Basic&Reversed'
        exec ''
    elseif s:cardtype == 'Cloze'
        exec ''
    endif
endfunction "}}}
