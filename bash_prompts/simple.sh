## Colors
# Foreground
neon_green="\[\e[38;2;46;204;113m\]"    # #2ECC71
bright_blue="\[\e[38;2;52;152;219m\]"   # #3498DB
red="\[\e[38;2;212;42;69m\]"            # #D42A45
light_yellow="\[\e[38;2;249;231;159m\]" # #F9E79F

# Glyphs
folder=
folder2=🗁
folder3=
ubuntu=
triangle=$'\uE0B0'
lower_bend=$'\u256d'
upper_bend=$'\u2570'

# Commands
reset="\[\e[0m\]"  # Reset to default colors
bold="\[\e[1m\]"
dim="\[\e[2m\]"
italic="\[\e[3m\]"

# Load Git functions
parse_git_bg() {
  if git status -s &>/dev/null; then
    echo -e "⟩  $(__git_ps1 '%s')"
  fi
}

# Set window title for kitty tab_bar
PS1="\[\e]0;\w\a\]"

# First line
PS1+="${bright_blue}${lower_bend}─${reset}"
PS1+="${bright_blue}   \W${reset}"
PS1+="${red} \$(parse_git_bg)${reset}"
PS1+="${light_yellow} ⟩  󰔟 \$(date +%H:%M)${reset}"

# New line
PS1+="\n"

# Second line
PS1+="${neon_green}${upper_bend}─❱ ${reset} "

export PS1
