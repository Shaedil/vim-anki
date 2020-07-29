" Using vim to create anki cards
" Last Change:  2019 December 1
" Maintainer:   Shaedil <shaedildider@gmail.com>
" License:      This file is protected under the MIT License

scriptencoding utf-8

if exists("g:loaded_ankivim")
    finish
endif
let g:loaded_ankivim = 1

let g:anki_card_directory = $HOME . '/vimankicards'

" Some let statements for the functions below
let g:questionmark = '%%@q'
let g:answermark = '%%@a'

command Anki execute ':call AnkiInit()'

function AnkiInit()
	if !isdirectory(g:anki_card_directory)
		execute 'call AnkiCreateFiles()'
	endif
        execute 'call AnkiFindFirstCard()'
endfunction

function! AnkiCreateFiles() "{{{
	if exists("*mkdir")
		call mkdir(g:anki_card_directory, "p")
		execute 'call AnkiDeckSpecificFileGenerator("' . input("How many decks are in your Anki?: ") . '")'
		" silent e Ankimasterdeck.csv
		echo "Created directory: " . g:anki_card_directory
		echo "Created deck-specific import files"
	else
		echoerr "Please create directory: " . g:anki_card_directory
	endif
endfunction "}}}

function! AnkiDeckSpecificFileGenerator(num_of_decks)
	let x = 0
	while a:num_of_decks >= x
		let l:deckname = input("Name of deck: ")
		e l:deckname . ".csv"
		let x += 1
	endwhile
endfunction
" Works in current buffer
function! AnkiFindFirstCard() "{{{
	let questionlinefound = search("%%@q")  "moves cursor to line containing question
	silent execute 'normal! W"qy$' | "jump past marker and then yank to register q
	let answerlinefound = search("%%@a") "moves cursor to line containing answer
	silent execute 'normal! W"ay$' | "jump past marker and then yank to register a
	let answerlinefound = search("%%@t") "moves cursor to line containing tags
	silent execute 'normal! W"ty$' | "jump past marker and then yank to register t
	silent execute 'call AnkiAddCard()'

endfunction
let s:counter = 0
function! AnkiAddCard()
	" Opens an empty tab, then opens the mastercsv file and then appends the yanks
	" at the last line
	if s:counter == 0
		tabnew
		let s:counter = 1
	endif
	tabp
	execute 'cd $HOME\vimankicards'
	execute 'call AnkiWhatDeck("' . input("What deck should this card go into?: ") . '")'
	normal! Go
	execute 'call AnkiWhatCard("' . input("What card type should this card be?: ") . '")'
	w
	tabp
endfunction
function! AnkiWhatCard(cardtype)
    " Manually pasting question lines, answer lines and tag lines using yank
    " registers a and p and appending commas between them.
	if a:cardtype == 'basic'
		normal! $"qp
		normal! G$a, 
		normal! $"ap
		normal! $a, 
		normal! $"tp
	if a:cardtype == 'basic&reversed'
		normal! $"qp
		normal! G$a, 
		normal! $"ap
		normal! $a, 
		normal! $"tp
		normal! Go
		normal! $"ap
		normal! G$a, 
		normal! "qp
		normal! $a, 
		normal! $"tp
	if a:cardtype == 'cloze'
		echoerr "cardtype not supported yet!"
endfunction
function! AnkiWhatDeck(name_of_deck)
	let fullname_of_deck = a:name_of_deck . ".csv"
	e fullname_of_deck
endfunction
