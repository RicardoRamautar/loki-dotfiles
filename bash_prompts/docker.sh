## Colors
# Foreground
color1="\[\e[38;2;52;152;219m\]"   # #3498DB
color2="\[\e[38;2;142;68;173m\]"    # #2ECC71

# Glyphs
folder= 
arrow=─❱
lower_bend=$'\u256d'
upper_bend=$'\u2570'
separator=⟩

# Commands
reset="\[\e[0m\]"  # Reset to default colors
bold="\[\e[1m\]"
dim="\[\e[2m\]"
italic="\[\e[3m\]"

# Set window title for kitty tab_bar
PS1="\[\e]0;\w\a\]"

# First line
PS1+="${color1}${lower_bend}─${reset}"
PS1+="${color1}   ${bold}\W${reset}"

# New line
PS1+="\n"

# Second line
PS1+="${color2}${upper_bend}${arrow} ${reset} "

export PS1
