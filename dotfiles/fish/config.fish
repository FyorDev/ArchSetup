neofetch

# exa viewer with l shortcut
alias l 'exa -la --icons'

# init zoxide and z shortcut
alias z='zoxide'
z init fish --hook prompt | source

# file explorer ranger
alias r='ranger'

# lazy no fish greeting ever
function fish_greeting; end
# theme
set -g theme_color_scheme nord
