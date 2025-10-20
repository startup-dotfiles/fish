# Refs: /usr/share/fish/tools/web_config/sample_prompts/

function fish_prompt --description 'Informative prompt'
    # Save the return status of the previous command
    set -l last_status       $status
    set -l status_color      (set_color brgreen)
    # set -l status_bold_color (set_color --bold $fish_color_status)
    set -l prompt_status ""

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    # Local variables
    set -l separator ' '
    set -l nextline printf

    set -l normal_color (set_color normal)
    set -l login_color  (set_color brblue)
    set -l cwd_color    (set_color $fish_color_cwd)
    set -l vcs_color    (set_color brpurple)
    set -l time_status "[" (date "+%H:%M:%S") "]"
    set -l login_prompt $USER '@' (prompt_hostname) #(prompt_login)
    set -l cwd_prompt   (prompt_pwd) #$PWD
    set -l vcs_prompt   (fish_vcs_prompt)

    # Color the prompt differently when we're root
    set -l prompt_suffix '$'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
             set cwd_color (set_color $fish_color_cwd_root)
        end
        set prompt_suffix '#'
    end

    # Color the prompt in red on error
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error)
        set prompt_status $status_color "[" $last_status "]" $normal
    end

    # Prompt
    #          # colors       prompts
    echo -s $normal_color  $time_status   $separator \
            $login_color   $login_prompt  $separator \
            $cwd_color     $cwd_prompt               \
            $vcs_color     $vcs_prompt    $separator \
            $normal_color  $prompt_status            \
            $normal_color
    $nextline
    echo -s $status_color  $prompt_suffix $separator \
            $normal_color
end
