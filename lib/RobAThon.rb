require_relative '../config/environment'

class RobAThon

    def greeting
        puts "Welcome to Rob-a-thon!"
        sleep (0.75)
        puts "Are you a new robber? (Y or N)"
        user_response = gets.chomp
        if user_response == "Y"
            create_new_user
        else 
            sign_in
        end 
    end 
    
    def create_new_user
        sleep(0.75)
        system("clear")
        puts "Please enter a username."
        new_user_response = gets.chomp.to_s
        new_user = User.new(username: new_user_response)
        sleep(0.75)
        system("clear")
        puts "Thank you #{new_user.username}. It's time to make some $$$!"
        main_menu
    end 

    def sign_in
        puts "Welcome back. Please enter in your username."
        sign_in_response = gets.chomp
        if User.find_by(username: sign_in_response)
            puts "Hello #{sign_in_response}."
            main_menu
        else
            puts "Sorry we could not find your account. Please try again."
            sleep(5)
            system("clear")
            sign_in 
        end 
    end 

    ## main menu 

    def main_menu 
        puts "Main Menu"
        puts "1 - Make some $$$"
        puts "2 - Game History"
        puts "3 - High Score"

        user_input = gets.chomp.to_i
        if user_input == 1
            system("clear")
            select_character
        elsif user_input == 2
            system("clear")
            game_history
        elsif user_input == 3
            system("clear")
            history_score
        end 
    end

    ## select_character

    def characters
        Character.all.each { |character| character.name}
            puts character.name 
    end 

    def find_character
        Character.all.find { |character| character.name}
    end 

    def select_character

        p "Looks like you're ready to get down to business."
        p "Select your character"
        characters
        current_character = gets.chomp.to_s
        if Character.all.find { |character| character.name == current_character}
        start_game
        else 
            p "Nice try. Try again."
        end 
    end 

    ## start_game

    def start_game
        p "start game"

    end 

    ## game_history

    def game_history
    end 

    ## high_score

    def high_score
    end


end 