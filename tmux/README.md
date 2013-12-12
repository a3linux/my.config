TMux quick guide and usage
==========================

# Quick Guide of Tmux

* New named session
```
$ tmux new -s <sess-name>
```

* Attach named session
```
$ tmux a -d -t <sess-name>
```

-d is used for deattach other attached sessions.

* List session

```
$ tmux ls
```

# Configuration Usage

## Prfefix key is Ctrl-Z

## Windows(Tabs)

```
c - new window
w - list windows
f - find window
, - name window
& - kill window
```

## Panes(splits)

```
| - Vertical split
- - Horizontal split
o - switch pane
q - show pane numbers
x - kill pane
h, j, k, l - switch pane as VI mode
<blank> - toggle between panes layouts
```

## Resize Panes(Useful)
```
PREFIX z - Zoom / Unzoom pane
PREFIX : resize-pane   By default, it is resize to down
PREFIX : resize-pane -U | -L | -R resize pane to up, left and right
```

## Copy Mode
In copy mode, use VI key mode, h,j,k,l move and <blank> to start select, <enter> to copy the select contents.
```
PREFIX [  - Enter the copy mode
PREFIX ]  - Paste into current pane
```

