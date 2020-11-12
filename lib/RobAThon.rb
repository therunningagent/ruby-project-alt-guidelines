require_relative '../config/environment'

@@prompt = TTY::Prompt.new

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

    def characters
        Character.all.map { |character| character.name }
    end 

    ## main menu 

    def main_menu 
        choices = ["Make some $$$", "Game History", "High Score", "Delete Account"]

        selection = @@prompt.select("Main Menu", choices)

        case selection
        when "Make some $$$"
            select_character
        when "Game History"
            game_history
        when "High Score"
            history_score
        when "Delete Account"
            delete_user
        end 
    end 

    ## select_character

    def select_character
        character_choices = ["Speedy Gonzalez", "James Bond", "Cat Woman", "Super Woman", "Spongebob Squarepants"]

        selection = @@prompt.select("Choose your character", character_choices)

        case selection
        when "Speedy Gonzalez"
            sg = Character.all.select{ |character| character.name == "Speedy Gonzalez"}
            puts "You choose #{sg[0].name}, your health count is #{sg[0].health_count} and you have $#{sg[0].total_money} in the bank."
        when "James Bond"
            jb = Character.all.select{ |character| character.name == "James Bond"}
            puts "You choose #{jb[0].name}, your health count is #{jb[0].health_count} and you have $#{jb[0].total_money} in the bank."
        when "Cat Woman"
            cw = Character.all.select{ |character| character.name == "Cat Woman"}
            puts "You choose #{cw[0].name}, your health count is #{cw[0].health_count} and you have $#{cw[0].total_money} in the bank."
        when "Super Woman"
            sw = Character.all.select{ |character| character.name == "Super Woman"}
            puts "You choose #{sw[0].name}, your health count is #{sw[0].health_count} and you have $#{sw[0].total_money} in the bank."
        when "Spongebob Squarepants"
            ss = Character.all.select{ |character| character.name == "Spongebob Squarepants"}
            puts "You choose #{ss[0].name}, your health count is #{ss[0].health_count} and you have $#{ss[0].total_money} in the bank."
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
            run
        elsif user_input == 2
            fight
        elsif user_input == 3
            surrender
        elsif user_input == 4
            walk_away
        end 

    end 

    ## robber methods

    def run 
    end 

    def fight 
    end 

    def surrender 
    end 

    def walk_away 
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