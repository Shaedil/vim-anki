# vim-anki
[![Vim](https://img.shields.io/badge/BUILT%20WITH-VIM-brightgreen?style=for-the-badge&labelColor=64dd17)](https://github.com/vim/vim)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](https://github.com/Shaedil/vim-anki)
Vim-anki is a vim plugin that allows you to create cards within [vimwiki](https://github.com/vimwiki/vimwiki). As of right now, vim-anki allows you to create with the default card types within the anki program itself, which includes:
- [ ] Basic
- [ ] Basic and reversed
- [ ] Cloze

## How does it work?
### Using Vim-anki
Vim-anki converts its files to .tsv(s). Just execute `:AnkiConvert` in the buffer where the ankifiable information is found. 
The plugin can only recognize certain marks in the buffer, so that the plugin can tell which sentence is the answer and which is the question. 
A typical case usage is below:
### Template
```vim
= Chapter 3 =
  * Concepts about procrastination and habits and reading techniques
	== How Do I Utilize tomator-timer? == 
	%%@q How Do I Utilize tomator-timer?
      * Shut off all distractions before doing work!
	%%@a Shut off all distractions before doing work
```
`%%` is the syntax for comments in vimwiki and gets ignored when converting to HTML. The key marks here are `@q` and `@a`. These dictate which fields are being filled into the tsv. It is *critical*  that you have a space from the mark to the question/answer. _Why?_ Well, look [below](https://github/Shaedil/vim-anki#future-plans).
## Installation
### Pathogen:
Just download the zip file and extract to the 'bundle' folder
### Vim-plug: 
Add the following snippet to your vimrc if you are comfortable with vim-plug
```vim
Plug 'Shaedil/vim-anki'
```
## Future plans
* Not necessarily in order!
- [ ] '@q' works anywhere, not just limited to vimwiki
	- [ ] Some useful 'motions' and commands for this would be nice to have e.g:
		* Use m as the motion (`mj`, `<ctrl-v>jjj m`) To convert all cards in the buffer `:AnkiAll2tsv`
- [ ] Add support for more card types. This would mean new markers.
	- [ ] Cloze support. Maybe '@c'?
	- [ ] Basic and reversed support. Maybe '@qr' and '@ar' for (question/answer:reversed)?
	- [ ] Image support. Maybe '@i'?
	- [ ] [Cloze Overlapping](https://ankiweb.net/shared/info/969733775) support maybe '@co'?
	- [ ] [LaTeX](https://www.quora.com/How-can-I-insert-mathematical-equations-into-Anki) support '@l'?
- [ ] TBD
