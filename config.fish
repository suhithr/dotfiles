/opt/homebrew/bin/brew shellenv | source
if status is-interactive
    # Commands to run in interactive sessions can go here

# colorful ls
function ls
    command ls --color=auto $argv
end

# move up directories easily
# ... -> cd ../../
# .... -> cd ../../../
function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd
abbr --add gits git status


# Show the last command and working directory in the title
function fish_title
    # `prompt_pwd` shortens the title. This helps prevent tabs from becoming very wide.
    echo $argv[1] (prompt_pwd)
    pwd
end

end

