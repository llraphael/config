 # Tmux tips:
 Split pane: C-b %/"
 Navigate pane: C-b arrow
 Create window C-b c
 Close pane Ctrl + d
 Detach session C-b d
 Select which session to detach C-b D
 Adjust pane size: C-b + M-(arrow) or C-b :resize-pane -DULR 2
 Clear history: C-b + :clear-history
 C-b ,

Save/Restore tmux (Plugin)
prefix + Ctrl-s - save
prefix + Ctrl-r - restore


# Netrw
Set cursor directory as root: gn
Go up dir: -
 
# Vim
line completion: c-x + c-l, use c-p and c-n to scroll through the possibilities.

## navigation:
- page full page forward/back, half page down/up, Ctrl-f/b/d/u
- next word/previous word: w/b
- find character forward/backwards: f/F
- goto end of line and switch to insert mode: A

## Yank, paste and delete:
- y3w to copy 3 words; y10<downarrow> to yank 10 below lines; yy yanks the current line.
- p to paste to right/below and P to paste above/before
- t<char>: do x till first instance of character 'char':
	- dta: delete till a
- i<brac> do x to text inside enclosing bracket 'brac', works with {,[,(,<	
	- yi(: yanks arguments inside '('
- a<brac> ditto as above, includes the bracket too in capture
	- da{: deletes everything inside and including {}
