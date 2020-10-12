# Theme based on the oh-my-zsh gentoo theme
# vim: ft=zsh

function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

#PROMPT='%(!.%{$fg_bold[white]%}.%{$fg_bold[white]%}%n@)%m %{$fg_bold[green]%}%(!.%1~.%~) %{$fg_bold[yellow]%}$(git_prompt_info)%{$fg_bold[white]%}$(prompt_char)%{$reset_color%} '
PROMPT='%(!.%{$fg[white]%}.%{$fg[white]%}%n@)%m %{$fg[green]%}%(!.%1~.%~) %{$fg[yellow]%}$(git_prompt_info)%{$fg[white]%}$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
