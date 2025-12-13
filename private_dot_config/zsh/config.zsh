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
  antigen bundle ~/code/briefcase-zsh/ --no-local-clone
  # Tell Antigen that you're done.
  antigen apply


  source <("/opt/homebrew/bin/starship" init zsh --print-full-init)

  export PATH=${PATH}:`go env GOPATH`/bin
  unsetopt BEEP
