" Last Change:  2019 July 25
" Maintainer:   Shaedil <shaedildider@gmail.com>
" License:      This file is protected under the MIT License

if exists("g:loaded_anki_autoload")
    finish
endif
let g:loaded_anki_autoload = 1

" This if case is to make sure that the path to the template folder is correct
if g:loaded_pathogen = 1
    let g:AnkiTemplatePath=$VIMRUNTIME . '\bundle\vim-anki-master\templates'
elseif g:loaded_plug = 1
    let g:AnkiTemplatePath=$VIMRUNTIME . '\plugged\vim-anki\templates'
else
    let g:AnkiTemplatePath=''
    echoerr "Vim-anki cannot find its own plugin directory! Please help it by adding 'let g:AnkiTemplatePath = path\to\vim-anki\plugin' to your vimrc!"
endif

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
