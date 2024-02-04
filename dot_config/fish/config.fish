if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path ~/bin

# width=20 so delta decorations don't wrap around small fzf preview pane
set fzf_diff_highlighter delta --paging=never --diff-so-fancy # --width=20
set fzf_preview_dir_cmd lsd --all --color always
abbr ff _fzf_search_directory
abbr fp _fzf_search_processes
abbr fv '_fzf_search_variables (set --show | psub) (set --names | psub)'
abbr fs _fzf_search_git_status
abbr fl _fzf_search_git_log
alias vim nvim
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

set -g EDITOR vim
set -g fish_greeting

direnv hook fish | source
zoxide init fish | source
