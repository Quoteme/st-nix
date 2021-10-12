# Lucas Simple Terminal

This is my second attempt at extending the [simple terminal](http://st.suckless.org/)
but this time I decided to just prepatch all the things I would like
into the sourcecode. This allows for much easier editing of the source
code (at least to my knowledge), because I can now just edit what I
want and then do a "nix-build".

## Keyboard Shortcuts

| Key | Action |
|---|---|
| <kbd>ctrl</kbd><kbd>shift</kbd><kbd>enter</kbd> | open new terminal in same directory |

## Patches

- Scrollback
- Scrollback-mouse
- Scrollback-mouse-altscreen
- newterm
