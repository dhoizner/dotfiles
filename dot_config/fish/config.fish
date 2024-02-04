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

direnv hook fish | source
zoxide init fish | source
