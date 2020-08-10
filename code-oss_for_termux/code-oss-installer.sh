#!/data/data/com.termux/files/usr/bin/bash -e
PREFIX=/data/data/com.termux/files
function ask() {
    # http://djm.me/ask
    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question
        printf "${light_cyan}\n[?] "
        read -p "$1 [$prompt] " REPLY

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        printf "${reset}"

        # Check if the reply is valid
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}
function check_dependencies() {
    printf "${blue}\n[*] Checking package dependencies...${reset}\n"
    apt update -y &> /dev/null

    for i in figlet bash; do
        if [ -e $PREFIX/bin/$i ]; then
            echo "  $i is OK"
        else
            printf "Installing ${i}...\n"
            apt install -y $i || {
                printf "${red}ERROR: Failed to install packages.\n Exiting.\n${reset}"
	        exit
            }
        fi
    done
    apt upgrade -y
}

function get_pip() {
    clear
    printf "\n\e[1;34m checking for python and gdowm\n\n\e[0m"
    for b in python pip; do 
    if [ -e $PREFIX/bin/$b ]; then
    echo "  $b is ok :-)"
    printf "\e[1;34mdone .... but wait \e[0m "
    else
        printf "\e[1;36m $b is missing \n fixing \e[0m"
        printf "\e[1;34m installing $b"
        pkg install -y python
        printf "setting up pip to the latest version"
        pip install --upgrade pip || {
           printf "\e[1;31m[ ;-( ] somthing happened failed installing packages $b \n try checking or reset your internet connectiion\e[0m"
           exit
        }
    fi
done
}
function get_gdown() {
    for c in gdown; do
    if [ -e $PREFIX/usr/$c ]; then
    echo "  $c is ok"
    else
    printf "installing gdown"
    pip install gdown || {
        print "installaton error"
        exit
    }
    fi

done
}

function getinstaller() {
    cd $PREFIX/home
    figlet GettingThings
    gdown -O codeossInstall https://drive.google.com/uc?id=1hOc5Ivn_Bau31tXsLuq7-agrDJbHwg6P
    chmod +x codeossInstall
    ./codeossInstall
}
function sequencer() {
    clear
    check_dependencies
    figlet Code-oss1X1
    printf "\n Do you want install code-os "
    ask
    printf "\n do yo opened xserver xsdl app"
    ask
    clear
    figlet Starting
    printf "\e[1;35m Starting code-oss installation in 2 seeconds"
    sleep 1
    printf "\n 1 \n"
    sleep 1
    printf "\n 2 \n"
    clear
    printf "\e[0m"
    figlet Go!
    check_dependencies
    get_pip
    get_gdown
    getinstaller

}
############
sequencer
