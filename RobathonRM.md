Rob-a-Thon

Created by Luis Torres and Thomas Garayua
========================

Welcome to Rob-A-Thon! Rob-A-Thon is a game where you're transformed into a robber. Your goal is to earn as much as money as possible before running out of money and/or health points.

---

## How to Use

Users can login/make an account that would save their game history. User can delete their account if they wish. 

1. Open Terminal 
2. Run `bundle install`
3. Run `ruby bin/run.rb`
4. Enjoy.

---

## Project Function Overview

**Main Menu**

- Sign In - Create a new user or log in as an existing user. 
- Main Menu - Open up the main menu. where you have the option to make money, display game history, display the user's high scores or delete your account.
- Make Some Money - Starts the game 
    - Run - Chance of escaping with earning money or losing health points and $500
    - Fight - Chance of you winning a $1000 bonus or losing HP
    - Surrender - Lose $1000 and gain 2 health points
    - Walk Away - End game and lock in a score
- Game History - Shows details on the games you played
- High Score - Displays the user's high score
- Delete User - Deletes the current user's account

## Application Specs:

**Text Editor**  
- `VSCode`

**Gems**

gem "activerecord", '~> 5.2'
gem "sinatra-activerecord"
gem "sqlite3", '~> 1.3.6'
gem "pry"
gem "require_all"
gem "faker"
gem "tty-prompt"
gem 'artii'
gem 'colorize'
gem "tty-spinner" 