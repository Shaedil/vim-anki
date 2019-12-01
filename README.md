# vim-anki
[![Vim](https://img.shields.io/badge/BUILT%20WITH-VIM-brightgreen?style=for-the-badge&labelColor=64dd17)](https://github.com/vim/vim)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](https://github.com/Shaedil/vim-anki)

Vim-anki is a vim plugin that allows you to create anki cards within vim. Currently, vim-anki allows you to create these types of cards:
- [x] Basic
- [x] Basic and reversed
- [ ] Cloze

## How does it work?
### Using Vim-anki
Vim-anki converts its cards to .csv. Execute `:Anki` in the buffer where the ankifiable information is found.
The plugin will search the first instance of a possible anki card under the cursor. It searches the buffer for special "markers" that indicate to the plugin what line contains the front of a card and the back of a card.
A typical usage case follows as such:
### Template
```vim
= Chapter 3 =
  * Talks about procrastination, habits and reading techniques
	== Optimizing time and effort ==
	%%@q How can I use tomato-timer without being distracted?
	%%@a Rid yourself of any possible distractions before starting
	%%@t meta-learning
```
The "markers" %%@q, %%@a, %%@t are used exactly to indicate the question, answer and tag respectively.
`%%` is included in the marker because it is the syntax for comments in vimwiki and gets ignored when converting to HTML. Though, in other files, you might have to surround the marker with normal commenting syntax, like: `# %%@q How can I u...?`
## Installation
### Pathogen:
Download the zip file and extract to the 'bundle' folder
### Vim-plug:
Add the following snippet to your vimrc if you are comfortable with vim-plug
```vim
Plug 'Shaedil/vim-anki'
```
## Future plans
* Not necessarily in order!
- [x] '@q' works anywhere, not just limited to vimwiki
- [ ] Add support for more card types. This would mean new markers.
	- [ ] Cloze support.
	- [x] Basic and reversed support.
	- [ ] Image support.
	- [ ] [Cloze Overlapping](https://ankiweb.net/shared/info/969733775) support.
	- [ ] [LaTeX](https://www.quora.com/How-can-I-insert-mathematical-equations-into-Anki).
- [ ] TBD
