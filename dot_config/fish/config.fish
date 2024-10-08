set -Ux PYENV_ROOT $HOME/.pyenv

switch (uname -m)
    case x86_64
        set -g HOMEBREW_INSTALL_PATH /usr/local/bin

        fish_add_path -g /usr/local/sbin
    case aarch_64
        set -g HOMEBREW_INSTALL_PATH /opt/homebrew/

        fish_add_path -g $HOMEBREW_INSTALL_PATH/bin
        fish_add_path -g $HOMEBREW_INSTALL_PATH/sbin

end


fish_add_path -g ~/.local/bin
fish_add_path -g /usr/local/opt/gnu-sed/libexec/gnubin
fish_add_path -g $PYENV_ROOT/bin
fish_add_path -g $CARGO_HOME/bin
fish_add_path -g $GOPATH/bin

set -gx LDFLAGS -L$HOMEBREW_INSTALL_PATH/llvm/lib
set -gx CPPFLAGS -I$HOMEBREW_INSTALL_PATH/llvm/include

set -gx EDITOR nvim

# suppress the default login message
set -g fish_greeting

# Allow installing casks in non-admin systems
set -gx HOMEBREW_CASK_OPTS --appdir=~/Applications



if type -q bat
    abbr cat bat
end

if type -q eza
    function eza --wraps eza
        command eza --git --group-directories-first --hyperlink --icons=auto $argv
    end
    abbr ls eza
    abbr la eza -a
    abbr ll eza -l
    abbr lla eza -la
    abbr lt eza -T
end

if type -q fzf
    # Mac keyboard
    # directory = "option + f"
    # git_log = "option + l"
    # git_status = "option + s"
    # processes = "option + p"
    # history = "option + r"
    # variables = "option + v"
    fzf_configure_bindings --directory=ƒ --git_log=¬ --git_status=ß --processes=π \
        --history=® --variables=√

    if type -q eza
        set fzf_preview_dir_cmd eza --tree --color=always
    end

    if type -q delta
        set fzf_diff_highlighter delta --paging=never --width=20 --no-gitconfig
    end
end

if type -q pyenv
    pyenv init - | source
end

if type -q starship && type -q fish
    function starship_transient_prompt_func
        set -l _username (starship module username)
        set -l _colour_bg_username (set_color "0c121c")
        set -l rprompt (printf "%s%s " $_username $_colour_bg_username)
        echo $rprompt
    end

    function starship_transient_rprompt_func
        starship module time
    end
    starship init fish | source
    enable_transience

    # Starship newline conf disables newline at the beginning of a new shell
    # but also after every command. This adds a newline after each command.
    function newline --on-event fish_postexec
        echo
    end
end

abbr !! sudo vf

abbr dps 'docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'

abbr ga git add
abbr gb git branch
abbr gc git commit
abbr gr git rebase
abbr gs git status
abbr gsw git switch

abbr kbp kubectl get pods
abbr kbx kubectl exec -it

abbr lg lazygit
