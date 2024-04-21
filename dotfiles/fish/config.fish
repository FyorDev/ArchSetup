neofetch

# exa viewer with l shortcut
alias l 'exa -laH --icons --git --group-directories-first --time-style=long-iso --hyperlink'
alias lg 'l --git-ignore'
alias lr 'exa --tree --icons --group-directories-first --hyperlink'
alias lrg 'lr --git-ignore'
# bat cat replacement
alias bat 'bat --theme ansi'

# init zoxide and z shortcut
alias z 'zoxide'
z init fish --hook prompt | source

# file explorer ranger

function r
  set tempfile '/tmp/chosendir'
  ranger --choosedir=$tempfile (pwd)

  if test -f $tempfile
      if [ (cat $tempfile) != (pwd) ]
        cd (cat $tempfile)
      end
  end

  rm -f $tempfile

end

function fish_user_key_bindings
    bind \co 'r ; commandline -f repaint'
    bind \cn 'nvim'
end

# nvim as editor
set -gx EDITOR nvim 
set -gx GIT_EDITOR nvim

# lazy no fish greeting ever
function fish_greeting; end
# theme
set -g theme_color_scheme nord
