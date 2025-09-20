#!/bin/bash

# Database menu for tables
while true
do
    echo "-------------------------"
    echo " Database Menu"
    echo "-------------------------"
    echo "1) Create Table"
    echo "2) List Tables"
    echo "3) Drop Table"
    echo "4) Insert into Table"
    echo "5) Select From Table"
    echo "6) Delete From Table"
    echo "7) Update Table"
    echo "8) Back to Main Menu"
    echo "-------------------------"

    read -p "Enter option: " option

    case $option in
        1)  # Create Table
            read -p "Enter table name: " tname
            if [ -f "$tname" ]; then
                echo "Table already exists."
            else
                read -p "Enter column names (separated by |): " cols
                echo "$cols" > "$tname"
                echo "Table '$tname' created with columns: $cols"
            fi
            ;;

        2)  # List Tables
            echo "Tables:"
            ls
            ;;

        3)  # Drop Table
            read -p "Enter table name: " tname
            if [ -f "$tname" ]; then
                rm "$tname"
                echo "Table '$tname' dropped."
            else
                echo "Table not found."
            fi
            ;;

        4)  # Insert into Table
            read -p "Enter table name: " tname
            if [ -f "$tname" ]; then
                header=$(head -n 1 "$tname")
                echo "Columns: $header"
                read -p "Enter values separated by | : " row
                echo "$row" >> "$tname"
                echo "Row inserted."
            else
                echo "Table not found."
            fi
            ;;

        5)  # Select From Table
            read -p "Enter table name: " tname
            if [ -f "$tname" ]; then
                cat "$tname" | column -t -s"|"
            else
                echo "Table not found."
            fi
            ;;

        6)  # Delete From Table
            read -p "Enter table name: " tname
            if [ -f "$tname" ]; then
                read -p "Enter search word/ID to delete: " filter
                sed -i "/$filter/d" "$tname"
                echo "Rows containing '$filter' deleted."
            else
                echo "Table not found."
            fi
            ;;

        7)  # Update Table
            read -p "Enter table name: " tname
            if [ -f "$tname" ]; then
                read -p "Enter search word/ID to update: " search
                read -p "Enter new line (full row with | separators): " newline
                sed -i "s/.*$search.*/$newline/" "$tname"
                echo "Row updated."
            else
                echo "Table not found."
            fi
            ;;

        8)  # Back to Main Menu
            echo "Returning to main menu..."
            break
            ;;

        *)  # Invalid option
            echo "Invalid choice, try again."
            ;;
    esac
done

