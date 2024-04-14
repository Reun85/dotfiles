
# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/paru -F --machinereadable -- "$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

# function in {
#     local pkg="$1"
#     echo "test"
#     if pacman -Si "$pkg" &>/dev/null ; then
#         sudo pacman -S "$pkg"
#     else 
#         "$aurhelper" -S "$pkg"
#     fi
# }

eval $(thefuck --alias)
set $SHELL = $(which zsh)
source ~/.config/zsh/.zshrc

PATH="/home/reun/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/reun/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/reun/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/reun/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/reun/perl5"; export PERL_MM_OPT;

