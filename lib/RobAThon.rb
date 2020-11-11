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
            sleep(1)
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
        puts "4 - Delete Account"

        user_input = gets.chomp.to_i
        if user_input == 1
            system("clear")
            puts "Looks like you're ready to get down to business."
            puts
            select_character
        elsif user_input == 2
            system("clear")
            game_history
        elsif user_input == 3
            system("clear")
            history_score
        elsif user_input == 4
            system("clear")
            delete_user
        end 
    end

    ## select_character

    def characters
        Character.all.map { |character| character.name }
    end 

    def find_character(current_character)
        Character.all.find { |character| character.name == current_character}
    end 

    def select_character
        
        puts "Choose your character"
        puts 
        puts characters
        current_character = gets.chomp.to_s
        if find_character(current_character)
        puts "Thank you #{current_character}. GO GET THEM!"
        sleep(1)
        system("clear")
        start_game
        else 
            puts "Nice try. Try again."
            sleep(3)
            system("clear")
            select_character
        end 
    end 

    # scenarios 

    def scenario
        location = ["Louis Vuitton", "Walmart", "Disney World", "Bank of America", "your friend's house", "Cartier"]
        location.sample
    end 

    def user_options
        puts "How would you like to proceed... It's your choice and yours alone."
        puts "1. Run"
        puts "2. FIGHT"
        puts "3. Surrender"
        puts "4. Walkaway" 
    end 

    ## start_game

    def start_game
        puts "I'll take you to #{scenario}.."
        sleep(1)
        user_options
        user_input = gets.chomp.to_i
        if user_input == 1 
            p "Run"
        elsif user_input == 2
            p "FIGHT"
        elsif user_input == 3
            p "Surrender"
        elsif user_input == 4
            p "Walkaway"
        end 

    end 

    ## robber methods

    def run 
    end 

    def fight 
    end 

    def surrender 
    end 

    def walkaway 
    end 

    ## different rounds 

    def round

    end 

    ## game_history

    def game_history
    end 

    ## high_score

    def high_score
    end

end 