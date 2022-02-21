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
| <kbd>ctrl</kbd><kbd>shift</kbd><kbd>+</kbd> | increase font size |
| <kbd>ctrl</kbd><kbd>shift</kbd><kbd>-</kbd> | decrease font size |
| <kbd>ctrl</kbd><kbd>shift</kbd><kbd>=</kbd> | reset font size |
| <kbd>ctrl</kbd><kbd>shift</kbd><kbd>s</kbd> | cycle through fonts |
| <kbd>ctrl</kbd><kbd>shift</kbd><kbd>i</kbd> | invert colors |

## Patches

- Scrollback
- Scrollback-mouse
- Scrollback-mouse-altscreen
- newterm
- ligatures
- invert colors
- desktop entry
- Fix Keyboard Input
    - this is really cool because it allows for <kbd>ctrl</kbd><kbd>Tab</kbd>
      to be mapped in neovim!

## TODO

- improve nix integration
    - key-binding for `exit` command
    - <kbd>ctrl</kbd><kbd>shift</kbd><kbd>enter</kbd> calls function that
        - opens a new terminal in the same directory
        - also executes `nix-shell` in the new terminal if currently
          inside a `nix-shell`
    - sixel support 
        - for neovim-latex equation preview: https://github.com/bytesnake/vim-preview-math
