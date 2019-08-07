# vim-anki
Vim-anki is a vim plugin that allows you to create cards within vim. As of right now, vim-anki allows you to create with the default card types within the anki program itself which includes:
- [x] Basic
- [x] Basic and reversed
- [x] Cloze

## How does it work?
### Using Vim-anki
Vim-anki starts when you enter the command `:Anki`. At first use, this will
create the directory: `$HOME/vimankicards` and cd into it. The buffer will then
be propagated with special text or a 'template' of the card. Follow the
instructions and press `<C-A>` to add in a card and the plugin's magic will add
it to a text file called 'ankisession'. The 'ankisession' is just a text file
of concatenated 'templates' bounded by your current vim session. After
reopening vim, and initiating vim-anki, the buffer is loaded into a special
screen that details your last 'ankisession' and an option to create a new
'ankisession'.

### Conversion
Vim-anki converts its files to tsv(s). Use `mm` to merge an ankisession when you're in the special menu (takes a count) and `m` as a motion (`mj` or `mk`) To convert *all* sessions for the day to a tsv, use this command: `:AnkiAll2tsv`.

## Installation
If you use pathogen/vim-plug, you're in luck.

### Pathogen:
Just download the zip file and extract to the 'bundle' folder

### Vim-plug:
Add the following snippet to your vimrc if you are comfortable with vim-plug
```
Plug 'Shaedil/vim-anki'
```
## License
MIT License as of 2019, see LICENSE for more details.
