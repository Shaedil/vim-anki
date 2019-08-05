" Using vim to create anki cards
" Last Change:  2019 July 25
" Maintainer:   Shaedil <shaedildider@gmail.com>
" License:      This file is protected under the MIT License

scriptencoding utf-8

if exists("g:loaded_ankivim")
    finish
endif
let g:loaded_ankivim = 1

let g:anki_card_types = ['Basic', 'Basic&Reversed', 'Cloze']
let g:anki_card_directory = '$HOME\vimankicards'

" mappings go to autoload
command Anki :execute ':call AnkiInit()'
command Anki2tsv :execute ':call AnkiFinish'

function! AnkiInit() "{{{
    if !isdirectory(g:anki_card_directory)
        if exists("*mkdir")
            call mkdir(g:anki_card_directory, "p")
            echo "Created directory: " . g:anki_card_directory
        else
            echo "Please create directory: " . g:anki_card_directory
        endif
    endif
    " changes directory
    execute ':cd ' . g:anki_card_directory
    " autoload#ankicardtemplate from autoload
    call anki#ankicardtemplate(Basic)
endfunction "}}}
function! AnkiFinish() "{{{
    
endfunction "}}}


