set brewcmd (path filter /opt/homebrew/bin/brew /usr/local/bin/brew)[1]
and $brewcmd shellenv | source
fish_add_path ~/.config/bin
fish_add_path ~/bin
fish_add_path ~/go/bin

[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.fish ]; and source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.fish

# width=20 so delta decorations don't wrap around small fzf preview pane
set fzf_diff_highlighter delta --paging=never --diff-so-fancy # --width=20
set fzf_preview_dir_cmd lsd --all --color always
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


set -x EDITOR nvim
set -x MANPAGER "nvim +Man!"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -g fish_greeting

# Tide colors
set -g tide_aws_bg_color normal
set -g tide_aws_color FF9900
set -g tide_character_color a6d189
set -g tide_character_color_failure e78284
set -g tide_cmd_duration_bg_color normal
set -g tide_cmd_duration_color f2d5cf
set -g tide_context_bg_color normal
set -g tide_context_color_default D7AF87
set -g tide_context_color_root e5c890
set -g tide_context_color_ssh D7AF87
set -g tide_crystal_bg_color normal
set -g tide_crystal_color FFFFFF
set -g tide_direnv_bg_color normal
set -g tide_direnv_bg_color_denied normal
set -g tide_direnv_color e5c890
set -g tide_direnv_color_denied FF0000
set -g tide_distrobox_bg_color normal
set -g tide_distrobox_color FF00FF
set -g tide_docker_bg_color normal
set -g tide_docker_color 2496ED
set -g tide_elixir_bg_color normal
set -g tide_elixir_color 4E2A8E
set -g tide_gcloud_bg_color normal
set -g tide_gcloud_color 4285F4
set -g tide_git_bg_color normal
set -g tide_git_bg_color_unstable normal
set -g tide_git_bg_color_urgent normal
set -g tide_git_color_branch A6D189
set -g tide_git_color_conflicted FF0000
set -g tide_git_color_dirty E5C890
set -g tide_git_color_operation FF0000
set -g tide_git_color_staged D7AF00
set -g tide_git_color_stash a6d189
set -g tide_git_color_untracked 85c1dc
set -g tide_git_color_upstream 5FD700
set -g tide_go_bg_color normal
set -g tide_go_color 81c8be
set -g tide_java_bg_color normal
set -g tide_java_color ED8B00
set -g tide_jobs_bg_color normal
set -g tide_jobs_color 5FAF00
set -g tide_kubectl_bg_color normal
set -g tide_kubectl_color babbf1
set -g tide_left_prompt_separator_diff_color \x20
set -g tide_left_prompt_separator_same_color \x20
set -g tide_nix_shell_bg_color normal
set -g tide_nix_shell_color 7EBAE4
set -g tide_node_bg_color normal
set -g tide_node_color f4b8e4
set -g tide_os_bg_color normal
set -g tide_os_color normal
set -g tide_php_bg_color normal
set -g tide_php_color 617CBE
set -g tide_private_mode_bg_color normal
set -g tide_private_mode_color FFFFFF
set -g tide_prompt_color_frame_and_connection 6C6C6C
set -g tide_prompt_color_separator_same_color 949494
set -g tide_pulumi_bg_color normal
set -g tide_pulumi_color F7BF2A
set -g tide_pwd_bg_color normal
set -g tide_pwd_color_anchors 88D1DB
set -g tide_pwd_color_dirs 8CAAEE
set -g tide_pwd_color_truncated_dirs 8787AF
set -g tide_python_bg_color normal
set -g tide_python_color 00AFAF
set -g tide_right_prompt_separator_diff_color \x20
set -g tide_right_prompt_separator_same_color \x20
set -g tide_ruby_bg_color normal
set -g tide_ruby_color ea999c
set -g tide_rustc_bg_color normal
set -g tide_rustc_color F74C00
set -g tide_shlvl_bg_color normal
set -g tide_shlvl_color d78700
set -g tide_status_bg_color normal
set -g tide_status_bg_color_failure normal
set -g tide_status_color a6d189
set -g tide_status_color_failure e78284
set -g tide_terraform_bg_color normal
set -g tide_terraform_color 844FBA
set -g tide_time_bg_color normal
set -g tide_time_color 5F8787
set -g tide_toolbox_bg_color normal
set -g tide_toolbox_color 613583
set -g tide_vi_mode_bg_color_default normal
set -g tide_vi_mode_bg_color_insert normal
set -g tide_vi_mode_bg_color_replace normal
set -g tide_vi_mode_bg_color_visual normal
set -g tide_vi_mode_color_default 949494
set -g tide_vi_mode_color_insert 87AFAF
set -g tide_vi_mode_color_replace 87AF87
set -g tide_vi_mode_color_visual FF8700
set -g tide_zig_bg_color normal
set -g tide_zig_color F7A41D
set -g tide_aws_icon \uf270
set -g tide_character_icon \u276f
set -g tide_character_vi_icon_default \u276e
set -g tide_character_vi_icon_replace \u25b6
set -g tide_character_vi_icon_visual V
set -g tide_cmd_duration_decimals 0
set -g tide_cmd_duration_icon \uf252
set -g tide_cmd_duration_threshold 3000
set -g tide_context_always_display false
set -g tide_context_hostname_parts 1
set -g tide_crystal_icon \ue62f
set -g tide_direnv_icon \u25bc
set -g tide_distrobox_icon \U000f01a7
set -g tide_docker_default_contexts default\x1ecolima
set -g tide_docker_icon \uf308
set -g tide_elixir_icon \ue62d
set -g tide_gcloud_icon \U000f02ad
set -g tide_git_icon \uf1d3
set -g tide_git_truncation_length 24
set -g tide_git_truncation_strategy ''
set -g tide_go_icon \ue627
set -g tide_java_icon \ue256
set -g tide_jobs_icon \uf013
set -g tide_jobs_number_threshold 1000
set -g tide_kubectl_icon \U000f10fe
set -g tide_left_prompt_frame_enabled false
set -g tide_left_prompt_items os\x1epwd\x1egit\x1enewline\x1echaracter
set -g tide_left_prompt_prefix ''
set -g tide_left_prompt_suffix \x20
set -g tide_nix_shell_icon \uf313
set -g tide_node_icon \ue24f
set -g tide_os_icon \uf179
set -g tide_php_icon \ue608
set -g tide_private_mode_icon \U000f05f9
set -g tide_prompt_add_newline_before false
set -g tide_prompt_icon_connection \x20
set -g tide_prompt_min_cols 34
set -g tide_prompt_pad_items false
set -g tide_prompt_transient_enabled true
set -g tide_pulumi_icon \uf1b2
set -g tide_pwd_icon \uf07c
set -g tide_pwd_icon_home \uf015
set -g tide_pwd_icon_unwritable \uf023
set -g tide_pwd_markers \x2ebzr\x1e\x2ecitc\x1e\x2egit\x1e\x2ehg\x1e\x2enode\x2dversion\x1e\x2epython\x2dversion\x1e\x2eruby\x2dversion\x1e\x2eshorten_folder_marker\x1e\x2esvn\x1e\x2eterraform\x1eCargo\x2etoml\x1ecomposer\x2ejson\x1eCVS\x1ego\x2emod\x1epackage\x2ejson\x1ebuild\x2ezig
set -g tide_python_icon \U000f0320
set -g tide_right_prompt_frame_enabled false
set -g tide_right_prompt_items status\x1ecmd_duration\x1econtext\x1ejobs\x1edirenv\x1enode\x1epython\x1erustc\x1ejava\x1ephp\x1epulumi\x1eruby\x1ego\x1egcloud\x1ekubectl\x1edistrobox\x1etoolbox\x1eterraform\x1eaws\x1enix_shell\x1ecrystal\x1eelixir\x1ezig
set -g tide_right_prompt_prefix \x20
set -g tide_right_prompt_suffix ''
set -g tide_ruby_icon \ue23e
set -g tide_rustc_icon \ue7a8
set -g tide_shlvl_icon \uf120
set -g tide_shlvl_threshold 1
set -g tide_status_icon \u2714
set -g tide_status_icon_failure \u2718
set -g tide_terraform_icon \U000f1062
set -g tide_time_format ''
set -g tide_toolbox_icon \ue24f
set -g tide_vi_mode_icon_default D
set -g tide_vi_mode_icon_insert I
set -g tide_vi_mode_icon_replace R
set -g tide_vi_mode_icon_visual V
set -g tide_zig_icon \ue6a9

fish_vi_key_bindings

if type -qf direnv
    # Load a Node.js version from a .node-version or .nvmrc file
    # from this path when using 'use node'
    set -gx NODE_VERSIONS ~/.local/share/nvm
    set -gx NODE_VERSION_PREFIX v

    # Always keep at the end of this file
    direnv hook fish | source
end

zoxide init fish | source

pyenv init - | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dan.hoizner/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/dan.hoizner/Downloads/google-cloud-sdk/path.fish.inc'
end
