# TMUX QUICK REFERENCE

Note: an example tmux config file is found at /usr/share/doc/tmux/
(that sample config has a fix for colors not appearing whilst in tmux)

## tmux help
prefix ?

## scroll up/down (supports j/k if you have vim stuff enabled)
prefix [

## see a clock (for some reason)
prefix t

## break a pane into a new window (very cool)
prefix !

## swap panes
prefix {
prefix }

## swap windows
prefix <
prefix >

## ZOOM!
prefix z
(and do the same thing to disable zoom)

## Copy mode
Type prefix + [ to enter copy mode. It helps if you have vim nagivation enabled.
Start selecting some text with the spacebar. Complete selection with enter.

To paste copied text, use prefix + ]
