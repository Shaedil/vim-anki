" Using vim to create anki cards
" Last Change:  2019 November 30
" Maintainer:   Shaedil <shaedildider@gmail.com>
" License:      This file is protected under the MIT License

scriptencoding utf-8

"	%%@q hell yeah test?
"	%%@a testly so
if exists("g:loaded_ankivim")
    finish
endif
let g:loaded_ankivim = 1

let g:anki_card_directory = $HOME . '\vimankicards'

" command Anki2tsv :execute ':call AnkiInit()'
" Some let statements for the functions below
let questionmark = '%%@q'
let answermark = '%%@a'

command Anki execute ':call AnkiInit()'

function AnkiInit()
	if !isdirectory(g:anki_card_directory)
		execute 'call AnkiCreateDir()'
	endif
	execute 'call AnkiFindFirstCard()'
endfunction

function! AnkiCreateDir() "{{{
	if exists("*mkdir")
		call mkdir(g:anki_card_directory, "p")
		silent e Ankimasterdeck.csv
		echo "Created directory: " . g:anki_card_directory
	else
		echoerr "Please create directory: " . g:anki_card_directory
	endif
endfunction "}}}

" Works in current buffer
function! AnkiFindFirstCard() "{{{
" %%@q hell yeah nigar?
" %%@a Nigardly so
	let l:questionlinefound = search(questionmark)
	" The above line jumps to the first instance of the mark in the text file
	silent execute 'normal! W"qy$' | "jump past marker and then yank to register q
	let l:answerlinefound = search(answermark) "returns linenumber
	silent execute 'normal! W"ay$' | "jump past marker and then yank to register a
	silent execute 'call AnkiAddCard()'

endfunction
function! AnkiAddCard()
	" Opens an empty tab, then opens the mastercsv file and then appends the yanks
	" at the last line
	tabnew 
	execute 'cd $HOME\vimankicards'
	e Ankimasterdeck.csv
	normal! Go
	normal! $"qp
	normal! G$a,
	normal! "ap
	tabp
endfunction
