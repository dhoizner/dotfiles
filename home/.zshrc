eval "$(starship init zsh)"

export GOROOT="/usr/local/go"
export GOPATH="/Users/dan.hoizner/go"
export PATH="$HOME/.emacs.d/bin:$PATH:$GOROOT/bin:$GOPATH/bin"
export PATH="$PATH:/usr/local/protobuf/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/dan.hoizner/.sdkman"
[[ -s "/Users/dan.hoizner/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dan.hoizner/.sdkman/bin/sdkman-init.sh"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias isvg="rsvg-convert | imgcat"
alias idot="dot -Tsvg -Gbgcolor=#282a36 -Ncolor=#f8f8f2 -Nfontcolor=#f8f8f2 -Ecolor=#f8f8f2 -Efontcolor=#f8f8f2 -Gfontcolor=#f8f8f2 -Gcolor=#f8f8f2 -Gpad=0.1pt| isvg"
alias ig="./gradlew"
alias igb="./gradlew build"
alias igbnc="./gradlew clean && ./gradlew build --no-build-cache"
alias igbci="./gradlew build -PdislContext=ci"
alias igc="./gradlew clean"
alias igt="./gradlew test"

alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"

alias g="git"
alias gf="git fetch"
alias gp="git pull"
alias gc="git commit"
alias gca="git commit --amend"

alias l4s="java -jar ~/git/mergebase/log4j-detector/target/log4j-detector-2021.12.14.jar"
alias l4srg="rg 'log4j-core|log4j2'"
alias l4sf="find . -name '*log4j-core*' -o -name '*log4j2*'"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

source ~/.collibra_secrets
