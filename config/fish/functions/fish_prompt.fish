function fish_prompt --description 'Write out the prompt'
	
	set -l last_status $status

    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	# PWD
    set_color brown
	echo -n $USER
    set_color normal
    echo -n @
    set_color green
    echo -n $__fish_prompt_hostname
    set_color $fish_color_cwd
	echo -n ' '(prompt_pwd)
	set_color normal

	printf '%s ' (__fish_git_prompt)

    echo
	echo -n '> '

end
