# Set default editor
bleopt editor=nano

# Disable syntax highlighting
bleopt highlight_syntax=

# Disable syntax highlighting
bleopt highlight_syntax=

# Disable highlighting based on filenames
bleopt highlight_filename=

# Disable highlighting based on variable types
bleopt highlight_variable=

# Disable EOF marker like "[ble: EOF]"
bleopt prompt_eol_mark=''

# Disable error exit marker like "[ble: exit %d]"
bleopt exec_errexit_mark=

# Tip: you may instead specify another string
bleopt exec_elapsed_mark=$'\e[94m[%ss  (%s %%)]\e[m'

# Disable exit marker like "[ble: exit]"
bleopt exec_exit_mark=

# Disable some other markers like "[ble: ...]"
bleopt edit_marker=
bleopt edit_marker_error=

ble-face -s auto_complete             fg=black

# Ctrl+h: undo change in command
# ble-bind -m emacs -f 'C-h'   'emacs/undo'

# ble-bind -m emacs -f 'C-?' 'delete-region-or delete-backward-char'