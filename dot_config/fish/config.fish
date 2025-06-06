set brewcmd (path filter /opt/homebrew/bin/brew /usr/local/bin/brew)[1]
and $brewcmd shellenv | source
fish_add_path ~/.config/bin
fish_add_path ~/bin
fish_add_path ~/go/bin
fish_add_path ~/.local/share/bob/nvim-bin

[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.fish ]; and source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.fish

# width=20 so delta decorations don't wrap around small fzf preview pane
set fzf_diff_highlighter delta --paging=never --diff-so-fancy # --width=20
set fzf_preview_dir_cmd lsd --all --color always
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
abbr ff _fzf_search_directory
abbr fp _fzf_search_processes
abbr fv '_fzf_search_variables (set --show | psub) (set --names | psub)'
abbr fs _fzf_search_git_status
abbr fl _fzf_search_git_log
alias vim "NVIM_APPNAME=lazy nvim"
alias kv "NVIM_APPNAME=kickstart nvim"
alias av "NVIM_APPNAME=astro nvim"
alias nv "NVIM_APPNAME=nvchad nvim"
alias mmv "NVIM_APPNAME=mini nvim"
abbr v vim
abbr fco "vim ~/.config/fish/config.fish"
abbr fcr "cat ~/.config/fish/config.fish | source"
abbr por "cd ~/git/collibra/portal/"
abbr porser "cd ~/git/collibra/portal-service/"
abbr cms "chezmoi status"
abbr cmd "chezmoi diff"
abbr cmc "chezmoi cd"
abbr cma "chezmoi add"
abbr cmap "chezmoi apply"

alias thepry "cd ~/workspace/railspace && bundle exec pry -r './config/environment.rb'"

# TODO: move this to a function
alias git_current_branch "git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'"
abbr gst "git status"
# abbr gco "git checkout"
# abbr gcb "git checkout -b"
abbr gca "git commit --amend"
abbr gcmsg "git commit -m"
abbr gfo "git fetch origin"
abbr grhh! "git reset HEAD --hard"
abbr gpf! "git push --force-with-lease"
abbr ggpush 'git push origin "$(git_current_branch)"'
abbr ggpull 'git pull origin "$(git_current_branch)"'
abbr gunshallow 'git fetch --unshallow && git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*" && git fetch origin'
# abbr g "git status"
# abbr ga "git add ."
# abbr gb "git branch -v"
# abbr gc "git commit"
# abbr gca "git commit -av"
# abbr gcl "git clone"
# abbr gco "git checkout"
# abbr gcb "git checkout -b"
# abbr gcf " git checkout -- "
# abbr gcom "~/bin/git-to-master-cleanup-branch.sh"
# abbr gd "nvim +DiffviewOpen"
# abbr gf "git fetch --all"
# abbr ghd "gh dash"
# abbr gl "git pull"
# abbr gma "git merge --abort"
# abbr gmc "git merge --continue"
# abbr gp "git push"
# abbr gpom "git pull origin main"
# abbr gpr "gh pr create"
# abbr gpum "git pull upstream master"
# abbr gr "git remote"
# abbr gra "git remote add"
# abbr grc "git rebase --continue"
# abbr grao "git remote add origin"
# abbr grau "git remote add upstream"
# abbr grv "git remote -v"
# abbr gs "git status"
# abbr gst "git status"

abbr l "lsd  --group-dirs first -A"
abbr ld lazydocker
abbr lg lazygit
abbr ll "lsd  --group-dirs first -Al"
abbr lt "lsd  --group-dirs last -A --tree"

abbr rmr "rm -rf"

abbr s sesh_start
abbr s. "sesh connect ."
abbr sc "sesh connect"
abbr sa "SwitchAudioSource -t output -s (SwitchAudioSource -t output -a | fzf-tmux -p --reverse)"
abbr sai "SwitchAudioSource -t input -s (SwitchAudioSource -t input -a | fzf-tmux -p --reverse)"
abbr sao "SwitchAudioSource -t output -s (SwitchAudioSource -t output -a | fzf-tmux -p --reverse)"
abbr sb "sam build"
abbr sf "source ~/.config/fish/config.fish"
# TODO: move tmux conf?
# abbr st "tmux source ~/.config/tmux/tmux.conf"
abbr st "tmux source ~/.config/tmux/tmux.conf"

abbr vf "vim ~/.config/fish/config.fish"
abbr vt "vim ~/.config/tmux/tmux.conf"
abbr vw "vim ~/.config/wezterm/wezterm.lua"

abbr uuid "uuidgen | tr -d '\n' | tr '[:upper:]' '[:lower:]' | pbcopy && pbpaste && echo"

abbr c watch_fish_theme


set -x EDITOR vim
set -x MANPAGER "nvim +Man!"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -g fish_greeting

set -g TERM wezterm

fish_vi_key_bindings
set fish_vi_force_cursor 1 # fix cursor
# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
# Set the external cursor to a line. The external cursor appears when a command is started.
# The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
set fish_cursor_external line
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

function fzf --wraps=fzf --description="Use fzf-tmux if in tmux session"
    if set --query TMUX
        fzf-tmux $argv
    else
        command fzf $argv
    end
end

if type -qf direnv
    # Load a Node.js version from a .node-version or .nvmrc file
    # from this path when using 'use node'
    set -gx NODE_VERSIONS ~/.local/share/nvm
    set -gx NODE_VERSION_PREFIX v

    # Always keep at the end of this file
    direnv hook fish | source
end

# eval (zellij setup --generate-auto-start fish | string collect)
eval (zellij setup --generate-completion fish | string collect)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dan.hoizner/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/dan.hoizner/Downloads/google-cloud-sdk/path.fish.inc'
end

# ~/.config/fish/config.fish
if test "$VSCODE_RESOLVING_ENVIRONMENT" = 1
    ~/.local/bin/mise activate fish --shims | source
else if status is-interactive
    ~/.local/bin/mise activate fish | source
    atuin init fish | source
else
    ~/.local/bin/mise activate fish --shims | source
end

# pnpm
set -gx PNPM_HOME "/Users/dan.hoizner/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
