for f in ~/.zs/*(.); do source $f; done

# hstr opts
setopt histignorespace
export HSTR_CONFIG=hicolor,no-confirm
bindkey -s "\C-r" "\C-a hstr -- \C-j"

# prompt
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sev3ryn/pure

# plugins
zinit light-mode lucid wait for \
  from"gh-r" as"program" \
      junegunn/fzf \
      agkozak/zsh-z \
      Aloxaf/fzf-tab

function refresh_ssh_autocomplete () {
    host_list=($(cat ~/.ssh/known_hosts | awk '{print "root@"$1}' | cut -d',' -f1))
    zstyle ':completion:*:(ssh|scp|sftp):*' hosts $host_list
    zstyle ':completion:*:(ssh|scp|sftp):*' users root sev3ryn
}
refresh_ssh_autocomplete


# custom completions
zinit light-mode lucid wait has"kubectl" for \
  id-as"kubectl_completion" \
  as"completion" \
  atclone"kubectl completion zsh > _kubectl" \
  atpull"%atclone" \
  run-atpull \
    zdharma/null

zinit light-mode lucid wait has"helm" for \
  id-as"helm_completion" \
  as"completion" \
  atclone"helm completion zsh > _helm" \
  atpull"%atclone" \
  run-atpull \
    zdharma/null

zinit light-mode lucid wait has"skaffold" for \
  id-as"skaffold_completion" \
  as"completion" \
  atclone"skaffold completion zsh > _skaffold" \
  atpull"%atclone" \
  run-atpull \
    zdharma/null

## always as last plugin
zinit wait lucid atload"_zsh_autosuggest_start; zicompinit; zicdreplay" for \
    zsh-users/zsh-autosuggestions

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions
