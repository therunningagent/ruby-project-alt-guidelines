require_relative '../config/environment'

class RobAThon

    ## greeting + user prompt

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
    end 

    def sign_in
        puts "Welcome back. Please enter in your username."
        sign_in_response = gets.chomp.to_s
        if User.find_by(username: sign_in_response)
            sleep(1.5)
            system("clear")
            puts "OH HELLO #{sign_in_response}. Let's go make some $$$!"
            sleep(1.5)
            system("clear")
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
            p "start_game"
        elsif user_input == 2
            p "game_history"
        elsif user_input == 3
            p "high_score"
        end 
    end

    ## start_game

    def start_game

        p "Looks like you're ready to get down to business."
        p "Select your character"
        p Character.all.map { |character| character.name}
        current_character = gets.chomp.to_s
        
    end 

    ## game_history

    ## high_score


end 