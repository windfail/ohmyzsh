autoload -Uz colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes false
zstyle ':vcs_info:*' unstagedstr '%F{red}*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats '%F{5}(%F{2}%b%F{3}|%F{1}%a%c%u%m%F{5})%f '
zstyle ':vcs_info:*' formats '%F{5}(%F{2}%b%c%u%m%F{5})%f '
zstyle ':vcs_info:svn:*' branchformat '%b'
zstyle ':vcs_info:svn:*' actionformats '%F{5}(%F{2}%b%F{1}:%{3}%i%F{3}|%F{1}%a%c%u%m%F{5})%f '
zstyle ':vcs_info:svn:*' formats '%F{5}(%F{2}%b%F{1}:%F{3}%i%c%u%m%F{5})%f '
zstyle ':vcs_info:*' enable git cvs svn

gentoo_precmd() {
  vcs_info
}

autoload -U add-zsh-hook
add-zsh-hook precmd gentoo_precmd

PROMPT='%(!.%B%F{red}.%B%F{green}%n@)%m %F{blue}%(!.%1~.%~) ${vcs_info_msg_0_}%F{blue}%(!.#.$)%k%b%f '
