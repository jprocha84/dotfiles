eval "$(pyenv init -)"
export PATH=$PATH:$HOME/em_tools


# Load version control information
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{040}%n%f at %F{166}%m%f in %F{031}${PWD/#$HOME/~}%f ${vcs_info_msg_0_}%{$fg_bold[white]%}>%{$reset_color%} '

# Format the git branch name in the prompt
zstyle ':vcs_info:git:*' formats 'on %F{011} %b%f'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

