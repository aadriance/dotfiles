  source ~/.config/zsh/antigen.zsh

  # Load the oh-my-zsh's library.
  antigen use oh-my-zsh

  # Bundles from the default repo (robbyrussell's oh-my-zsh).
  antigen bundle command-not-found
  antigen bundle fzf
  antigen bundle brew
  antigen bundle fd
  antigen bundle ripgrep
  antigen bundle zoxide

  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle Aloxaf/fzf-tab
  # Tell Antigen that you're done.
  antigen apply


  source <("/opt/homebrew/bin/starship" init zsh --print-full-init)

  export PATH=${PATH}:`go env GOPATH`/bin
  unsetopt BEEP

# Publish ZMX_SESSION for WezTerm tab naming.
# We emit both SetUserVar (WezTerm-specific) and OSC 2 title (portable fallback).
function __wezterm_set_user_var() {
  [[ -t 1 ]] || return

  local name="$1"
  local value="${2-}"
  local encoded
  encoded=$(printf '%s' "$value" | base64 | tr -d '\r\n')

  if [[ -n "$TMUX" ]]; then
    printf '\ePtmux;\e\e]1337;SetUserVar=%s=%s\a\e\\' "$name" "$encoded"
  else
    printf '\e]1337;SetUserVar=%s=%s\a' "$name" "$encoded"
  fi
}

function __term_set_title() {
  [[ -t 1 ]] || return

  local title="$1"
  if [[ -n "$TMUX" ]]; then
    printf '\ePtmux;\e\e]2;%s\a\e\\' "$title"
  else
    printf '\e]2;%s\a' "$title"
  fi
}

function __wezterm_sync_zmx_session() {
  local session="${ZMX_SESSION:-}"
  __wezterm_set_user_var "ZMX_SESSION" "$session"

  if [[ -n "$session" ]]; then
    __term_set_title "$session"
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd __wezterm_sync_zmx_session
add-zsh-hook chpwd __wezterm_sync_zmx_session
__wezterm_sync_zmx_session
