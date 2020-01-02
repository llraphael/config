# Tmux tips
- Split pane: C-b %/"
- Navigate pane: C-b arrow
- Create window: C-b c
- Close pane: Ctrl + d
- Detach session: C-b d
- Select which session to detach: C-b D
- Adjust pane size: C-b + M-(arrow) or C-b :resize-pane -DULR 2
- Clear history: C-b + :clear-history
- 
- /*Save/Restore tmux (Plugin)*/
- Save: prefix + Ctrl-s - save
- Restore: prefix + Ctrl-r - restore


# Netrw
- Set cursor directory as root: gn
- Go up dir: -

# Vim
line completion: c-x + c-l, use c-p and c-n to scroll through the possibilities.

## Navigation:
- page full page forward/back, half page down/up, Ctrl-f/b/d/u
- next word/previous word: w/b
- find character forward/backwards: f/F
- goto end of line and switch to insert mode: A
- */#: search the next occurence of the current word/reverse direction
- ctrl-i/o: take forward/back

## Buffer
- C-w s/v: horizontal/vertical split current window
- C-w: every command concerning windows start with it.
- C-w + arrow: move between splits
- C-w =: make split equal size

## Yank, paste and delete:
- y3w to copy 3 words; y10<downarrow> to yank 10 below lines; yy yanks the current line.
- p to paste to right/below and P to paste above/before
- t<char>: do x till first instance of character 'char':
	- dta: delete till a
- i<brac> do x to text inside enclosing bracket 'brac', works with {,[,(,<	
	- yi(: yanks arguments inside '('
- a<brac> ditto as above, includes the bracket too in capture
	- da{: deletes everything inside and including {}
- Replace with range: :1,6s/
- Replace use Backreference in regex matching

## Indentation
- =G: auto indent till end of buffer
- ==: indent current line
- =4<downarrow>: index next 4 lines

## Recording and Macro
- q<register>: Use q combined with any key(register) between a to z to start recording
- Make actions
- @<register>: Use q to quit and use @key to repeat action
- Use 100@key to repeat 100 times or @@ to repeat the last action
- .: Repeat last change
- ~: toggle the case of the character below cursor

# Markdown Tips
- zR: open all folds
- zM: folds everything 
- za/A: open a fold your cursor is on non-recursively/recursively
- zc/C: close a fold your cursor is on non-recursively/recursively
- zm/zr: increases/reduces fold level throughout the buffer
- :help fold-commands for details
