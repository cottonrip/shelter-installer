#!/bin/bash

clear

show_menu() {
    echo "shelter installer for linux"
    echo ""
    echo "1) install"
    echo "2) apply / update"
    echo "3) uninstall"
    echo "4) exit"
}

# Main loop to keep the menu running until the user chooses to exit
while true; do
    show_menu  # Display the menu

    # Read the user's choice
    read -p "please choose an option (1-4): " choice

    # Handle the user's choice
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
                echo ""
                rm "/opt/discord/resources/app"
                mkdir "/opt/discord/resources/app"
                wget --quiet -O "/opt/discord/resources/app/index.js" "https://raw.githubusercontent.com/uwu/shelter/refs/heads/main/injectors/desktop/app/index.js"
                wget --quiet -O "/opt/discord/resources/app/package.json" "https://raw.githubusercontent.com/uwu/shelter/refs/heads/main/injectors/desktop/app/package.json"
                wget --quiet -O "/opt/discord/resources/app/preload.js" "https://raw.githubusercontent.com/uwu/shelter/refs/heads/main/injectors/desktop/app/preload.js"
                echo "shelter successfully installed. you can now open Discord. quitting..."
            sleep 1
            exit 0
            ;;
        3)
            clear
                echo "uninstalling..."
                rm "/opt/discord/resources/app"
                cd "/opt/discord/resources/"
                mv original.asar app.asar
                echo "shelter has been successfully uninstalled"
            sleep 1
            exit 0
            ;;
        4)
            echo "Exiting..."
            exit 0  # Exit the script
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
