## Colors
blue="\[\e[38;2;69;133;136m\]"          #458588
red="\[\e[38;2;204;36;29m\]"            #CC241D
yellow="\[\e[38;2;215;153;33m\]"        #D79921

# Glyphs
folder= 
git_logo= 
arrow=❱
separator=⟩

# Commands
reset="\[\e[0m\]"  # Reset to default colors
bold="\[\e[1m\]"
dim="\[\e[2m\]"
italic="\[\e[3m\]"

# Load Git functions
parse_git_bg() {
  if git status -s &>/dev/null; then
    echo -e " ${separator}  ${git_logo} $(__git_ps1 '%s')"
  fi
}

# Set window title for kitty tab_bar
PS1="\[\e]0;\w\a\]"

# First line
PS1+="${blue}   ${folder}  \W${reset}"
PS1+="${red} \$(parse_git_bg)${reset}"

# New line
PS1+="\n"

# Second line
PS1+="${yellow}${arrow} ${reset} "

export PS1
