_sized_rand()
{
    local i chr='123456789abcdefABCDEF'

    for ((i=0; i<$1; i++))
    do
        printf '%c' ${chr:$RANDOM%${#chr}:1}
    done
}

bmktemp()
{
    local tpl=$1

    if ! [[ $1 =~ (.*)([^X]+)(X{6,})$ ]]
    # (.*)([^X]+): non-greedy (.*?) doesn't work
    then
        echo "bmktemp: 6 X minimum are required at the end of template '${1}'"

        return 1
    fi

    local filename

    while :
    do
        filename="${BASH_REMATCH[1]}${BASH_REMATCH[2]}$(_sized_rand ${#BASH_REMATCH[3]})"

        [[ -f $filename ]] || break
    done

    > $filename || return 1

    echo $filename
}
