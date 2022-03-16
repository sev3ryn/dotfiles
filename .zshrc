for f in ~/.zs/*(.); do source $f; done

# prompt
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sev3ryn/pure


# plugins
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin
zinit ice multisrc'shell/{completion,key-bindings}.zsh'
zinit load junegunn/fzf

zinit light-mode lucid wait for \
  from"gh-r" as"program" \
      Aloxaf/fzf-tab

zinit load agkozak/zsh-z

zinit ice from"gh-r" as"command" mv"ripgrep* -> rg" pick"rg/rg"
zinit light BurntSushi/ripgrep

zinit ice from"gh-r" as"command" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

zinit ice from"gh-r" as"command" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

if [[ `uname` == "Darwin" ]]; then

zinit as"none" depth"1" \
  atclone"brew install hstr" \
  atpull"brew upgrade hstr" \
  atdelete"brew uninstall hstr" \
  for dvorka/hstr;

fi
# autocompletions
# ssh
function refresh_ssh_autocomplete () {
    host_list=($(cat ~/.ssh/known_hosts | awk '{print "root@"$1}' | cut -d',' -f1))
    zstyle ':completion:*:(ssh|scp|sftp):*' hosts $host_list
    zstyle ':completion:*:(ssh|scp|sftp):*' users root sev3ryn
}
refresh_ssh_autocomplete
# docker
zinit lucid has'docker' for \
  as'completion' is-snippet \
  'https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker' \
  \
  as'completion' is-snippet \
  'https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose'

# kubectl
zinit light-mode lucid wait has"kubectl" for \
  id-as"kubectl_completion" \
  as"completion" \
  atclone"kubectl completion zsh > _kubectl" \
  atpull"%atclone" \
  run-atpull \
    zdharma/null

# helm
zinit light-mode lucid wait has"helm" for \
  id-as"helm_completion" \
  as"completion" \
  atclone"helm completion zsh > _helm" \
  atpull"%atclone" \
  run-atpull \
    zdharma/null

# skaffold
zinit light-mode lucid wait has"skaffold" for \
  id-as"skaffold_completion" \
  as"completion" \
  atclone"skaffold completion zsh > _skaffold" \
  atpull"%atclone" \
  run-atpull \
    zdharma/null

# other completions
# should be done as last completion step
zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions

## always zsh_autosuggest as last plugin
zinit wait lucid atload"_zsh_autosuggest_start; zicompinit; zicdreplay" for \
    zsh-users/zsh-autosuggestions

# hstr opts
export HSTR_CONFIG=hicolor,no-confirm
bindkey -s "\C-r" "\C-a hstr -- \C-j"
if [ -e /Users/slisovskyi/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/slisovskyi/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# added by pipsi (https://github.com/mitsuhiko/pipsi)
export PATH="/Users/slisovskyi/.local/bin:$PATH"
