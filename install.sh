#!/bin/bash

clear

show_menu() {
    echo "by cotton.rip"
    echo "shelter installer for linux"
    echo ""
    echo "1) install"
    echo "2) apply / update"
    echo "3) uninstall"
    echo "4) exit"
    echo "5) open github repository"
}

while true; do
    show_menu

    read -p "please choose an option (1-4): " choice

    case $choice in
        1)
            clear
            echo "killing discord..."
            killall --quiet discord
            echo "modifying app.asar..."
            cd "/opt/discord/resources" || { echo "folder not found. make sure you have discord installed."; exit 1; }
            mv app.asar original.asar || { echo "make sure you launch as root (sudo su)"; exit 1; }
            echo "installing..."
            mkdir "/opt/discord/resources/app"
            wget --quiet -O "/opt/discord/resources/app/index.js" "https://raw.githubusercontent.com/uwu/shelter/refs/heads/main/injectors/desktop/app/index.js"
            wget --quiet -O "/opt/discord/resources/app/package.json" "https://raw.githubusercontent.com/uwu/shelter/refs/heads/main/injectors/desktop/app/package.json"
            wget --quiet -O "/opt/discord/resources/app/preload.js" "https://raw.githubusercontent.com/uwu/shelter/refs/heads/main/injectors/desktop/app/preload.js"
            echo "shelter successfully installed. you can now open Discord. quitting..."
            sleep 1
            exit 0
            ;;
        2)
            clear
            echo "killing discord..."
            killall --quiet discord
            echo "checking if app.asar is renamed..."
            if [ ! -e "/opt/discord/resources/app.asar/" ]; then
                echo "it is!"
                cd "/opt/discord/resources/"
                mv app.asar original.asar
            fi
            echo "applying..."
            rm -rf "/opt/discord/resources/app"  # Use -rf to remove the directory
            mkdir "/opt/discord/resources/app"
            wget --quiet -O "/opt/discord/resources/app/index.js" "https://raw.githubusercontent.com/uwu/shelter/refs/heads/main/injectors/desktop/app/index.js"
            wget --quiet -O "/opt/discord/resources/app/package.json" "https://raw.githubusercontent.com/uwu/shelter/refs/heads/main/injectors/desktop/app/package.json"
            wget --quiet -O "/opt/discord/resources/app/preload.js" "https://raw.githubusercontent.com/uwu/shelter/refs/heads/main/injectors/desktop/app/preload.js"
            echo "shelter successfully updated. you can now open Discord. quitting..."
            sleep 1
            exit 0
            ;;
        3)
            clear
            echo "uninstalling..."
            rm -rf "/opt/discord/resources/app"  # Use -rf to remove the directory
            cd "/opt/discord/resources/"
            mv original.asar app.asar
            echo "shelter has been successfully uninstalled"
            sleep 1
            exit 0
            ;;
        4)
            echo "exiting..."
            exit 0  # Exit the script
            ;;
        5)
            echo "opening in browser..."
            xdg-open "https://github.com/cottonrip/shelter-installer/"
            exit 0
            ;;
        *)
            echo "invalid option. please try again."
            ;;
    esac
done
